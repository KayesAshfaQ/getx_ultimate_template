import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:get/get.dart' hide Response;
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sl_v4/app/core/common_widgets/app_snackbars.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';
import 'package:sl_v4/app/core/config/app_config.dart';
import 'package:sl_v4/app/core/utils/get_storage_helper.dart';
import 'package:sl_v4/app/core/utils/misc.dart';
import 'package:sl_v4/app/services/result.dart';

import '../core/config/app_constants.dart';
import '../core/connection_manager/connection_manager_controller.dart';
import '../core/localization/strings_enum.dart';
import 'api_exceptions.dart';

enum RequestType {
  get,
  post,
  put,
  patch,
  delete,
}

// TODO: header customization (isMobile: ture, justForYou keys, etc...)
// TODO: caching mechanism

class ApiClient {
  static final Dio _dio = Dio(
    BaseOptions(
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    ),
  );

  static final _prettyDioLog = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  );

  // request timeout (default 10 seconds)
  static const int _timeoutInSeconds = 10;

  /// dio getter (used for testing)
  static get dio => _dio;

  /// connection manager
  /// used to check the internet connection before making the api call
  static final _connectionManager = Get.find<ConnectionManagerController>();

  /// perform safe api request
  static Future<Result<Response<Map<String, dynamic>>, ApiException>> call(
    String url,
    RequestType requestType, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Function(int value, int progress)? onReceiveProgress,
    Function(int total, int progress)? onSendProgress, // while sending (uploading) progress
    bool isAuthorizationRequired = true,
    bool isLoaderRequired = false,
    bool isLogRequired = false,
    bool isRetryRequired = false,
    bool isErrorToastRequired = true,
    bool isCacheRequired = false,
    dynamic data,
  }) async {
    try {
      // check the internet connection before making the api call (if there is no internet connection, then return)
      if (!_checkInternetConnection()) {
        return Result.error(
          ApiException(
            message: Strings.noInternetConnection.tr,
            url: url,
          ),
        );
      }

      // add pretty logger if showLog is true
      _dio.interceptors.addIf(isLogRequired, _prettyDioLog);

      // add retry interceptor
      _dio.interceptors.addIf(isRetryRequired, getRetryInterceptor());

      // Add cache interceptor with global/default options
      _dio.interceptors.addIf(
        isCacheRequired,
        DioCacheInterceptor(options: await getCacheOptions()),
      );

      // if the api is authorized, then add token to the header
      if (isAuthorizationRequired) {
        //Get token from local
        final String? token = GetStorageHelper.get(authTokenKey);

        //If token is available, then add token inside header.
        if (token != null) {
          final tokenHeader = {"Authorization": "Bearer $token"};
          headers == null ? headers = tokenHeader : headers.addAll(tokenHeader);
        }
      }

      // 1) indicate loading state
      if (isLoaderRequired) {
        showLoader();
      }

      // 2) try to perform http request
      late Response<Map<String, dynamic>> response;
      if (requestType == RequestType.get) {
        response = await _dio.get(
          url,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
          data: data,
        );
      } else if (requestType == RequestType.post) {
        response = await _dio.post(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else if (requestType == RequestType.put) {
        response = await _dio.put(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else if (requestType == RequestType.patch) {
        response = await _dio.patch(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else {
        response = await _dio.delete(
          url,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      }

      // 3) hide loader if it's showing
      if (isLoaderRequired) hideLoader();

      // 4) return response (api done successfully)
      return Result.success(response);
    } on DioException catch (error) {
      // dio error (api reach the server but not performed successfully
      return _handleDioError(error: error, url: url, isErrorToastRequired: isErrorToastRequired);
    } on SocketException {
      // No internet connection
      return _handleSocketException(url: url, isErrorToastRequired: isErrorToastRequired);
    } on TimeoutException {
      // Api call went out of time
      return _handleTimeoutException(url: url, isErrorToastRequired: isErrorToastRequired);
    } catch (error, stackTrace) {
      // print the line of code that throw unexpected exception
      printLog(error.toString(), level: Level.error, stackTrace: stackTrace);
      // unexpected error for example (parsing json error)
      return _handleUnexpectedException(
        url: url,
        error: error,
        isErrorToastRequired: isErrorToastRequired,
      );
    }
  }

  /// download file
  static Future<Result<Response, ApiException>> download({
    required String url, // file url
    required String savePath, // where to save file
    Function(int value, int progress)? onReceiveProgress,
    bool isLogRequired = false,
    bool isLoaderRequired = false,
    bool isErrorToastRequired = true,
  }) async {
    try {
      // check the internet connection before making the api call (if there is no internet connection, then return)
      if (!_checkInternetConnection()) {
        return Result.error(
          ApiException(
            message: Strings.noInternetConnection.tr,
            url: url,
          ),
        );
      }

      // add pretty logger if showLog is true
      _dio.interceptors.addIf(isLogRequired, _prettyDioLog);

      // indicate loading state
      if (isLoaderRequired) showLoader();

      final response = await _dio.download(
        url,
        savePath,
        options: Options(
            receiveTimeout: const Duration(seconds: _timeoutInSeconds),
            sendTimeout: const Duration(seconds: _timeoutInSeconds)),
        onReceiveProgress: onReceiveProgress,
      );

      return Result.success(response);
    } catch (error) {
      final exception = ApiException(url: url, message: error.toString());
      return _handleError(showToast: isErrorToastRequired, exception);
    }
  }

  static getRetryInterceptor() {
    return RetryInterceptor(
      dio: _dio,
      logPrint: print, // specify log function (optional)
      retries: 3, // retry count (optional)
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before first retry
        Duration(seconds: 2), // wait 2 sec before second retry
        Duration(seconds: 3), // wait 3 sec before third retry
      ],
    );
  }

  /// cache options
  static Future<CacheOptions> getCacheOptions() async {
    var cacheDir = await path.getTemporaryDirectory();

    var cacheStore = HiveCacheStore(
      cacheDir.path,
      hiveBoxName: AppConfig.appName,
    );

    // add cache interceptor
    // Global options
    final options = CacheOptions(
      // A default store is required for interceptor.
      store: cacheStore,

      // All subsequent fields are optional.

      // Default.
      policy: CachePolicy.request,
      // Returns a cached response on error but for statuses 401 & 403.
      // Also allows to return a cached response on network errors (e.g. offline usage).
      // Defaults to [null].
      hitCacheOnErrorExcept: [401, 403],
      // Overrides any HTTP directive to delete entry past this duration.
      // Useful only when origin server has no cache config or custom behaviour is desired.
      // Defaults to [null].
      maxStale: const Duration(days: 1),
      // Default. Allows 3 cache sets and ease cleanup.
      priority: CachePriority.normal,
      // Default. Body and headers encryption with your own algorithm.
      cipher: null,
      // Default. Key builder to retrieve requests.
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      // Default. Allows to cache POST requests.
      // Overriding [keyBuilder] is strongly recommended when [true].
      allowPostMethod: false,
    );

    return options;
  }

  /// check internet connection
  static bool _checkInternetConnection() {
    // check the internet connection before making the api call (if there is no internet connection, then return)
    if (!_connectionManager.isInternetConnected.value) {
      printLog(
        'internet connection status: ${_connectionManager.connectionStatusMessage.value}',
        level: Level.error,
      );
      return false;
    } else {
      return true;
    }
  }

  /// handle unexpected error
  static Result<Response<Map<String, dynamic>>, ApiException> _handleUnexpectedException({
    required String url,
    required Object error,
    required bool isErrorToastRequired,
  }) {
   return _handleError(
      showToast: isErrorToastRequired,
      ApiException(
        message: error.toString(),
        url: url,
      ),
    );
  }

  /// handle timeout exception
  static Result<Response<Map<String, dynamic>>, ApiException> _handleTimeoutException({required String url, required bool isErrorToastRequired}) {
   return _handleError(
      showToast: isErrorToastRequired,
      ApiException(
        message: Strings.serverNotResponding.tr,
        url: url,
      ),
    );
  }

  /// handle no internet connection exception
  static Result<Response<Map<String, dynamic>>, ApiException> _handleSocketException({
    required String url,
    required bool isErrorToastRequired,
  }) {
    return _handleError(
      showToast: isErrorToastRequired,
      ApiException(
        message: Strings.noInternetConnection.tr,
        url: url,
      ),
    );
  }

  /// handle Dio error
  static Result<Response<Map<String, dynamic>>, ApiException> _handleDioError({
    required DioException error,
    required String url,
    required bool isErrorToastRequired,
  }) {
    // 404 error
    if (error.response?.statusCode == 404) {
      return _handleError(
        showToast: isErrorToastRequired,
        ApiException(
          message: Strings.urlNotFound.tr,
          url: url,
          statusCode: 404,
        ),
      );
    }

    // no internet connection
    if (error.message != null && error.message!.toLowerCase().contains('socket')) {
      return _handleSocketException(isErrorToastRequired: isErrorToastRequired, url: url);
    }

    // check if the error is 500 (server problem)
    if (error.response?.statusCode == 500) {
      return _handleError(
        showToast: isErrorToastRequired,
        ApiException(
          message: Strings.serverError.tr,
          url: url,
          statusCode: 500,
          response: error.response,
        ),
      );
    }

    return _handleError(
      showToast: isErrorToastRequired,
      ApiException(
        url: url,
        message: error.message ?? 'Un Expected Api Error!',
        response: error.response,
        statusCode: error.response?.statusCode,
      ),
    );
  }

  /// handle error automatically (if user didn't pass onError) method
  /// it will try to show the message from api if there is no message
  /// from api it will show the reason (the dio message)
  static Result<Response<Map<String, dynamic>>, ApiException> _handleError(
      ApiException apiException,
      {required bool showToast}) {
    String msg = apiException.toString();
    AppSnackbars.showCustomToast(message: msg, color: AppColors.error);

    // hide loader again in case error occurred and a loader still showing
    hideLoader();

    return Result.error(apiException);
  }
}

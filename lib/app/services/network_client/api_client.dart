import 'dart:async';
import 'dart:io';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:path_provider/path_provider.dart' as path;

import '../../core/components/app_snackbars.dart';
import '../../core/config/app_colors.dart';
import '../../core/config/app_config.dart';
import '../../core/config/app_keys.dart';
import '../../core/config/remote_config.dart';
import '../../core/connection_manager/connection_manager_controller.dart';
import '../../core/localization/strings_enum.dart';
import '../../core/utils/get_storage_helper.dart';
import '../../core/utils/misc.dart';
import 'api_exceptions.dart';
import 'result.dart';

typedef ApiResponse = Result<Response, ApiException>;

enum RequestType {
  get,
  post,
  put,
  patch,
  delete,
}

// TODO: header customization (isMobile: true, justForYou keys, etc...)

class ApiClient {
  // request timeout (default 10 seconds)
  static const int _timeoutInSeconds = 10;

  /// connection manager
  /// used to check the internet connection before making the api call
  //static final _connectionManager = Get.find<ConnectionManagerController>();

  /// `call` is a method used to make HTTP requests.
  ///
  /// Parameters:
  /// - `url`: The URL to which the request is to be made.
  /// - `requestType`: The type of HTTP request (GET, POST, PUT, PATCH, DELETE).
  /// - `headers`: Optional. A map of headers to be included in the request.
  /// - `queryParameters`: Optional. A map of query parameters to be included in the request.
  /// - `onReceiveProgress`: Optional. A callback function to handle progress updates while receiving data.
  /// - `onSendProgress`: Optional. A callback function to handle progress updates while sending data.
  /// - `isAuthorizationRequired`: Optional. A boolean indicating whether authorization is required for the request. Default is true.
  /// - `isLoaderRequired`: Optional. A boolean indicating whether to show a loader during the request. Default is false.
  /// - `isLogRequired`: Optional. A boolean indicating whether to log the request and response data. Default is false.
  /// - `isRetryRequired`: Optional. A boolean indicating whether to retry the request if it fails. Default is false.
  /// - `isErrorToastRequired`: Optional. A boolean indicating whether to show a toast message if an error occurs. Default is true.
  /// - `isCacheRequired`: Optional. A boolean indicating whether to cache the response. Default is false.
  /// - `data`: Optional. The data to be sent with the request.
  ///
  /// Returns:
  /// A `Future` that completes with a `Result` of either a successful `Response<Map<String, dynamic>>` or an `ApiException`.
  ///
  /// This method first checks the internet connection. If there is no internet connection, it returns an `ApiException` with a message indicating no internet connection.
  /// If logging is required, it adds a pretty logger to the Dio interceptors.
  /// If retrying is required, it adds a retry interceptor to the Dio interceptors.
  /// If caching is required, it adds a cache interceptor to the Dio interceptors.
  /// If authorization is required, it gets the token from local storage and adds it to the headers.
  /// If a loader is required, it shows a loader before making the request and hides it after the request is completed.
  /// It then makes the HTTP request using the Dio library. If the request is successful, it returns a `Result` with the response. If the request fails, it handles the error and returns a `Result` with an `ApiException`.
  static Future<ApiResponse> call(
    String url,
    RequestType requestType, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Function(int value, int progress)? onReceiveProgress,
    Function(int total, int progress)? onSendProgress, // while sending (uploading) progress
    bool isAuthorizationRequired = false,
    bool isLoaderRequired = false,
    bool isLogRequired = false,
    bool isRetryRequired = false,
    bool isErrorToastRequired = true,
    bool isCacheRequired = false,
    dynamic data,
  }) async {
    try {
      // check the internet connection before making the api call (if there is no internet connection, then return)
      // if (!_checkInternetConnection()) {
      //   return Result.error(
      //     ApiException(
      //       message: Strings.noInternetConnection.tr,
      //       url: url,
      //     ),
      //   );
      // }

      // indicate loading state
      if (isLoaderRequired) showLoader();

      final dio = _getDio();

      // add refresh token interceptor
      dio.interceptors.addIf(isAuthorizationRequired, _getAuthTokenInterceptor(dio));

      // add pretty logger if showLog is true
      dio.interceptors.addIf(isLogRequired, _prettyLogger());

      // add retry interceptor
      dio.interceptors.addIf(isRetryRequired, _getRetryInterceptor(dio));

      // Add cache interceptor with global/default options
      dio.interceptors.addIf(
        isCacheRequired,
        DioCacheInterceptor(options: await _getCacheOptions()),
      );

      // try to perform http request
      late Response<Map<String, dynamic>> response;
      if (requestType == RequestType.get) {
        response = await dio.get(
          url,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
          data: data,
        );
      } else if (requestType == RequestType.post) {
        response = await dio.post(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else if (requestType == RequestType.put) {
        response = await dio.put(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else if (requestType == RequestType.patch) {
        response = await dio.patch(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else {
        response = await dio.delete(
          url,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      }

      // hide loader if it's showing
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

  /// Downloads a file from a given URL and saves it to a specified path.
  ///
  /// [url] is the URL from which the file will be downloaded.
  /// [savePath] is the path where the downloaded file will be saved (include file name with the save path).
  /// [headers] are the HTTP headers to be sent with the request. Defaults to an empty map.
  /// [onReceiveProgress] is a callback function that is called during the download process. It receives the total bytes downloaded and the total bytes to be downloaded.
  /// [isLoaderRequired] indicates whether a loading indicator should be shown during the download process. Defaults to false.
  /// [isAuthorizationRequired] indicates whether authorization is required for the download. If true, the method will attempt to add a token from local storage to the request headers. Defaults to true.
  /// [isLogRequired] indicates whether logs should be generated for the download process. Defaults to false.
  /// [isRetryRequired] indicates whether the download should be retried in case of failure. Defaults to false.
  /// [isErrorToastRequired] indicates whether an error message should be shown in case of failure. Defaults to true.
  /// [data] is the data to be sent with the request.
  ///
  /// Returns a `Future` that completes with a `Result` object. If the download is successful, the `Result` object contains a `Response` object. If the download fails, the `Result` object contains an `ApiException` object.
  ///
  /// Throws an `ApiException` if the download fails.
  static Future<ApiResponse> download(
    String url, {
    required String savePath, // where to save file
    Map<String, dynamic> headers = const {},
    Function(int value, int progress)? onReceiveProgress,
    bool isLoaderRequired = false,
    bool isAuthorizationRequired = true,
    bool isLogRequired = false,
    bool isRetryRequired = false,
    bool isErrorToastRequired = true,
    dynamic data,
  }) async {
    try {
      // check the internet connection before making the api call (if there is no internet connection, then return)
      // if (!_checkInternetConnection()) {
      //   return Result.error(
      //     ApiException(
      //       message: Strings.noInternetConnection.tr,
      //       url: url,
      //     ),
      //   );
      // }

      // indicate loading state
      if (isLoaderRequired) showLoader();

      final dio = _getDio();

      // add refresh token interceptor
      dio.interceptors.addIf(isAuthorizationRequired, _getAuthTokenInterceptor(dio));

      // add pretty logger if showLog is true
      dio.interceptors.addIf(isLogRequired, _prettyLogger());

      // add retry interceptor
      dio.interceptors.addIf(isRetryRequired, _getRetryInterceptor(dio));

      final response = await dio.download(
        url,
        savePath,
        options: Options(receiveTimeout: const Duration(seconds: _timeoutInSeconds), sendTimeout: const Duration(seconds: _timeoutInSeconds)),
        onReceiveProgress: onReceiveProgress,
      );

      // hide loader if it's showing
      if (isLoaderRequired) hideLoader();

      return Result.success(response);
    } catch (error) {
      final exception = ApiException(url: url, message: error.toString());
      return _handleError(showToast: isErrorToastRequired, exception);
    }
  }

  /// Uploads a file to a given URL.
  ///
  /// [url] is the URL to which the file will be uploaded.
  /// [filePath] is the path of the file to be uploaded.
  /// [filename] is the name of the file to be uploaded. If not provided, the name of the file at [filePath] will be used.
  /// [headers] are the HTTP headers to be sent with the request. Defaults to an empty map.
  /// [onSendProgress] is a callback function that is called during the upload process. It receives the total bytes to be uploaded and the bytes already uploaded.
  /// [isLogRequired] indicates whether logs should be generated for the upload process. Defaults to false.
  /// [isLoaderRequired] indicates whether a loading indicator should be shown during the upload process. Defaults to false.
  /// [isErrorToastRequired] indicates whether an error message should be shown in case of failure. Defaults to true.
  /// [isAuthorizationRequired] indicates whether authorization is required for the upload. If true, the method will attempt to add a token from local storage to the request headers. Defaults to true.
  /// [isRetryRequired] indicates whether the upload should be retried in case of failure. Defaults to false.
  /// [data] is the data to be sent with the request.
  ///
  /// Returns a `Future` that completes with a `Result` object. If the upload is successful, the `Result` object contains a `Response` object. If the upload fails, the `Result` object contains an `ApiException` object.
  ///
  /// Throws an `ApiException` if the upload fails.
  static Future<ApiResponse> upload(
    String url, {
    required String filePath,
    String? filename,
    Map<String, dynamic> headers = const {},
    Function(int total, int progress)? onSendProgress,
    bool isLogRequired = false,
    bool isLoaderRequired = false,
    bool isErrorToastRequired = true,
    bool isAuthorizationRequired = true,
    bool isRetryRequired = false,
    dynamic data,
  }) async {
    try {
      // check the internet connection before making the api call (if there is no internet connection, then return)
      // if (!_checkInternetConnection()) {
      //   return Result.error(
      //     ApiException(
      //       message: Strings.noInternetConnection.tr,
      //       url: url,
      //     ),
      //   );
      // }

      final dio = _getDio();

      // show loader if required
      if (isLoaderRequired) showLoader();

      // add refresh token interceptor
      dio.interceptors.addIf(isAuthorizationRequired, _getAuthTokenInterceptor(dio));

      // add pretty logger if showLog is true
      dio.interceptors.addIf(isLogRequired, _prettyLogger());

      // add retry interceptor
      dio.interceptors.addIf(isRetryRequired, _getRetryInterceptor(dio));

      // add content type to the header
      headers.addAll({'Content-Type': 'multipart/form-data'});

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: filename),
      });

      // ----->>> example of formData with multiple files and fields
      // final formData = FormData.fromMap({
      //   'name': 'dio',
      //   'date': DateTime.now().toIso8601String(),
      //   'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
      //   'files': [
      //     await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
      //     await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
      //   ]
      // });

      final response = await dio.post(
        url,
        data: formData,
        options: Options(
          // receiveTimeout: const Duration(seconds: _timeoutInSeconds),
          // sendTimeout: const Duration(seconds: _timeoutInSeconds),
          headers: headers,
        ),
        onSendProgress: onSendProgress,
      );

      if (isLoaderRequired) hideLoader();

      return Result.success(response);
    } catch (error) {
      final exception = ApiException(url: url, message: error.toString());
      return _handleError(showToast: isErrorToastRequired, exception);
    }
  }

  /// Dio instance
  static Dio _getDio() => Dio(
        BaseOptions(
          baseUrl: baseURL,
          headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
        ),
      );

  // authorization token interceptor
  static Interceptor _getAuthTokenInterceptor(Dio dio) {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        // get token from local storage
        final String? token = GetStorageHelper.get(authTokenKey);

        // if token is available, then add token to the header
        if (token != null) {
          final tokenHeader = {"Authorization": "Bearer $token"};
          options.headers.addAll(tokenHeader);
        }

        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          // If a 401 response is received, refresh the access token
          String newAccessToken = await _refreshToken();

          // Update the request header with the new access token
          error.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

          // Repeat the request with the updated header
          return handler.resolve(await dio.fetch(error.requestOptions));
        }
        return handler.next(error);
      },
    );
  }

  //TODO: implement refresh token method
  static Future<String> _refreshToken() async {
    // Perform a request to the refresh token endpoint and return the new access token.
    // You can replace this with your own implementation.
    return 'your_new_access_token';
  }

  static Interceptor _prettyLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    );
  }

  /// Retry interceptor
  static Interceptor _getRetryInterceptor(Dio dio) {
    return RetryInterceptor(
      dio: dio,
      logPrint: print, // specify log function (optional)
      retries: 3, // retry count (optional)
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 5), // wait 1 sec before first retry
        Duration(seconds: 10), // wait 2 sec before second retry
        Duration(seconds: 15), // wait 3 sec before third retry
      ],
    );
  }

  /// cache options
  static Future<CacheOptions> _getCacheOptions() async {
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
      // Useful only when origin server has no cache config or custom behavior is desired.
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
  // static bool _checkInternetConnection() {
  //   // check the internet connection before making the api call (if there is no internet connection, then return)
  //   if (!_connectionManager.isInternetConnected.value) {
  //     printLog(
  //       'internet connection status: ${_connectionManager.connectionStatusMessage.value}',
  //       level: Level.error,
  //     );
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  /// handle unexpected error
  static ApiResponse _handleUnexpectedException({
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
  static ApiResponse _handleTimeoutException({required String url, required bool isErrorToastRequired}) {
    return _handleError(
      showToast: isErrorToastRequired,
      ApiException(
        message: Strings.serverNotResponding.tr,
        url: url,
      ),
    );
  }

  /// handle no internet connection exception
  static ApiResponse _handleSocketException({
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
  static ApiResponse _handleDioError({
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

  /// handle error (show toast and hide loader)
  static ApiResponse _handleError(ApiException apiException, {required bool showToast}) {
    String msg = apiException.toString();
    AppSnackbars.showToast(message: msg, color: AppColors.error);

    // hide loader again in case error occurred and a loader still showing
    hideLoader();

    return Result.error(apiException);
  }
}

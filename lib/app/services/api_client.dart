import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sl_v4/app/core/common_widgets/app_snackbars.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';
import 'package:sl_v4/app/core/utils/get_storage_helper.dart';
import 'package:sl_v4/app/core/utils/print_log.dart';

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

// TODO: loader show/hide on api call from client

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

  /// perform safe api request
  static safeApiCall(
    String url,
    RequestType requestType, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required Function(Response response) onSuccess,
    Function(ApiException)? onError,
    Function(int value, int progress)? onReceiveProgress,
    Function(int total, int progress)? onSendProgress, // while sending (uploading) progress
    Function? onLoading,
    bool isAuthorized = true,
    bool showLog = false,
    dynamic data,
  }) async {
    try {
      final connectionManager = Get.find<ConnectionManagerController>();

      // check the internet connection before making the api call (if there is no internet connection, then return)
      if (!connectionManager.isInternetConnected.value) {
        printLog('internet connection status: ${connectionManager.connectionStatusMessage.value}', level: Level.error);
        return;
      }

      // add pretty logger if showLog is true
      _dio.interceptors.addIf(showLog, _prettyDioLog);

      // if the api is authorized, then add token to the header
      if (isAuthorized) {
        //Get token from local
        final String? token = GetStorageHelper.get(authTokenKey);

        //If token is available, then add token inside header.
        if (token != null) {
          final tokenHeader = {"Authorization": "Bearer $token"};
          headers == null ? headers = tokenHeader : headers.addAll(tokenHeader);
        }
      }

      // 1) indicate loading state
      await onLoading?.call();

      // 2) try to perform http request
      late Response response;
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
      // 3) return response (api done successfully)
      return await onSuccess(response);
    } on DioException catch (error) {
      // dio error (api reach the server but not performed successfully
      _handleDioError(error: error, url: url, onError: onError);
    } on SocketException {
      // No internet connection
      _handleSocketException(url: url, onError: onError);
    } on TimeoutException {
      // Api call went out of time
      _handleTimeoutException(url: url, onError: onError);
    } catch (error, stackTrace) {
      // print the line of code that throw unexpected exception
      Logger().e(stackTrace);
      // unexpected error for example (parsing json error)
      _handleUnexpectedException(url: url, onError: onError, error: error);
    }
  }

  /// download file
  static download({
    required String url, // file url
    required String savePath, // where to save file
    Function(ApiException)? onError,
    Function(int value, int progress)? onReceiveProgress,
    required Function onSuccess,
    bool showLog = true,
  }) async {
    try {
      // TODO: check the internet connection before making the api call (if there is no internet connection, then return)

      // add pretty logger if showLog is true
      _dio.interceptors.addIf(showLog, _prettyDioLog);

      await _dio.download(
        url,
        savePath,
        options: Options(
            receiveTimeout: const Duration(seconds: _timeoutInSeconds),
            sendTimeout: const Duration(seconds: _timeoutInSeconds)),
        onReceiveProgress: onReceiveProgress,
      );
      onSuccess();
    } catch (error) {
      var exception = ApiException(url: url, message: error.toString());
      onError?.call(exception) ?? _handleError(error.toString());
    }
  }

  /// handle unexpected error
  static _handleUnexpectedException({Function(ApiException)? onError, required String url, required Object error}) {
    if (onError != null) {
      onError(ApiException(
        message: error.toString(),
        url: url,
      ));
    } else {
      _handleError(error.toString());
    }
  }

  /// handle timeout exception
  static _handleTimeoutException({Function(ApiException)? onError, required String url}) {
    if (onError != null) {
      onError(ApiException(
        message: Strings.serverNotResponding.tr,
        url: url,
      ));
    } else {
      _handleError(Strings.serverNotResponding.tr);
    }
  }

  /// handle timeout exception
  static _handleSocketException({Function(ApiException)? onError, required String url}) {
    if (onError != null) {
      onError(ApiException(
        message: Strings.noInternetConnection.tr,
        url: url,
      ));
    } else {
      _handleError(Strings.noInternetConnection.tr);
    }
  }

  /// handle Dio error
  static _handleDioError({required DioException error, Function(ApiException)? onError, required String url}) {
    // 404 error
    if (error.response?.statusCode == 404) {
      if (onError != null) {
        return onError(ApiException(
          message: Strings.urlNotFound.tr,
          url: url,
          statusCode: 404,
        ));
      } else {
        return _handleError(Strings.urlNotFound.tr);
      }
    }

    // no internet connection
    if (error.message != null && error.message!.toLowerCase().contains('socket')) {
      if (onError != null) {
        return onError(ApiException(
          message: Strings.noInternetConnection.tr,
          url: url,
        ));
      } else {
        return _handleError(Strings.noInternetConnection.tr);
      }
    }

    // check if the error is 500 (server problem)
    if (error.response?.statusCode == 500) {
      var exception = ApiException(
        message: Strings.serverError.tr,
        url: url,
        statusCode: 500,
        response: error.response,
      );

      if (onError != null) {
        return onError(exception);
      } else {
        return handleApiError(exception);
      }
    }

    var exception = ApiException(
        url: url,
        message: error.message ?? 'Un Expected Api Error!',
        response: error.response,
        statusCode: error.response?.statusCode);
    if (onError != null) {
      return onError(exception);
    } else {
      return handleApiError(exception);
    }
  }

  /// handle error automatically (if user didn't pass onError) method
  /// it will try to show the message from api if there is no message
  /// from api it will show the reason (the dio message)
  static handleApiError(ApiException apiException) {
    String msg = apiException.toString();
    AppSnackbars.showCustomToast(message: msg, color: AppColors.errorColor);
  }

  /// handle errors without response (500, out of time, no internet,..etc)
  static _handleError(String msg) {
    AppSnackbars.showCustomToast(message: msg, color: AppColors.errorColor);
  }
}

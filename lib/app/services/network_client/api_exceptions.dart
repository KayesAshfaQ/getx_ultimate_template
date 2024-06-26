import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String url;
  final String message;
  final int? statusCode;
  final Response? response;

  ApiException({
    required this.url,
    required this.message,
    this.response,
    this.statusCode,
  });

  ApiException copyWith({
    String? url,
    String? message,
    int? statusCode,
    Response? response,
  }) {
    return ApiException(
      url: url ?? this.url,
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
      response: response ?? this.response,
    );
  }

  /// IMPORTANT NOTE
  /// here you can take advantage of toString() method to display the error for user
  /// change the keys according to your api response
  /// lets make an example
  /// so in onError method when you make api you can just user apiExceptionInstance.toString() to get the error message from api
  @override
  toString() {
    String result = '';

    result += response?.data['message'] ?? '';

    if (result.isEmpty) {
      result += message; // message is the (dio error message) so usually its not user friendly
    }

    return result;
  }
}

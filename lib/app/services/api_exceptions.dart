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

  /// IMPORTANT NOTE
  /// here you can take advantage of toString() method to display the error for user
  /// change the keys according to your api response
  /// lets make an example
  /// so in onError method when you make api you can just user apiExceptionInstance.toString() to get the error message from api
  @override
  toString() {
    String result = '';

    result += response?.data?['status'] ?? '';

    // if result is not empty until now add new line
    if (result.isNotEmpty) {
      result += ' : ';
    }

    result += response?.data?['message'] ?? '';

    if (result.isEmpty) {
      result += message; // message is the (dio error message) so usually its not user friendly
    }

    return result;
  }
}

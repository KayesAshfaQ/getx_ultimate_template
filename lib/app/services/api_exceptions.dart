// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

    if (response?.data != null) {
      // resonse.data is not type of Map<String, dynamic> convert string to map
      final Map<String, dynamic> data =
          response?.data is String ? json.decode(response?.data) : response?.data;

      result += data['message'] ?? '';
    }

    if (result.isEmpty) {
      result += message; // message is the (dio error message) so usually its not user friendly
    }

    return result;
  }
}

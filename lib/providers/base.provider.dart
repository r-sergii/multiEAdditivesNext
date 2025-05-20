import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app.dart';

// class Config {
//   static String baseUrl = 'http://localhost:3030';
// }

class BaseProvider extends GetConnect {
  BaseProvider() : super() {
    baseUrl = '${App.config.baseUrl}/api';
    allowAutoSignedCert = true; // the solution
  }

  // Нужно будет добавить Accept-Language
  Map<String, String> get headers {
    return {};
    // final token = App.auth.token; //получение токина
    // if (token == null) return {};
    // return {
    //   'Authorization': 'Bearer $token',
    // };
  }

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) {
    headers ??= {};
    return super
        .get<T>(url, headers: headers..addAll(this.headers), contentType: contentType, query: query, decoder: decoder);
  }

  @override
  Future<Response<T>> post<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) {
    headers ??= {};
    return super.post<T>(url, body,
        contentType: contentType,
        headers: headers..addAll(this.headers),
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress);
  }

  @override
  Future<Response<T>> put<T>(
    String url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) {
    headers ??= {};
    return super.put<T>(url, body,
        contentType: contentType,
        headers: headers..addAll(this.headers),
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress);
  }

  @override
  Future<Response<T>> delete<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) {
    headers ??= {};
    return super.delete<T>(url,
        contentType: contentType, headers: headers..addAll(this.headers), query: query, decoder: decoder);
  }

  Future<T> response<T, R>(Future<Response<R>> Function() request, T Function(dynamic) decoder) async {
    // print(baseUrl);
    final response = await request();
    if (response.status.code == 403) {
      // App.setAuthToken(null);
    } else if (!response.status.isOk && response.status.code != 400) {
      Map<String, dynamic>? body;
      if (response.body is String) {
        body = {'message': response.body};
      } else {
        body = response.body as Map<String, dynamic>?;
      }
      debugPrint('${response.request?.method} ${response.request?.url}\n->${response.bodyString}');
      // throw HttpResponseException(
      //     response.statusCode ?? asInt(body?['statusCode']) ?? 0,
      //     response.statusText ?? body?['statusCode'] ?? "Response error",
      //     body?['message']);
      // Get.snackbar('Error', body?['message'] ?? 'Unexpected error.',
      //         colorText: Colors.white, backgroundColor: Colors.red[900])
      //     .show();
    }
    debugPrint(response.body.toString());
    return decoder(response.body);
  }

  List<T> Function(dynamic) fromJsonList<T>(T Function(Map<String, dynamic>) fromJson) {
    return (dynamic list) {
      return (list as List).map<T>((i) => fromJson(i)).toList();
    };
  }

  // void initHttpClient(GetHttpClient httpClient) {}

  // @override
  // GetHttpClient get httpClient =>
  //     _httpClient ??
  //     () {
  //       initHttpClient(super.httpClient);
  //       return _httpClient = super.httpClient;
  //     }();
  // GetHttpClient? _httpClient;

  int? asInt(dynamic value, [int? defaultInt]) {
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? defaultInt;
    return defaultInt;
  }
}

class HttpResponseException {
  final int code;
  final String error;
  final String? message;

  const HttpResponseException(this.code, this.error, this.message);

  @override
  String toString() {
    return message ?? error;
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class Http {
  static final BaseOptions options =
      BaseOptions(baseUrl: 'http://192.168.110.22:8080');
  static final Dio _dio = new Dio(options);

  static Dio getDio() {
    return _dio;
  }

  static Future<Result<T>> post<T>(Request request) async {
    var response = await getDio().post(request.path, data: request.params);
    print(request);
    print(response);
    if (response.statusCode == HttpStatus.ok) {
      return Result.fromJson(jsonDecode(response.toString()));
    } else {
      return Result(false,
          code: response.statusCode ?? -1, msg: response.statusMessage ?? '');
    }
  }
}

class Request {
  const Request(this.path, {this.params});

  final String path;
  final Map<String, dynamic>? params;

  @override
  String toString() {
    return 'Request{path: $path, params: $params}';
  }
}

class Result<T> {
  Result(this.success, {this.code = 0, this.msg = ""});

  late final bool success;
  late final int code;
  late final String msg;
  late final T? data;

  Result.fromJson(Map<String, dynamic> json) {
    this.success = json['success'];
    this.code = json['code'];
    this.msg = json['msg'];
    this.data = json['data'];
  }

  @override
  String toString() {
    return 'Result{success: $success, code: $code, msg: $msg, data: $data}';
  }
}

class Api {
  static const LOGIN = '/login';
}

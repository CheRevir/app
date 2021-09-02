import 'package:dio/dio.dart';

class Http {
  static final BaseOptions options =
  BaseOptions(baseUrl: 'http://www.baidu.com');
  static final Dio _dio = new Dio(options);

  static Future<Response> getDate(Request request) {
    return _dio.get(request.path);
  }
}

class Request {
  const Request(this.path);

  final String path;
}

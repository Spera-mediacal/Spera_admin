import 'package:dio/dio.dart';

class ApiClient {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://127.0.0.1:8000/api/admin/',
    connectTimeout: const Duration(seconds: 50),
    receiveTimeout: const Duration(seconds: 30),
  ));

  static Dio get dio => _dio;
}

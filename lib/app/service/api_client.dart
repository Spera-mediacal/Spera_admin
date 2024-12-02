import 'package:dio/dio.dart';

import '../../utils/constants.dart';

class ApiClient {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://${AppConstants.localIp}/api/admin/',
    connectTimeout: const Duration(seconds: 50),
    receiveTimeout: const Duration(seconds: 30),
  ));

  static Dio get dio => _dio;
}

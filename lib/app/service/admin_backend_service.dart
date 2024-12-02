import 'package:dio/dio.dart';

import '../../utils/constants.dart';
import '../model/admin_model.dart';
import '../model/token_model.dart';



class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '${AppConstants.localIp}/api/admin', // Base URL
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
    ),
  );

  // Login Method
  Future<Token> login(String username, String password) async {
    try {
      final response = await _dio.post('/login', data: {
        'username': username,
        'password': password,
      });
      return Token.fromJson(response.data);
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  // Read Current User
  Future<Admin> getCurrentUser(String token) async {
    try {
      final response = await _dio.get(
        '/me/',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return Admin.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch user: $e');
    }
  }

  // Create Admin
  Future<String> createAdmin(String name, String username, String password) async {
    try {
      final response = await _dio.post('', data: {
        'name': name,
        'username': username,
        'password': password,
      });
      return response.data['message'];
    } catch (e) {
      throw Exception('Failed to create admin: $e');
    }
  }
}

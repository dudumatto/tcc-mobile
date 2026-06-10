import 'package:dio/dio.dart';

import '../core/auth/auth_service.dart';
import '../core/api/api_client.dart';

class AuthRepository {
  AuthRepository() : _service = AuthService(ApiClient.instance);

  final AuthService _service;

  Future<Response<dynamic>> login(String email, String password) {
    return _service.login({'email': email, 'password': password});
  }

  Future<Response<dynamic>> register(Map<String, dynamic> data) {
    return _service.register(data);
  }

  Future<Response<dynamic>> logout() {
    return _service.logout();
  }

  Future<Response<dynamic>> me() {
    return _service.me();
  }
}


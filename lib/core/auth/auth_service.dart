import 'package:dio/dio.dart';

import '../api/api_client.dart';
import '../api/api_endpoints.dart';

class AuthService {
  AuthService(this._apiClient);

  final ApiClient _apiClient;

  Future<Response<dynamic>> login(Map<String, dynamic> body) {
    return _apiClient.dio.post(ApiEndpoints.login, data: body);
  }

  Future<Response<dynamic>> register(Map<String, dynamic> body) {
    return _apiClient.dio.post(ApiEndpoints.register, data: body);
  }

  Future<Response<dynamic>> logout() {
    return _apiClient.dio.post(ApiEndpoints.logout);
  }

  Future<Response<dynamic>> me() {
    return _apiClient.dio.get(ApiEndpoints.me);
  }
}


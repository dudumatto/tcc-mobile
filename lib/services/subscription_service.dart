import 'package:dio/dio.dart';

import '../core/api/api_client.dart';
import '../core/api/api_endpoints.dart';

class SubscriptionService {
  SubscriptionService() : _dio = ApiClient.instance.dio;

  final Dio _dio;

  Future<Response<dynamic>> list() => _dio.get(ApiEndpoints.subscriptions);
}


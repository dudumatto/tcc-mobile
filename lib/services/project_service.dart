import 'package:dio/dio.dart';

import '../core/api/api_client.dart';
import '../core/api/api_endpoints.dart';

class ProjectService {
  ProjectService() : _dio = ApiClient.instance.dio;

  final Dio _dio;

  Future<Response<dynamic>> list({
    String? status,
    String? area,
    String? course,
    String? search,
  }) {
    return _dio.get(
      ApiEndpoints.projects,
      queryParameters: {
        if (status != null && status.isNotEmpty) 'status': status,
        if (area != null && area.isNotEmpty) 'area': area,
        if (course != null && course.isNotEmpty) 'course': course,
        if (search != null && search.isNotEmpty) 'search': search,
      },
    );
  }
}


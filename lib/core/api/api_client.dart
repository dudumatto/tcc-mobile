import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../config/env.dart';
import '../navigation/navigation_service.dart';

class ApiClient {
  ApiClient._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Env.apiUrl,
        headers: const {'Content-Type': 'application/json'},
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.read(key: _tokenKey);
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await clearToken();
            final context = NavigationService.rootNavigatorKey.currentContext;
            if (context != null) {
              context.go('/login');
            }
            handler.reject(
              DioException(
                requestOptions: error.requestOptions,
                error: 'Sessao expirada. Entre novamente.',
                response: error.response,
                type: error.type,
              ),
            );
            return;
          }
          handler.reject(error);
        },
      ),
    );
  }

  static final ApiClient instance = ApiClient._();
  static const String _tokenKey = 'auth_token';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  late final Dio _dio;

  Dio get dio => _dio;

  Future<void> saveToken(String token) => _storage.write(key: _tokenKey, value: token);

  Future<String?> readToken() => _storage.read(key: _tokenKey);

  Future<void> clearToken() => _storage.delete(key: _tokenKey);

  String friendlyError(DioException error) {
    final status = error.response?.statusCode;
    if (status == 400) return 'Dados invalidos. Verifique os campos.';
    if (status == 401) return 'Sessao expirada. Entre novamente.';
    if (status == 403) return 'Voce nao tem permissao para esta acao.';
    if (status == 404) return 'Recurso nao encontrado.';
    if (status == 409) return 'Ja existe um registro com esses dados.';
    if (status != null && status >= 500) return 'Erro no servidor. Tente novamente.';
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return 'Tempo limite excedido. Verifique sua conexao.';
    }
    return 'Nao foi possivel concluir a operacao.';
  }
}


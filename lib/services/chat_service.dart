import 'package:dio/dio.dart';

import '../core/api/api_client.dart';

class ChatService {
  ChatService() : _dio = ApiClient.instance.dio;

  final Dio _dio;

  Future<Response<dynamic>> conversations() => _dio.get('/api/chat/conversations');

  Future<Response<dynamic>> messages(String conversationId) =>
      _dio.get('/api/chat/conversations/$conversationId/messages');
}


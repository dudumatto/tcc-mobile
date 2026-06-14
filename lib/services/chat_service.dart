import 'package:dio/dio.dart';

import '../core/api/api_client.dart';
import '../core/api/api_endpoints.dart';
import '../models/conversation.dart';
import '../models/message.dart';
import 'response_parser.dart';

class ChatService {
  ChatService() : _dio = ApiClient.instance.dio;

  final Dio _dio;

  Future<List<Conversation>> conversations() async {
    final response = await _dio.get<dynamic>(ApiEndpoints.chatConversations);
    return parseListPayload(response.data).map(Conversation.fromJson).toList();
  }

  Future<List<Message>> messages(String conversationId) async {
    final response = await _dio.get<dynamic>(
      ApiEndpoints.conversationMessages(conversationId),
    );
    return parseListPayload(response.data).map(Message.fromJson).toList();
  }

  Future<Message> sendMessage(String conversationId, String content) async {
    final response = await _dio.post<dynamic>(
      ApiEndpoints.sendConversationMessage(conversationId),
      data: {'conteudo': content},
    );
    return Message.fromJson(parseObjectPayload(response.data));
  }
}

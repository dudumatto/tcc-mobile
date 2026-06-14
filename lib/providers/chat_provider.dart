import 'package:flutter/foundation.dart';

import '../models/conversation.dart';
import '../models/message.dart';
import '../services/chat_service.dart';

class ChatProvider extends ChangeNotifier {
  final ChatService _service = ChatService();
  final List<Conversation> conversations = <Conversation>[];
  final List<Message> messages = <Message>[];
  bool isLoading = false;
  bool isSending = false;
  String? errorMessage;

  Future<void> loadConversations() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final loadedConversations = await _service.conversations();
      conversations
        ..clear()
        ..addAll(loadedConversations);
    } catch (_) {
      errorMessage = 'Nao foi possivel carregar as conversas.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMessages(String conversationId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final loadedMessages = await _service.messages(conversationId);
      messages
        ..clear()
        ..addAll(loadedMessages);
    } catch (_) {
      errorMessage = 'Nao foi possivel carregar as mensagens.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> sendMessage(String conversationId, String content) async {
    final trimmed = content.trim();
    if (trimmed.isEmpty) return false;
    isSending = true;
    errorMessage = null;
    notifyListeners();
    try {
      final message = await _service.sendMessage(conversationId, trimmed);
      messages.add(message);
      return true;
    } catch (_) {
      errorMessage = 'Nao foi possivel enviar a mensagem.';
      return false;
    } finally {
      isSending = false;
      notifyListeners();
    }
  }
}

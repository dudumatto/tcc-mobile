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

  Future<bool> editMessage(String messageId, String content) async {
    final trimmed = content.trim();
    if (messageId.isEmpty || trimmed.isEmpty) return false;
    errorMessage = null;
    notifyListeners();
    try {
      final updatedMessage = await _service.editMessage(messageId, trimmed);
      final index = messages.indexWhere((message) => message.id == messageId);
      if (index != -1) {
        messages[index] = updatedMessage;
      }
      notifyListeners();
      return true;
    } catch (_) {
      errorMessage = 'Nao foi possivel editar a mensagem.';
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteMessage(String messageId) async {
    if (messageId.isEmpty) return false;
    errorMessage = null;
    notifyListeners();
    try {
      await _service.deleteMessage(messageId);
      messages.removeWhere((message) => message.id == messageId);
      notifyListeners();
      return true;
    } catch (_) {
      errorMessage = 'Nao foi possivel excluir a mensagem.';
      notifyListeners();
      return false;
    }
  }
}

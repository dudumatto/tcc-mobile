import 'package:flutter/foundation.dart';

import '../models/conversation.dart';
import '../models/message.dart';
import '../services/chat_service.dart';

class ChatProvider extends ChangeNotifier {
  final ChatService _service = ChatService();
  final List<Conversation> conversations = <Conversation>[];
  final List<Message> messages = <Message>[];
  bool isLoading = false;

  Future<void> loadConversations() async {
    isLoading = true;
    notifyListeners();
    try {
      await _service.conversations();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMessages(String conversationId) async {
    isLoading = true;
    notifyListeners();
    try {
      await _service.messages(conversationId);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}


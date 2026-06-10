import 'package:flutter/material.dart';

import '../../models/conversation.dart';
import '../../widgets/chat/conversation_tile.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const conversations = <Conversation>[
      Conversation(
        id: '1',
        title: 'Orientador',
        lastMessage: 'Vamos revisar o cronograma.',
        lastUpdated: DateTime(2026, 6, 10, 10, 30),
        unreadCount: 2,
      ),
      Conversation(
        id: '2',
        title: 'Equipe do projeto',
        lastMessage: 'Arquivei a ultima versao.',
        lastUpdated: DateTime(2026, 6, 10, 9, 0),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Buscar conversa',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (_) {},
          ),
          const SizedBox(height: 16),
          ...conversations.map(
            (conversation) => ConversationTile(conversation: conversation),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/chat_provider.dart';
import '../../widgets/chat/chat_input_bar.dart';
import '../../widgets/chat/message_bubble.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/common/loading_indicator.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key, required this.conversationId});

  final String conversationId;

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatProvider>().loadMessages(widget.conversationId);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final sent = await context
        .read<ChatProvider>()
        .sendMessage(widget.conversationId, _controller.text);
    if (sent) {
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversa ${widget.conversationId}')),
      body: Consumer<ChatProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              if (provider.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Text(
                    provider.errorMessage!,
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                ),
              Expanded(
                child: provider.isLoading && provider.messages.isEmpty
                    ? const LoadingIndicator(label: 'Carregando mensagens...')
                    : provider.messages.isEmpty
                        ? const EmptyState(
                            title: 'Nenhuma mensagem',
                            subtitle: 'Envie a primeira mensagem desta conversa.',
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: provider.messages.length,
                            itemBuilder: (context, index) =>
                                MessageBubble(message: provider.messages[index]),
                          ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ChatInputBar(
                  controller: _controller,
                  onSend: provider.isSending ? () {} : _sendMessage,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

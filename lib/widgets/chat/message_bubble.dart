import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../models/message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final alignment = message.isMine ? Alignment.centerRight : Alignment.centerLeft;
    final background = message.isMine ? AppColors.primary : AppColors.surfaceTint;
    final foreground = message.isMine ? Colors.white : AppColors.text;
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 320),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.content, style: TextStyle(color: foreground)),
            const SizedBox(height: 6),
            Text(
              DateFormat('HH:mm').format(message.sentAt),
              style: TextStyle(color: foreground.withValues(alpha: 0.7), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

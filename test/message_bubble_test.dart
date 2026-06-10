import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tcc_mobile/models/message.dart';
import 'package:tcc_mobile/widgets/chat/message_bubble.dart';

void main() {
  testWidgets('exibe mensagem e horario', (tester) async {
    final message = Message(
      id: '1',
      content: 'Mensagem de teste',
      senderId: 'u1',
      sentAt: DateTime(2026, 6, 10, 12, 30),
      isMine: true,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: MessageBubble(message: message)),
      ),
    );

    expect(find.text('Mensagem de teste'), findsOneWidget);
    expect(find.text('12:30'), findsOneWidget);
  });
}

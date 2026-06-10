import 'package:flutter/material.dart';

import '../../models/app_notification.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/notifications/notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const notifications = <AppNotification>[
      AppNotification(
        id: '1',
        title: 'Novo comentario',
        description: 'Seu projeto recebeu uma nova mensagem.',
        createdAt: DateTime(2026, 6, 10, 10, 50),
      ),
      AppNotification(
        id: '2',
        title: 'Inscricao aprovada',
        description: 'Sua inscricao foi aprovada.',
        createdAt: DateTime(2026, 6, 10, 9, 15),
        isRead: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Notificacoes')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          AppButton(label: 'Marcar todas como lidas', onPressed: () {}),
          const SizedBox(height: 16),
          ...notifications.map(
            (notification) => NotificationTile(notification: notification),
          ),
        ],
      ),
    );
  }
}


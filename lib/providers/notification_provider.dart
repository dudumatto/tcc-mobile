import 'package:flutter/foundation.dart';

import '../models/app_notification.dart';
import '../services/notification_service.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationService _service = NotificationService();
  final List<AppNotification> notifications = <AppNotification>[];
  int unreadCount = 0;
  bool isLoading = false;

  Future<void> loadNotifications() async {
    isLoading = true;
    notifyListeners();
    try {
      await _service.list();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}


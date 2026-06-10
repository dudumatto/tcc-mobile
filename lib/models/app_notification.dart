class AppNotification {
  const AppNotification({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.isRead = false,
    this.type = 'info',
  });

  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  final bool isRead;
  final String type;
}


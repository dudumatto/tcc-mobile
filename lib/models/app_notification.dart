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

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    final createdAtValue =
        json['createdAt'] ?? json['dataCriacao'] ?? json['date'] ?? json['timestamp'];
    final type = '${json['type'] ?? json['tipo'] ?? 'info'}';
    return AppNotification(
      id: '${json['id'] ?? ''}',
      title: '${json['title'] ?? json['subject'] ?? json['payloadResumo'] ?? type}',
      description:
          '${json['description'] ?? json['message'] ?? json['mensagem'] ?? json['content'] ?? ''}',
      createdAt: DateTime.tryParse('$createdAtValue') ?? DateTime.now(),
      isRead:
          json['isRead'] == true || json['read'] == true || json['lida'] == true,
      type: type,
    );
  }
}

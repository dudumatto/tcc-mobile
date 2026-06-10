class Conversation {
  const Conversation({
    required this.id,
    required this.title,
    required this.lastMessage,
    required this.lastUpdated,
    this.unreadCount = 0,
  });

  final String id;
  final String title;
  final String lastMessage;
  final DateTime lastUpdated;
  final int unreadCount;
}


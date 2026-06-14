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

  factory Conversation.fromJson(Map<String, dynamic> json) {
    final lastUpdatedValue =
        json['lastUpdated'] ??
        json['updatedAt'] ??
        json['createdAt'] ??
        json['ultimaMensagemHorario'] ??
        json['dataCriacao'];
    return Conversation(
      id: '${json['id'] ?? json['conversationId'] ?? ''}',
      title:
          '${json['title'] ?? json['titulo'] ?? json['name'] ?? json['participantName'] ?? 'Conversa'}',
      lastMessage:
          '${json['lastMessage'] ?? json['ultimaMensagem'] ?? json['lastMessageContent'] ?? json['preview'] ?? ''}',
      lastUpdated: DateTime.tryParse('$lastUpdatedValue') ?? DateTime.now(),
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
    );
  }
}

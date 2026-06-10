class Message {
  const Message({
    required this.id,
    required this.content,
    required this.senderId,
    required this.sentAt,
    this.isMine = false,
  });

  final String id;
  final String content;
  final String senderId;
  final DateTime sentAt;
  final bool isMine;
}


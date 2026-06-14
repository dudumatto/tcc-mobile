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

  factory Message.fromJson(Map<String, dynamic> json) {
    final sentAtValue =
        json['sentAt'] ?? json['dataEnvio'] ?? json['createdAt'] ?? json['timestamp'];
    return Message(
      id: '${json['id'] ?? ''}',
      content:
          '${json['content'] ?? json['conteudo'] ?? json['message'] ?? json['text'] ?? ''}',
      senderId:
          '${json['senderId'] ?? json['remetenteId'] ?? json['userId'] ?? json['sender']?['id'] ?? ''}',
      sentAt: DateTime.tryParse('$sentAtValue') ?? DateTime.now(),
      isMine: json['isMine'] == true ||
          json['mine'] == true ||
          json['fromCurrentUser'] == true,
    );
  }
}

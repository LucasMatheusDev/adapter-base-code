class Message {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String text;
  final String? authorId;
  final String authorName;
  final String chatId;

  Message({
    required this.createdAt,
    required this.updatedAt,
    required this.text,
    required this.authorId,
    required this.authorName,
    required this.chatId,
  });

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "text": text,
        "authorId": authorId,
        "authorName": authorName,
        "chatId": chatId,
      };
}

class Message {
  final int chatId;
  final String content;
  final String date;
  final int sender;
  final String senderName;
  final String senderImage;
  final bool unread;

  Message({
    this.senderName,
    this.senderImage,
    this.unread,
    this.content,
    this.sender,
    this.date,
    this.chatId,
  });

  factory Message.fromJSON(Map<String, dynamic> json) {
    return Message(
      chatId: json["chatId"],
      content: json["content"],
      sender: json["sender"],
      date: json["date"],
      unread: json["unread"],
      senderName: json["senderName"],
      senderImage: json["senderImage"],
    );
  }
}

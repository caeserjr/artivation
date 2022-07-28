import 'package:Artivation/models/users.dart';

class Message {
  final String content;
  final DateTime date;
  final Users sender;
  final bool unread;

  Message({this.unread, this.content, this.sender, this.date});

  factory Message.fromJSON(Map<String, dynamic> json) {
    return Message(
      content: json["text"],
      sender: json["sender"],
      date: json["date"],
      unread: json["unread"],
    );
  }
}

List<Message> chats = [
  Message(
    sender: jiraiya,
    date: DateTime.now().subtract(
      Duration(days: 14, hours: 8, minutes: 155),
    ),
    unread: true,
    content: "Naruto kun",
  ),
  Message(
    sender: thickums,
    date: DateTime.now().subtract(
      Duration(days: 4),
    ),
    unread: true,
    content: "Hi.",
  ),
  Message(
    sender: naruto,
    date: DateTime.now().subtract(
      Duration(days: 11),
    ),
    unread: false,
    content: "Datebayo.",
  ),
  Message(
    sender: nugget,
    date: DateTime.now(),
    unread: true,
    content: "Baka.",
  ),
];

List<Message> messages = [
  Message(
    sender: thickums,
    date: DateTime.now().subtract(
      Duration(days: 4, hours: 12),
    ),
    content: "Hi there",
    unread: true,
  ),
  Message(
    sender: me,
    date: DateTime.now().subtract(
      Duration(days: 4, hours: 12),
    ),
    content: "Hiii",
    unread: true,
  ),
  Message(
    sender: thickums,
    date: DateTime.now().subtract(
      Duration(days: 4, hours: 11),
    ),
    content: "How are you?",
    unread: true,
  ),
  Message(
    sender: me,
    date: DateTime.now().subtract(
      Duration(days: 4, hours: 10),
    ),
    content: "am good, wbu?",
    unread: true,
  ),
  Message(
    sender: thickums,
    date: DateTime.now().subtract(
      Duration(days: 1, hours: 10),
    ),
    content: "am good?",
    unread: true,
  ),
  Message(
    sender: thickums,
    date: DateTime.now().subtract(
      Duration(days: 1, hours: 10),
    ),
    content: "whats new?",
    unread: true,
  ),
  Message(
    sender: me,
    date: DateTime.now(),
    content: "nothing much",
    unread: true,
  ),
];

final Users me = Users(
    userId: 1,
    firstName: "Ghalib",
    middleName: "A",
    lastName: "Ali",
    imageUrl: "assets/pieces/8.jpg",
    phoneNumber: 0712160406,
    userName: "caeserjr");
final Users thickums = Users(
  userId: 2,
  firstName: "Saida",
  middleName: "A",
  lastName: "Mzee",
  imageUrl: "assets/pieces/4.jpg",
  phoneNumber: 0712160406,
  userName: "sambaseif",
);
final Users nugget = Users(
  userId: 3,
  firstName: "Salhiya",
  middleName: "G",
  lastName: "Ali",
  imageUrl: "assets/pieces/7.jpg",
  phoneNumber: 0712160406,
  userName: "naggato",
);
final Users naruto = Users(
  userId: 4,
  firstName: "Naruto",
  middleName: "J",
  lastName: "Uzumaki",
  imageUrl: "assets/pieces/6.jpg",
  phoneNumber: 0712160406,
  userName: "jiraiya",
);
final Users jiraiya = Users(
  userId: 4,
  firstName: "Ogata",
  middleName: "S",
  lastName: "Hiroyuki",
  imageUrl: "assets/pieces/1.jpg",
  phoneNumber: 0712160406,
  userName: "jiraiya",
);

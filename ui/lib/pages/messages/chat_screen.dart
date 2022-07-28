import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/models/messages.dart';
import 'package:Artivation/models/users.dart';
import 'package:Artivation/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final Users user;
  const ChatScreen({Key key, this.user}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
      content: "Hi there",
      date: DateTime.now().subtract(
        Duration(hours: 24),
      ),
    ),
    Message(
      content: "Hi",
      date: DateTime.now().subtract(
        Duration(minutes: 1),
      ),
    ),
    Message(
      content: "How are you?",
      date: DateTime.now().subtract(
        Duration(minutes: 1),
      ),
    ),
    Message(
      content: "am good, wbu?",
      date: DateTime.now().subtract(
        Duration(minutes: 1),
      ),
    ),
    Message(
      content: "am okie, hows life?",
      date: DateTime.now().subtract(
        Duration(minutes: 1),
      ),
    ),
    Message(
      content: "it's going well",
      date: DateTime.now().subtract(
        Duration(minutes: 1),
      ),
    ),
    Message(
      content: "How are you?",
      date: DateTime.now().subtract(
        Duration(minutes: 1),
      ),
    ),
    Message(
      content: "am good, wbu?",
      date: DateTime.now().subtract(
        Duration(minutes: 1),
      ),
    ),
    Message(
      content: "am okie, hows life?",
      date: DateTime.now().subtract(
        Duration(minutes: 1),
      ),
    ),
    Message(
      content: "it's going well",
      date: DateTime.now().subtract(
        Duration(minutes: 1),
      ),
    ),
    Message(
      content: "How are you?",
      date: DateTime.now().subtract(
        Duration(minutes: 1),
      ),
    ),
    Message(
      content: "am good, wbu?",
      date: DateTime.now().subtract(
        Duration(minutes: 1),
      ),
    ),
    Message(
      content: "am okie, hows life?",
      date: DateTime.now().subtract(
        Duration(minutes: 1),
      ),
    ),
    Message(
      content: "it's going well",
      date: DateTime.now().subtract(
        Duration(minutes: 1),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            child: Text("AppBar Here"),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              color: Color.fromARGB(173, 248, 246, 241),
              child: GroupedListView<Message, DateTime>(
                padding: const EdgeInsets.all(8),
                physics: BouncingScrollPhysics(),
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                elements: messages,
                groupBy: (message) => DateTime(
                  message.date.year,
                  message.date.month,
                  message.date.day,
                ),
                groupHeaderBuilder: (Message message) => SizedBox(
                  height: 30,
                  child: Center(
                    child: Card(
                      color: Theme.of(context).primaryColor.withOpacity(.2),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          DateFormat.yMMMd().format(message.date) ==
                                  DateFormat.yMMMd().format(DateTime.now())
                              ? "today"
                              : DateFormat.yMMMd().format(message.date),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, Message message) => ChatBubble(
                  content: message.content,
                  isSender: message.sender == true ? true : false,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        InkWell(
                          splashColor: Constants.kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            setState(() {
                              //! add message by inputController
                              // return messages.add(message);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.sentiment_satisfied_alt_outlined,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .color
                                  .withOpacity(.64),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Type message",
                              border: InputBorder.none,
                            ),
                            onSubmitted: (text) {
                              final message = Message(
                                content: text,
                                date: DateTime.now(),
                              );

                              if (text != "") {
                                setState(() {
                                  return messages.add(message);
                                });
                              }
                            },
                          ),
                        ),
                        InkWell(
                          splashColor: Constants.kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            setState(() {
                              //! add message by inputController
                              // return messages.add(message);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.attach_file,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .color
                                  .withOpacity(.64),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          splashColor: Constants.kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            setState(() {
                              //! add open gallery by inputController
                              // return messages.add(message);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .color
                                  .withOpacity(.64),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          splashColor: Constants.kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            setState(() {
                              //! add message by inputController
                              // return messages.add(message);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.send,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .color
                                  .withOpacity(.64),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

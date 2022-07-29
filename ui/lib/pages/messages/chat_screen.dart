import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/handlers/error_responses.dart';
import 'package:Artivation/models/messages.dart';
import 'package:Artivation/screens/widgets/empty_container.dart';
import 'package:Artivation/screens/widgets/loading_container.dart';
import 'package:Artivation/services/messages/messageApi.dart';
import 'package:Artivation/widgets/chat_bubble.dart';
import 'package:Artivation/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final int chatId;
  const ChatScreen({Key key, this.chatId}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages;

  void _showMessageDialog({
    String message,
    String severity,
    dynamic positiveButtonCallback,
    String positiveButtonText,
    dynamic negativeButtonCallback,
    String negativeButtonText,
    String type,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: MessageDialog(
            message: message,
            negativeButtonCallback: negativeButtonCallback,
            negativeButtonText: negativeButtonText,
            positiveButtonCallback: positiveButtonCallback,
            positiveButtonText: positiveButtonText,
            severity: severity,
            type: type,
          ),
        );
      },
    ).then((val) {});
  }

  bool _loading;
  bool dataLoaded;

  void initState() {
    getChatMessages(widget.chatId);
    _loading = false;
    dataLoaded = false;
    super.initState();
  }

  void getChatMessages(chatId) async {
    var _response = await MessagesApi.getMessages(
      payload: {
        "chatId": chatId,
        // "userId": storage.getString("userId"),
      },
    );

    setState(() {
      _loading = false;
    });

    if (_response.runtimeType.toString() == "ErrorResponse") {
      ErrorResponse _error = _response;
      _showMessageDialog(
        message: _error.message,
        severity: "error",
        type: "alert",
        positiveButtonCallback: () {
          Navigator.of(context).pop();
        },
        positiveButtonText: "OK",
      );
    } else {
      setState(() {
        dataLoaded = true;
        messages = _response;
      });

      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => HomePage()),
      //     (route) => false);

    }
  }

  @override
  Widget build(BuildContext context) {
    var _formatter = new DateFormat('dd-mm-yyyy HH:mm:ss');

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            child: Text("AppBar Here"),
          ),
          Expanded(
            child: _loading
                ? LoadingContainer()
                : dataLoaded
                    ? Container(
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
                            _formatter.parse(message.date).year,
                            _formatter.parse(message.date).month,
                            _formatter.parse(message.date).day,
                          ),
                          groupHeaderBuilder: (Message message) => SizedBox(
                            height: 30,
                            child: Center(
                              child: Card(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.2),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    DateFormat.yMMMd().format(
                                              _formatter
                                                  .parse("${message.date}"),
                                            ) ==
                                            DateFormat.yMMMd().format(
                                              DateTime.now(),
                                            )
                                        ? "today"
                                        : DateFormat.yMMMd().format(
                                            _formatter.parse("${message.date}"),
                                          ),
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
                      )
                    : EmptyContainer(message: "No messages found."),
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
                                date: DateTime.now().toString(),
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

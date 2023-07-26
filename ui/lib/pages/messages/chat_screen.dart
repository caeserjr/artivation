import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/handlers/error_responses.dart';
import 'package:Artivation/models/messages.dart';
import 'package:Artivation/services/messages/messageApi.dart';
import 'package:Artivation/widgets/app_text.dart';
import 'package:Artivation/widgets/chat_bubble.dart';
import 'package:Artivation/widgets/error_page.dart';
import 'package:Artivation/widgets/loading_container.dart';
import 'package:Artivation/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  final int? chatId, chatWith;
  final String? chatName, profileImg;

  const ChatScreen({
    this.chatId,
    this.chatName,
    this.profileImg,
    this.chatWith,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String? messageContent, currentUser;
  bool? _loading, _error;
  bool? dataLoaded;

  List<Message> messages = [];

  ErrorResponse? occurredError;

  void _showMessageDialog({
    String message = "An error occurred",
    String severity = "error",
    dynamic positiveButtonCallback,
    String positiveButtonText = "Yes",
    dynamic negativeButtonCallback,
    String negativeButtonText = "No",
    String type = "alert",
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

  void initState() {
    getChatMessages();
    _error = false;
    _loading = false;
    messages = [];
    messageContent = "";
    initiatePreferences();
    super.initState();
  }

  void initiatePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentUser = prefs.getString("currentUser");
    });
  }

  void getChatMessages() async {
    setState(() {
      _loading = true;
    });
    var _response = await MessagesApi.getMessages(
      payload: {
        "chatId": widget.chatId,
      },
    );

    if (_response.runtimeType.toString() == "ErrorResponse") {
      occurredError = _response;

      _showMessageDialog(
        message: _response.message,
        severity: "error",
        type: "alert",
        positiveButtonCallback: () {
          Navigator.of(context).pop();
        },
        positiveButtonText: "OK",
      );
      setState(() {
        _loading = false;
        _error = true;
      });
    } else {
      setState(() {
        messages = _response;
        _loading = false;
      });
    }
  }

  void sendMessage() async {
    var _response = await MessagesApi.sendMessage(
      payload: {
        //! add sender as logged in user
        "sender": 1,
        "content": messageContent,
        "receiver": widget.chatWith,
        "date": DateTime.now().toString()
        // "userId": storage.getString("userId"),
      },
    );

    if (_response.runtimeType.toString() == "ErrorResponse") {
      ErrorResponse _error = _response;
      _showMessageDialog(
        message: _error.message!,
        severity: "error",
        type: "alert",
        positiveButtonCallback: () {
          Navigator.of(context).pop();
        },
        positiveButtonText: "OK",
      );
    } else {
      print("server returned ${_response}");

      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => HomePage()),
      //     (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.black,
                      size: Constants.iconSize + 5,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.profileImg!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: AppText(
                      text: widget.chatName!,
                      isBold: true,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: _loading!
                ? LoadingContainer()
                : _error!
                    ? ErrorPage(
                        message: occurredError!.message,
                        action: () {
                          setState(() {
                            _error = false;
                          });
                          getChatMessages();
                        },
                      )
                    : Container(
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
                            DateTime.parse(message.date!).year,
                            DateTime.parse(message.date!).month,
                            DateTime.parse(message.date!).day,
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
                                    DateFormat.yMd().format(DateTime.parse(
                                                message.date!)) ==
                                            DateFormat.yMd().format(
                                              new DateTime.now(),
                                            )
                                        ? "Today"
                                        : DateFormat.yMd().format(
                                                  DateTime.parse(message.date!),
                                                ) ==
                                                DateFormat.yMd().format(
                                                  new DateTime.now().subtract(
                                                    Duration(
                                                      days: 1,
                                                    ),
                                                  ),
                                                )
                                            ? "Yesterday"
                                            : DateFormat.yMMMd().format(
                                                DateTime.parse(message.date!),
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
                            content: message.content!,
                            isSender: message.senderId.toString() ==
                                    currentUser.toString()
                                ? true
                                : false,
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
                              //! add emoji by inputController
                              // return messages.add(message);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.sentiment_satisfied_alt_outlined,
                              color: Colors.amberAccent,
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
                            onEditingComplete: () {
                              if (messageContent != "") sendMessage();
                            },
                            onChanged: (value) {
                              setState(() {
                                messageContent = value;
                              });
                            },
                          ),
                        ),
                        InkWell(
                          splashColor: Constants.kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            setState(() {
                              //! add attach_file by inputController
                              // return messages.add(message);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.attach_file,
                              color: Colors.amberAccent,
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
                              color: Colors.amberAccent,
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
                            if (messageContent != "") sendMessage();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.send,
                              color: Colors.amberAccent,
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

import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/handlers/error_responses.dart';
import 'package:Artivation/models/messages.dart';
import 'package:Artivation/services/messages/messageApi.dart';
import 'package:Artivation/widgets/app_text.dart';
import 'package:Artivation/widgets/empty_container.dart';
import 'package:Artivation/widgets/error_page.dart';
import 'package:Artivation/widgets/loading_container.dart';
import 'package:flutter/material.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  bool _loading, _error;
  ErrorResponse occurredError;
  List<Message> chats;

  @override
  void initState() {
    _loading = false;
    _error = false;
    chats = [];
    getInboxItems();
    super.initState();
  }

  void getInboxItems() async {
    // var storage = await SharedPreferences.getInstance();
    setState(() {
      _loading = true;
    });

    var _response = await MessagesApi.getConversations(
      payload: {
        "userId": 1,
        // "userId": storage.getString("userId"),
      },
    );

    setState(() {
      _loading = false;
    });

    if (_response.runtimeType.toString() == "ErrorResponse") {
      setState(() {
        _error = true;
      });
      occurredError = _response;
    } else {
      setState(() {
        chats = _response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(
        //     Icons.message_rounded,
        //     color: Constants.kPrimaryColor,
        //   ),
        //   backgroundColor: Color.fromARGB(255, 43, 52, 57),
        //   onPressed: () {},
        // ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  height: 30,
                  width: MediaQuery.of(context).size.width - 14,
                  child: AppText(
                    text: "Messages",
                    isBold: true,
                    size: 18,
                  ),
                ),
              ],
            ),
            Expanded(
              child: _loading
                  ? LoadingContainer()
                  : _error
                      ? ErrorPage(
                          message: occurredError.message,
                          action: () {
                            setState(() {
                              _error = false;
                            });
                            getInboxItems();
                          },
                        )
                      : chats.length > 0
                          ? Container(
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: chats.length,
                                itemBuilder: ((_, index) {
                                  return InboxItem(
                                    senderName: chats[index].senderName,
                                    msgPreview: chats[index].content,
                                    image: chats[index].senderImage,
                                    time: chats[index].date,
                                    unread: chats[index].unread,
                                    chatId: chats[index].chatId,
                                    senderId: chats[index].senderId,
                                  );
                                }),
                              ),
                            )
                          : EmptyContainer(
                              message: "No conversations found.",
                              svgIcon: "assets/icons/noMessages.svg",
                            ),
            ),
          ],
        ),
      ),
    );
  }
}

class InboxItem extends StatefulWidget {
  final String senderName, msgPreview, image;
  final bool unread;
  final String time;
  final int chatId, senderId;

  const InboxItem({
    Key key,
    this.msgPreview,
    this.chatId,
    this.image,
    this.senderName,
    this.senderId,
    this.time,
    this.unread = false,
  }) : super(key: key);

  @override
  State<InboxItem> createState() => _InboxItemState();
}

class _InboxItemState extends State<InboxItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      onTap: () {
        List<Object> _args = [];
        _args.add(widget.chatId);
        _args.add(widget.image);
        _args.add(widget.senderName);
        _args.add(widget.senderId);
        Navigator.of(context).pushNamed("Messages", arguments: _args);
      },
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 2.5, right: 10),
        decoration: BoxDecoration(
          color: widget.unread
              ? Color.fromARGB(96, 204, 219, 215)
              : Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                //* profile image
                Container(
                  margin: EdgeInsets.only(left: 5),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                //* content box
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * .7,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 90,
                            child: AppText(
                              size: 15,
                              text: widget.senderName,
                              isBold: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 90,
                            child: AppText(
                              size: 14,
                              text: widget.msgPreview,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text(
                    widget.time,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: Constants.kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/models/messages.dart';
import 'package:Artivation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 40),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: chats.length,
            itemBuilder: ((_, index) {
              return InboxItem(
                sentBy: chats[index].sender.firstName +
                    " " +
                    chats[index].sender.middleName +
                    " " +
                    chats[index].sender.lastName,
                msgPreview: chats[index].content,
                image: chats[index].sender.imageUrl,
                time: chats[index].date,
                unread: chats[index].unread,
              );
            }),
          ),
        ),
      ),
    );
  }
}

class InboxItem extends StatelessWidget {
  final String sentBy, msgPreview, image;
  final bool unread;
  final DateTime time;

  const InboxItem({
    Key key,
    this.msgPreview,
    this.image,
    this.sentBy,
    this.time,
    this.unread = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      onTap: () {
        Navigator.of(context).pushNamed("Messages");
      },
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 2.5, right: 10),
        decoration: BoxDecoration(
          color:
              unread ? Color.fromARGB(96, 204, 219, 215) : Colors.transparent,
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
                      image: AssetImage(image),
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
                              text: sentBy,
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
                              text: msgPreview,
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
                    DateFormat.Hm().format(time),
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

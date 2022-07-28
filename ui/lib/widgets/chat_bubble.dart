import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String content;
  final String image;
  final bool isSender;

  const ChatBubble({
    this.content,
    this.image = "assets/icons/user.png",
    this.isSender = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //! if sender is me use rtl else use ltr
      textDirection: isSender ? TextDirection.rtl : TextDirection.ltr,
      children: [
        //* text bubble

        // Container(
        //   width: 40,
        //   height: 40,
        //   margin:
        //       EdgeInsets.symmetric(horizontal: 5, vertical: isSender ? 10 : 0),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(100),
        //     image: DecorationImage(
        //       image: AssetImage(image),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 2),
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 4,
                )
              ],
              borderRadius: BorderRadius.circular(5),
              color: isSender
                  ? Color.fromARGB(255, 195, 209, 205)
                  : Color.fromARGB(255, 232, 230, 230),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                content,
                textAlign: isSender ? TextAlign.end : TextAlign.start,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

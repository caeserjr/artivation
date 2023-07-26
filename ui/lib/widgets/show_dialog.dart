import 'package:Artivation/screens/components/rounded_button.dart';
import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {
  final String severity, type, message;
  final double height;
  final dynamic positiveButtonCallback;
  final String positiveButtonText;
  final String negativeButtonText;
  final dynamic negativeButtonCallback;

  const MessageDialog({
    Key? key,
    this.type = "",
    this.message = "",
    this.height = 200,
    this.severity = "info",
    this.positiveButtonCallback,
    this.positiveButtonText = "OK",
    this.negativeButtonCallback,
    this.negativeButtonText = "CANCEL",
  }) : super(key: key);

  //widget builders
  Widget _buildIcon() {
    Color _iconColor;

    switch (severity) {
      case "success":
        _iconColor = Colors.green;
        break;
      case "error":
        _iconColor = Colors.red.withOpacity(.8);
        break;
      case "info":
        _iconColor = Colors.blue;
        break;
      default:
        _iconColor = Colors.grey;
    }

    return Icon(
      Icons.info_outlined,
      color: _iconColor,
      size: 50,
    );
  }

  Widget _buildButtons() {
    if (type == "alert") {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 6,
              color: Colors.black.withOpacity(.4),
            ),
          ],
          color: Colors.grey,
        ),
        width: 100,
        height: 35,
        child: RoundedButton(
          text: positiveButtonText,
          press: positiveButtonCallback,
        ),
      );
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [
        _buildIcon(),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: RawScrollbar(
            thumbColor: Colors.red,
            thickness: 2,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Text(message),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        _buildButtons(),
      ]),
    );
  }
}

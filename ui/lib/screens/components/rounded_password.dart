import 'package:Artivation/screens/components/text_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.visibility),
            border: InputBorder.none),
      ),
    );
  }
}
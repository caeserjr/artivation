import 'package:flutter/material.dart';

TextField buildTextField(String lableText, String placeholder, bool isPass) {
    return TextField(
      obscureText: isPass,
      decoration: InputDecoration(
          labelText: lableText,
          hintText: placeholder,
          hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    );
}
import 'dart:convert';
import 'dart:ui';
import 'package:Artivation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class CustomDialogBox extends StatefulWidget {
  final Image img;

  const CustomDialogBox({Key key, this.img}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  TextEditingController pass = TextEditingController();
  TextEditingController pass2 = TextEditingController();

  void dispose() {
    pass.dispose();
    pass2.dispose();
    super.dispose();
  }

  String _oldpassword, _password, flag, _token;
  bool _obscureText = true;
  bool _obscureText1 = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Future changePass() async {
    String server = Constants.server;
    var map = Map();
    map['flag'] = "changePass";
    map['fcm_token'] = _token;
    map['password'] = _password;
    map['oldpassword'] = _oldpassword;
    map['email'] = "ghalib14@gmail.com";

    var _header = {'Content-Type': 'application/json;charset=UTF-8'};
    var _body = jsonEncode(map);
    var response = await http.post(Uri.http(server, "/artivation/admin.php"),
        headers: _header, body: _body);

    print(response.body);

    if (response.body == 'error') {
      Fluttertoast.showToast(
          msg: 'Failed to change password, try again.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.withOpacity(.8),
          textColor: Colors.white,
          fontSize: 16);
    } else if (response.body == 'wpass') {
      Fluttertoast.showToast(
          msg: 'Failed to verify current password.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.withOpacity(.8),
          textColor: Colors.white,
          fontSize: 16);
    } else if (response.body == 'success') {
      Fluttertoast.showToast(
          msg: 'Password changed successfully.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green.withOpacity(.8),
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  contentBox(context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        child: Container(
          height: size.height * .25,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * .7,
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Expanded(
                        child: TextFormField(
                          controller: pass,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: 'Old Password',
                            icon: Icon(Icons.lock, size: 21),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 21,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          // ignore: missing_return
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Old password required";
                            }
                            if (value.length < 5) {
                              Fluttertoast.showToast(
                                  msg:
                                      'Password character count should be more than 5.',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green.withOpacity(.8),
                                  textColor: Colors.white,
                                  fontSize: 14);
                              // return 'Password character count should be more than 5';
                            }
                          },
                          onSaved: (String value) {
                            _oldpassword = value;
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * .7,
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Expanded(
                        child: TextFormField(
                          controller: pass2,
                          obscureText: _obscureText1,
                          decoration: InputDecoration(
                            hintText: 'New Password',
                            icon: Icon(Icons.lock, size: 21),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 21,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText1 = !_obscureText1;
                                });
                              },
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          // ignore: missing_return
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "New password required.";
                            }
                            if (value.length < 5) {
                              Fluttertoast.showToast(
                                  msg:
                                      'Password character count should be more than 5.',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green.withOpacity(.8),
                                  textColor: Colors.white,
                                  fontSize: 14);
                            }
                          },
                          onSaved: (String value) {
                            _password = value;
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: FlatButton(
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            } else {
                              _formKey.currentState.save();
                              changePass();
                            }
                          },
                          child: Text(
                            'Change Password',
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

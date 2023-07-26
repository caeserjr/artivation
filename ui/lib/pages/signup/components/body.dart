import 'dart:convert';

import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/pages/login/login.dart';
import 'package:Artivation/pages/signup/components/background.dart';
import 'package:Artivation/pages/signup/components/social_icons.dart';
import 'package:Artivation/screens/components/account_checker.dart';
import 'package:Artivation/screens/components/rounded_button.dart';
import 'package:Artivation/screens/components/text_container.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'ordivider.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  final Widget child;

  const Body({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? _email, _password, _token, _fname, _lname, flag;

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();

  @override
  void dispose() {
    user.dispose();
    pass.dispose();
    super.dispose();
  }

  bool _obscureText = true;

  Widget _buildFname() {
    return TextFormField(
      controller: fname,
      decoration: InputDecoration(
          labelText: 'First Name',
          icon: Icon(
            Icons.person,
            size: 21,
          ),
          border: InputBorder.none),
      validator: (String? value) {
        if (value!.trim().isEmpty) {
          return 'Enter First Name';
        }

        // validator has to return something :)
        return null;
      },
      onSaved: (String? value) {
        _fname = value;
      },
    );
  }

  Widget _buildLname() {
    return TextFormField(
      controller: lname,
      decoration: InputDecoration(
          labelText: 'Last Name',
          icon: Icon(
            Icons.person,
            size: 21,
          ),
          border: InputBorder.none),
      validator: (String? value) {
        if (value!.trim().isEmpty) {
          return 'Last Name required.';
        }
        // validator has to return something :)
        return null;
      },
      onSaved: (String? value) {
        _lname = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: user,
      decoration: InputDecoration(
          labelText: 'Email',
          icon: Icon(
            Icons.email,
            size: 21,
          ),
          border: InputBorder.none),
      validator: (String? value) {
        if (value!.trim().isEmpty) {
          return 'Email required';
        }

        if (!RegExp(
                "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
            .hasMatch(value)) {
          return 'Enter a valid email address';
        }

        // validator has to return something :)
        return null;
      },
      onSaved: (String? value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: pass,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        border: InputBorder.none,
        icon: Icon(Icons.lock, size: 21),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
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
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Password required';
        }
        if (value.length < 6) {
          return 'Password character count should be more than 6';
        }
      },
      onSaved: (String? value) {
        _password = value;
      },
    );
  }

  Future register() async {
    String server = Constants.server;
    var map = Map();
    map['flag'] = "reg";
    map['fname'] = _fname!.trim();
    map['lname'] = _lname!.trim();
    map['email'] = _email!.trim();
    map['password'] = _password;

    var _header = {'Content-Type': 'application/json;charset=UTF-8'};
    var _body = jsonEncode(map);
    var response = await http.post(Uri.http(server, "/artivation/admin.php"),
        headers: _header, body: _body);

    print("rESPONSe " + response.body);

    if (response.body == 'exists') {
      Fluttertoast.showToast(
          msg: 'This email exists!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.withOpacity(.8),
          textColor: Colors.white,
          fontSize: 16);
    } else if (response.body == 'error') {
      Fluttertoast.showToast(
          msg: 'Registration failed!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.withOpacity(.8),
          textColor: Colors.white,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: 'Registration successful!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green.withOpacity(.8),
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SIGNUP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldContainer(
                      child: _buildFname(),
                    ),
                    TextFieldContainer(
                      child: _buildLname(),
                    ),
                    TextFieldContainer(
                      child: _buildEmail(),
                    ),
                    TextFieldContainer(
                      child: _buildPassword(),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    RoundedButton(
                      text: 'SIGNUP',
                      press: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _formKey.currentState!.save();
                        flag = '2';
                        _token = 'token';
                        register();
                      },
                    ),
                  ],
                )),
            SizedBox(height: size.height * .01),
            Account(
              login: false,
              press: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Login()));
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: 'assets/icons/google.svg',
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: 'assets/icons/twitter.svg',
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: 'assets/icons/facebook.svg',
                  press: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

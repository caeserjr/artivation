import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/handlers/error_responses.dart';
import 'package:Artivation/pages/signup/components/ordivider.dart';
import 'package:Artivation/pages/signup/components/social_icons.dart';
import 'package:Artivation/pages/signup/signup.dart';
import 'package:Artivation/screens/components/account_checker.dart';
import 'package:Artivation/screens/components/background.dart';
import 'package:Artivation/pages/router.dart';
import 'package:Artivation/screens/components/rounded_button.dart';
import 'package:Artivation/screens/components/text_container.dart';
import 'package:Artivation/services/auth/authApi.dart';
import 'package:Artivation/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool _obscureText = true;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    email = "";
    password = "";
    initiateSharePreferences();
  }

  void initiateSharePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("currentUser", "1");
  }

  @override
  void dispose() {
    user.dispose();
    pass.dispose();
    super.dispose();
  }

  void _showMessageDialog({
    String message = "",
    String severity = "",
    dynamic positiveButtonCallback,
    String positiveButtonText = "Yes",
    dynamic negativeButtonCallback,
    String negativeButtonText = "No",
    String type = "warning",
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

  void login() async {
    setState(() {
      _loading = true;
    });

    var _response = await AuthApi.userLogin(
      payload: {"email": email, "password": password},
    );

    setState(() {
      _loading = false;
    });
    if (_response.runtimeType.toString() == "ErrorResponse") {
      ErrorResponse? _error = _response;
      _showMessageDialog(
        message: _error!.message!,
        severity: "error",
        type: "alert",
        positiveButtonCallback: () {
          Navigator.of(context).pop();
        },
        positiveButtonText: "OK",
      );
    } else {
      print(_response);
      var prefs = await SharedPreferences.getInstance();
      prefs.setString("currentUser", "1");
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => HomePage()),
      //     (route) => false);
    }
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: user,
      decoration: InputDecoration(
        labelText: 'Email',
        border: InputBorder.none,
        icon: Icon(Icons.person, size: 21),
      ),
      validator: (String? value) {
        if (value!.trim().isEmpty) {
          return 'Email required';
        }

        if (!RegExp(
                "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
            .hasMatch(value)) {
          return 'Enter a valid email address.';
        }
        // validator has to return something :)
        return null;
      },
      onSaved: (String? value) {
        email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: pass,
      obscureText: _obscureText,
      decoration: InputDecoration(
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
        labelText: 'Password',
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.visiblePassword,
      // ignore: missing_return
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Password required';
        }
        if (value.length < 5) {
          Fluttertoast.showToast(
              msg: 'Password character count should be more than 5.',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green.withOpacity(.8),
              textColor: Colors.white,
              fontSize: 14);
          // return 'Password character count should be more than 5';
        }
      },
      onSaved: (String? value) {
        password = value;
      },
    );
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
          InkWell(
            splashColor: Color(0xfff0ccfd).withOpacity(.2),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false);
            },
            borderRadius: BorderRadius.circular(150),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(bottom: .0),
                      child: Image.asset(
                        'assets/logo.png',
                        height: 150.0,
                        fit: BoxFit.scaleDown,
                      ))
                ],
              ),
            ),
          ),
          Text(
            'LOGIN',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
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
                    text: 'LOGIN',
                    isLoading: _loading,
                    press: () {
                      if (!_loading) {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _formKey.currentState!.save();
                        login();
                      }
                    },
                  ),
                ],
              )),
          SizedBox(height: size.height * .02),
          Text(
            'Forgot Password ? ',
            style: TextStyle(
              fontSize: 16,
              color: Constants.kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          OrDivider(),
          Account(
            press: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUp()));
            },
          ),
          SizedBox(
            height: 10,
          ),
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
    ));
  }
}

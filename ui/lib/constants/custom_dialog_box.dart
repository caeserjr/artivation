import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/handlers/error_responses.dart';
import 'package:Artivation/services/auth/authApi.dart';
import 'package:Artivation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomDialogBox extends StatefulWidget {
  final Image? img;

  const CustomDialogBox({
    this.img,
  });

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

  ErrorResponse? occurredError;

  String? _oldPassword, _password, flag, _token;
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool? _loading, _error = false;

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

  Future<void> changePass() async {
    setState(() {
      _loading = true;
    });

    var _response = await AuthApi.changePassword(
      payload: {"oldPassword": _oldPassword, "newPassword": _password},
    );

    if (_response.runtimeType.toString() == "ErrorResponse") {
      setState(() {
        _error = true;
      });
      occurredError = _response;
      Fluttertoast.showToast(
        msg: 'Failed to change password, try again.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red.withOpacity(.8),
        textColor: Colors.white,
        fontSize: 16,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Password changed successfully.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green.withOpacity(.8),
        textColor: Colors.white,
        fontSize: 16,
      );
    }
    setState(() {
      _loading = false;
    });
  }

  contentBox(context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Container(
          height: size.height * .25,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: size.width * .7,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Old password required";
                                }
                                if (value.length < 5) {
                                  Fluttertoast.showToast(
                                    msg:
                                        'Password character count should be more than 5.',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:
                                        Colors.green.withOpacity(.8),
                                    textColor: Colors.white,
                                    fontSize: 14,
                                  );
                                  // return 'Password character count should be more than 5';
                                }
                              },
                              onSaved: (String? value) {
                                _oldPassword = value;
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "New password required.";
                                } else if (value.length < 5) {
                                  Fluttertoast.showToast(
                                    msg:
                                        'Password character count should be more than 5.',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:
                                        Colors.green.withOpacity(.8),
                                    textColor: Colors.white,
                                    fontSize: 14,
                                  );
                                }
                              },
                              onSaved: (String? value) {
                                _password = value;
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          } else {
                            _formKey.currentState!.save();
                            changePass();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Constants.kPrimaryColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12.0,
                              ),
                            ),
                          ),
                        ),
                        child: AppText(
                          text: 'Change Password',
                          size: 14,
                          isBold: true,
                          color: Colors.white,
                        ),
                      ),
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

import 'package:Artivation/constants/custom_dialog_box.dart';
import 'package:Artivation/models/users.dart';
import 'package:Artivation/screens/components/profileCard.dart';
import 'package:flutter/material.dart';

class UserSettings extends StatefulWidget {
  final User user;

  const UserSettings({Key key, this.user}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

var date = DateTime.now().toString();
var dateParse = DateTime.parse(date);
var _year;

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      _year = dateParse.year;
    });

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 5,
                                  color: Colors.black.withOpacity(.3),
                                  blurRadius: 10,
                                  offset: Offset(0, 3)),
                            ],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(widget.user.imageUrl),
                            ),
                            border: Border.all(width: 2),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue[100],
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.white),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffECE5E3).withOpacity(.24),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.user.firstName +
                                    " " +
                                    widget.user.middleName +
                                    " " +
                                    widget.user.lastName,
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Color(0xFF8B938D).withOpacity(.4),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.user.email,
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Color(0xFF8B938D).withOpacity(.4),
                    ),
                    InkWell(
                        onTap: () {},
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Birth Date',
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        )),
                    Container(
                      height: 1,
                      color: Color(0xFF8B938D).withOpacity(.4),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Material(
                            child: InkWell(
                              splashColor: Colors.blue,
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomDialogBox();
                                    });
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xff64B6FF).withOpacity(.5),
                                      Color(0xff374ABE).withOpacity(.5)
                                    ], end: Alignment.centerRight),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Colors.lightBlue[100]
                                              .withOpacity(.55),
                                          spreadRadius: 2)
                                    ],
                                    borderRadius: BorderRadius.circular(14)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 6),
                                    child: Text(
                                      'Password Reset',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffECE5E3).withOpacity(.24),
                ),
                child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Color(0xFF8B938D).withOpacity(.4),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 15),
                            child: Text(
                              'Ship To',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Image.asset(
                            'assets/flags/tz.png',
                            height: 22.0,
                            fit: BoxFit.scaleDown,
                          ),
                        ],
                      ),
                    )),
              ),
              ProfileCard(
                onTap: () {},
                label: "Currency",
                iconData: Icons.arrow_forward_ios,
                hasBorder: false,
              ),
              SizedBox(
                height: 20,
              ),
              ProfileCard(
                onTap: () {},
                label: "About Us",
                iconData: Icons.arrow_forward_ios,
              ),
              ProfileCard(
                onTap: () {},
                label: "Disclaimer",
                iconData: Icons.arrow_forward_ios,
              ),
              ProfileCard(
                onTap: () {},
                label: "Feedback",
                iconData: Icons.arrow_forward_ios,
                hasBorder: false,
              ),
              SizedBox(
                height: 20,
              ),
              ProfileCard(
                onTap: () {},
                label: "Rate",
                iconData: Icons.arrow_forward_ios,
              ),
              ProfileCard(
                onTap: () {},
                label: "Privacy Policy",
                iconData: Icons.arrow_forward_ios,
              ),
              ProfileCard(
                onTap: () {},
                label: "Legal Information",
                iconData: Icons.arrow_forward_ios,
                hasBorder: false,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: size.height * .085,
                      width: size.width * .99,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Color(0xff7C9FDF),
                        onPressed: () {},
                        child: Text(
                          'sign out'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 0.0),
                        child: Image.asset(
                          'assets/logolon.png',
                          height: 60.0,
                          fit: BoxFit.scaleDown,
                        )),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Center(
                        child: Text(
                          '\u00a9 2018 - $_year Artivation.co.tz \n          All Rights Reserved.',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

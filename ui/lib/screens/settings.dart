import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/constants/custom_dialog_box.dart';
import 'package:Artivation/models/users.dart';
import 'package:Artivation/screens/components/profileCard.dart';
import 'package:Artivation/widgets/app_text.dart';
import 'package:Artivation/widgets/simple_nav.dart';
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 5, top: 32),
                decoration: BoxDecoration(
                  color: Constants.kPrimaryLightColor.withOpacity(.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.white,
                    size: Constants.iconSize + 5,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 15,
                  top: 32,
                ),
                child: AppText(
                  size: 20,
                  text: "Settings",
                  isBold: true,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              children: [
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
                                  // widget.user.firstName +
                                  //     " " +
                                  //     widget.user.middleName +
                                  //     " " +
                                  //     widget.user.lastName,
                                  "Naruto Uzumaki",
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
                              horizontal: 5,
                              vertical: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "uzukaminaruto@konoha.com",
                                  // widget.user.email,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      gradient: LinearGradient(
                                        colors: [
                                          Constants.kPrimaryLightColor,
                                          Constants.kPrimaryColor
                                        ],
                                        end: Alignment.centerRight,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            color: Colors.lightBlue[100]
                                                .withOpacity(.55),
                                            spreadRadius: 2)
                                      ],
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 6,
                                      ),
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
                            borderRadius: BorderRadius.circular(8),
                          ),
                          color: Constants.kPrimaryLightColor,
                          onPressed: () {},
                          child: Text(
                            'sign out'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
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
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

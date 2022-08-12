import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/models/users.dart';
import 'package:Artivation/widgets/app_text.dart';
import 'package:Artivation/widgets/profile_item.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final User user;
  const UserProfile({Key key, this.user}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          //! tidal design
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: size.height * .4,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 139, 185, 205),
              ),
              child: Column(
                children: [
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          size: 24,
                          text: "Profile",
                          isBold: true,
                          color: Colors.white,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Constants.kPrimaryLightColor,
                            border: Border.all(
                              color: Colors.white.withOpacity(.7),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                "UserSettings",
                              );
                            },
                            iconSize: 30,
                            icon: Icon(Icons.more_vert),
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
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
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    widget.user?.imageUrl ??
                                        "assets/pieces/1.jpg",
                                  ),
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
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
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
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            AppText(
                              size: 20,
                              text: "Naruto Uzumaki",
                              color: Colors.white,
                              isBold: true,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(
                              size: 16,
                              text: "+255 712 160 406",
                              color: Colors.white70,
                              isBold: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  left: 15,
                  bottom: 5,
                ),
                child: AppText(
                  size: 20,
                  isBold: true,
                  text: "Account Overview",
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ProfileCardItem(
                  action: () {
                    print("1");
                  },
                  color: Colors.green,
                  title: "My Orders",
                  cardIcon: Icons.shopping_bag_outlined,
                ),
                ProfileCardItem(
                  action: () {},
                  color: Colors.blue,
                  title: "Refunds",
                  cardIcon: Icons.monetization_on_outlined,
                ),
                ProfileCardItem(
                  action: () {},
                  color: Colors.purple,
                  title: "Refunds",
                  cardIcon: Icons.shopping_bag_outlined,
                ),
                ProfileCardItem(
                  action: () {},
                  color: Colors.orange,
                  title: "Change Password",
                  cardIcon: Icons.lock_open_rounded,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height - 80);
    var firstStart = Offset(size.width / 5, size.height - 15);

    var firstEnd = Offset(size.width / 2.5, size.height - 50);

    path.quadraticBezierTo(
      firstStart.dx,
      firstStart.dy,
      firstEnd.dx,
      firstEnd.dy,
    );

    var secondStart = Offset(
      size.width - (size.width / 3.24),
      size.height - 105,
    );

    var secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
      secondStart.dx,
      secondStart.dy,
      secondEnd.dx,
      secondEnd.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

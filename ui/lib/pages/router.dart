import 'package:Artivation/pages/home.dart';
import 'package:Artivation/pages/cart/cart.dart';
import 'package:Artivation/pages/messages/inbox.dart';
import 'package:Artivation/screens/index.dart';
import 'package:Artivation/screens/myprofile.dart';
import 'package:flutter/material.dart';
import 'package:Artivation/pages/login/body.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import "package:Artivation/constants/theme.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //state variables
  int _selectedPage;

  void initState() {
    super.initState();
    _selectedPage = 0;
  }

  Widget _fragmentBuilder() {
    switch (_selectedPage) {
      case 0:
        return FragHome();
        break;
      case 1:
        return LoginPage();
        break;
      case 2:
        return Inbox();
        break;
      case 3:
        return FragmentCart();
        break;
      case 4:
        return UserProfile();
        break;
      default:
        return FragmentIndex();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 52,
              child: SafeArea(child: _fragmentBuilder()),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 52,
        backgroundColor: Colors.transparent,
        color: AppTheme.colorBlack,
        items: const <Widget>[
          Icon(
            Icons.home_filled,
            size: 30,
            color: AppTheme.colorMain,
          ),
          Icon(
            Icons.supervised_user_circle_outlined,
            size: 30,
            color: AppTheme.colorMain,
          ),
          Icon(
            Icons.mail,
            size: 30,
            color: AppTheme.colorMain,
          ),
          Icon(
            Icons.shopping_bag_sharp,
            size: 30,
            color: AppTheme.colorMain,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: AppTheme.colorMain,
          ),
        ],
        animationCurve: Curves.ease,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }
}

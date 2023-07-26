import 'package:Artivation/models/pieces.dart';
import 'package:Artivation/models/users.dart';
import 'package:Artivation/pages/cart/buy_now.dart';
import 'package:Artivation/pages/explore/explore.dart';
import 'package:Artivation/pages/login/login.dart';
import 'package:Artivation/pages/messages/chat_screen.dart';
import 'package:Artivation/pages/profile/profile.dart';
import 'package:Artivation/pages/router.dart';
import 'package:Artivation/pages/splash.dart';
import 'package:Artivation/pages/welcome/welcome.dart';
import 'package:Artivation/screens/settings.dart';
import 'package:Artivation/widgets/preview_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.top]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
      title: 'Artivation',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'Welcome':
            return MaterialPageRoute(
              builder: (context) => WelcomePage(),
            );
          case 'Splash':
            return MaterialPageRoute(
              builder: (context) => Splash(),
            );
          case 'Login':
            return MaterialPageRoute(
              builder: (context) => Login(),
            );
          case 'HomePage':
            return MaterialPageRoute(
              builder: (context) => HomePage(),
            );
          case 'Explore':
            return MaterialPageRoute(
              builder: (context) => ExplorePage(),
            );
          case 'UserProfile':
            return MaterialPageRoute(
              builder: (context) => UserProfile(
                user: settings.arguments as User,
              ),
            );
          case 'UserSettings':
            return MaterialPageRoute(
              builder: (context) => UserSettings(
                user: settings.arguments as User,
              ),
            );
          case 'PreviewImage':
            return MaterialPageRoute(
              builder: (context) => PreviewImage(
                piece: settings.arguments as ArtPiece,
              ),
            );
          case 'BuyNow':
            return MaterialPageRoute(
              builder: (context) => BuyNow(
                piece: settings.arguments as ArtPiece,
              ),
            );
          case 'Messages':
            var args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) => ChatScreen(
                chatId: args['chatId'],
                profileImg: args["image"],
                chatName: args["senderName"],
                chatWith: args["senderId"],
              ),
            );
          default:
            return null;
        }
      },
    );
  }
}

import 'package:Artivation/pages/explore/explore.dart';
import 'package:Artivation/pages/login/login.dart';
import 'package:Artivation/pages/messages/chat_screen.dart';
import 'package:Artivation/pages/router.dart';
import 'package:Artivation/pages/splash.dart';
import 'package:Artivation/pages/welcome/welcome.dart';
import 'package:Artivation/widgets/preview_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      title: 'Artivation',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white),
      home: Splash(),
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
          case 'PreviewImage':
            return MaterialPageRoute(
              builder: (context) => PreviewImage(piece: settings.arguments),
            );
          case 'Messages':
            List<Object> args = settings.arguments;
            return MaterialPageRoute(
              builder: (context) => ChatScreen(
                chatId: args[0],
                profileImg: args[1],
                chatName: args[2],
                chatWith: args[3],
              ),
            );
          default:
            return null;
        }
      },
    );
  }
}

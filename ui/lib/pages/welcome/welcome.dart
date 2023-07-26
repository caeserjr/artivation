import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/widgets/app_text.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/pieces/" + images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        AppText(
                          text: "Art is an explosion.",
                          size: 30,
                        ),
                        Container(
                          width: 250,
                          child: Text("Testing the description."),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(
                        images.length,
                        (indexDots) => Container(
                          width: 8,
                          height: index == indexDots ? 25 : 10,
                          margin: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: index == indexDots
                                ? Constants.kPrimaryColor
                                : Constants.kPrimaryColor.withOpacity(.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}

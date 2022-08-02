import 'package:Artivation/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';

class LoadingContainer extends StatefulWidget {
  const LoadingContainer({Key key}) : super(key: key);

  @override
  State<LoadingContainer> createState() => _LoadingContainerState();
}

class _LoadingContainerState extends State<LoadingContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Loading(
            indicator: BallSpinFadeLoaderIndicator(),
            size: 40.0,
            color: Constants.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}

import 'package:Artivation/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';

class EmptyContainer extends StatefulWidget {
  final String message;
  const EmptyContainer({Key key, this.message}) : super(key: key);

  @override
  State<EmptyContainer> createState() => _EmptyContainerState();
}

class _EmptyContainerState extends State<EmptyContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            widget.message,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}

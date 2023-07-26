import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyContainer extends StatefulWidget {
  final String message, svgIcon;
  const EmptyContainer({
    Key? key,
    required this.message,
    this.svgIcon = "assets/icons/attention.svg",
  }) : super(key: key);

  @override
  State<EmptyContainer> createState() => _EmptyContainerState();
}

class _EmptyContainerState extends State<EmptyContainer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: SvgPicture.asset(
              widget.svgIcon,
              height: 90,
              width: 90,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 5),
            alignment: Alignment.center,
            child: Text(
              widget.message,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

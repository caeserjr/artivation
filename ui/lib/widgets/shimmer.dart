import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final double? width, height;
  final ShapeBorder shapeBorder;

  const ShimmerEffect.rectangular({
    this.width = double.infinity,
    this.height,
    this.shapeBorder = const RoundedRectangleBorder(),
  });

  const ShimmerEffect.circular({
    this.width,
    this.height,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade300,
      period: Duration(seconds: 3),
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.grey,
          shape: shapeBorder,
        ),
      ),
    );
  }
}

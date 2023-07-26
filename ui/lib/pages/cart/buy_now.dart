import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/models/pieces.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class BuyNow extends StatefulWidget {
  final ArtPiece piece;
  const BuyNow({
    required this.piece,
  });

  @override
  State<BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: size.height * .6,
          child: Stack(
            children: [
              PhotoView(
                minScale: PhotoViewComputedScale.covered,
                maxScale: PhotoViewComputedScale.contained * 4,
                imageProvider: AssetImage(widget.piece.pieceImage!),
              ),
              SafeArea(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.4),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: size.height * .4,
          color: Colors.blueAccent,
        ),
      ],
    ));
  }
}

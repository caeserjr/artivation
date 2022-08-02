import 'package:Artivation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:photo_view/photo_view.dart';

class PreviewImage extends StatefulWidget {
  final String imageUrl;
  const PreviewImage({Key key, this.imageUrl}) : super(key: key);

  @override
  State<PreviewImage> createState() => _PreviewImageState();
}

class _PreviewImageState extends State<PreviewImage> {
  final transformationController = TransformationController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                child: PhotoView(
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.contained * 4,
                  imageProvider: AssetImage(widget.imageUrl),
                ),
              ),
              SafeArea(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.4),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.chevron_left_rounded,
                              color: Colors.white,
                              size: Constants.iconSize + 5,
                            ),
                            onPressed: () => Navigator.pop(context)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

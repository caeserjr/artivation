import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/handlers/error_responses.dart';
import 'package:Artivation/models/pieces.dart';
import 'package:Artivation/models/users.dart';
import 'package:Artivation/services/users/users.dart';
import 'package:Artivation/widgets/app_text.dart';
import 'package:Artivation/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PreviewImage extends StatefulWidget {
  final ArtPiece piece;
  const PreviewImage({Key key, this.piece}) : super(key: key);

  @override
  State<PreviewImage> createState() => _PreviewImageState();
}

class _PreviewImageState extends State<PreviewImage> {
  bool _error, _loadingArtist;
  ErrorResponse occurredError;
  User artist;

  void initState() {
    super.initState();
    _loadingArtist = false;
    getArtistDetails();
  }

  void getArtistDetails() async {
    setState(() {
      _loadingArtist = true;
    });
    var _response = await UserApi.getUsers(
      payload: {
        "userId": widget.piece.pieceArtist,
      },
    );
    if (_response.runtimeType.toString() == "ErrorResponse") {
      setState(() {
        _error = true;
        _loadingArtist = false;
      });
      occurredError = _response;
    } else {
      setState(() {
        _loadingArtist = false;
        artist = _response[0];
      });
    }
  }

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
                  minScale: PhotoViewComputedScale.covered,
                  maxScale: PhotoViewComputedScale.contained * 4,
                  imageProvider: AssetImage(widget.piece.pieceImage),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.black.withOpacity(.5),
                  ),
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 5,
                    ),
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              artist?.imageUrl ?? "assets/icons/user.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child:
                            _loadingArtist ? LoadingContainer(size: 30) : null,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: AppText(
                          color: Colors.white,
                          text: artist?.userName?.toUpperCase() ?? "Artist",
                          isBold: true,
                          size: 15,
                        ),
                      ),
                    ]),
                  ),
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
                          onPressed: () => Navigator.pop(context),
                        ),
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

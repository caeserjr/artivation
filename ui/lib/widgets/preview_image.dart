import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/handlers/error_responses.dart';
import 'package:Artivation/models/pieces.dart';
import 'package:Artivation/models/users.dart';
import 'package:Artivation/services/pieces/piecesApi.dart';
import 'package:Artivation/services/users/users.dart';
import 'package:Artivation/widgets/app_text.dart';
import 'package:Artivation/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreviewImage extends StatefulWidget {
  final ArtPiece piece;
  const PreviewImage({Key key, this.piece}) : super(key: key);

  @override
  State<PreviewImage> createState() => _PreviewImageState();
}

class _PreviewImageState extends State<PreviewImage> {
  bool _error, _loadingArtist, isLiked;
  ErrorResponse occurredError;
  User artist;
  SharedPreferences prefs;

  void initState() {
    super.initState();
    isLiked = false;
    _loadingArtist = false;

    getArtistDetails();
    checkLikeStatus();
  }

  void checkLikeStatus() async {
    prefs = await SharedPreferences.getInstance();
    var _response = await PiecesApi.likeStatus(
      payload: {
        "userId": prefs.getString("currentUser"),
        "pieceId": widget.piece.pieceId.toString(),
      },
    );
    if (_response.runtimeType.toString() == "ErrorResponse") {
      setState(() {
        _error = true;
      });
      occurredError = _response;
    } else {
      setState(() {
        isLiked = _response["data"];
      });
    }
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
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: Colors.black.withOpacity(.75),
                  ),
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 5,
                    ),
                    child: _loadingArtist
                        ? LoadingContainer(
                            type: "profile",
                          )
                        : Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      artist?.imageUrl ??
                                          "assets/icons/user.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: AppText(
                                      color: Colors.white,
                                      text: artist?.userName?.toUpperCase() ??
                                          "Artist",
                                      isBold: true,
                                      size: 15,
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    margin: EdgeInsets.only(left: 15),
                                    child: AppText(
                                      color: Colors.white,
                                      text: widget.piece.pieceDesc ??
                                          "Piece Description",
                                      size: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    height: 90,
                                    width: 80,
                                    child: InkWell(
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isLiked = !isLiked;
                                          });
                                        },
                                        icon: Icon(
                                          isLiked
                                              ? Icons.favorite
                                              : Icons.favorite_border_rounded,
                                          size: 35,
                                          color:
                                              Color.fromARGB(255, 251, 48, 116),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  height: size.height * .35,
                                                  width: size.width,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(30),
                                                      topRight:
                                                          Radius.circular(30),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                              left: 10,
                                                              top: 20,
                                                            ),
                                                            height: 50,
                                                            child: AppText(
                                                              text:
                                                                  "TZS ${widget.piece.price}",
                                                              isBold: true,
                                                              size: 24,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 10,
                                                        ),
                                                        alignment:
                                                            Alignment.topLeft,
                                                        height: 150,
                                                        child: Flexible(
                                                          child: Text(
                                                            widget.piece
                                                                .pieceDesc,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 30),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(
                                                                Icons
                                                                    .message_rounded,
                                                              ),
                                                            ),
                                                            ElevatedButton(
                                                              onPressed: () {},
                                                              style:
                                                                  ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all<
                                                                            Color>(
                                                                  Constants
                                                                      .kPrimaryColor
                                                                      .withOpacity(
                                                                    .9,
                                                                  ),
                                                                ),
                                                                shape: MaterialStateProperty
                                                                    .all<
                                                                        RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      15.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              child: Text(
                                                                'Add To Cart',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            ElevatedButton(
                                                              onPressed: () {},
                                                              style:
                                                                  ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all<
                                                                            Color>(
                                                                  Constants
                                                                      .kPrimaryColor,
                                                                ),
                                                                shape: MaterialStateProperty
                                                                    .all<
                                                                        RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      15.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              child: Text(
                                                                'Buy Now',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Constants.kPrimaryColor,
                                        ),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Buy Piece',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
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
        ],
      ),
    );
  }
}

import 'package:Artivation/handlers/error_responses.dart';
import 'package:Artivation/models/pieces.dart';
import 'package:Artivation/services/pieces/piecesApi.dart';
import 'package:Artivation/widgets/empty_container.dart';
import 'package:Artivation/widgets/error_page.dart';
import 'package:Artivation/widgets/explore_item.dart';
import 'package:Artivation/widgets/loading_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';

class PieceStaggered extends StatefulWidget {
  @override
  State<PieceStaggered> createState() => _PieceStaggeredState();
}

class _PieceStaggeredState extends State<PieceStaggered> {
  bool _loading = false, _error = false;
  ErrorResponse? occurredError;
  List<ArtPiece> pieces = [];

  void initState() {
    super.initState();
    _loading = false;
    _error = false;
    getExploreItems();
  }

  void getExploreItems() async {
    // var storage = await SharedPreferences.getInstance();
    setState(() {
      _loading = true;
    });

    var _response = await PiecesApi.getArtPieces(
      payload: {
        "category": 1,
        // "userId": storage.getString("userId"),
      },
    );

    if (_response.runtimeType.toString() == "ErrorResponse") {
      setState(() {
        _error = true;
      });
      occurredError = _response;
    } else {
      setState(() {
        pieces = _response;
      });
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _error
          ? ErrorPage(
              message: occurredError!.message,
              action: () {
                setState(() {
                  _error = false;
                });
                getExploreItems();
              },
            )
          : (pieces.length <= 0 && _loading != true)
              ? EmptyContainer(
                  message: "No items found.",
                )
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: MasonryView(
                    listOfItem: pieces,
                    numberOfColumn: 2,
                    itemPadding: 5,
                    itemBuilder: (item) {
                      return _loading
                          ? LoadingContainer(type: "explore")
                          : ExploreItem(
                              piece: item,
                            );
                    },
                  ),
                ),
    );
  }
}

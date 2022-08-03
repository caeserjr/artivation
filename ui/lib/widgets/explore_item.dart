import 'package:Artivation/models/pieces.dart';
import 'package:flutter/material.dart';

class ExploreItem extends StatefulWidget {
  final ArtPiece piece;
  const ExploreItem({Key key, this.piece}) : super(key: key);

  @override
  State<ExploreItem> createState() => _ExploreItemState();
}

class _ExploreItemState extends State<ExploreItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed("PreviewImage", arguments: widget.piece);
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Stack(
          children: [
            Image.asset(
              widget.piece.pieceImage,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.piece.pieceName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      widget.piece.pieceDesc,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

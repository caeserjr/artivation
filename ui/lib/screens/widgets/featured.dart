import 'package:Artivation/models/pieces.dart';
import 'package:flutter/material.dart';

class BuildFeatured extends StatefulWidget {
  const BuildFeatured({Key key}) : super(key: key);

  @override
  State<BuildFeatured> createState() => _BuildFeaturedState();
}

List<ArtPiece> _featuredItems = [
  ArtPiece(
      pName: 'Lions',
      price: 1000,
      pImg:
          'https://images.unsplash.com/photo-1541701494587-cb58502866ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
  ArtPiece(
      pName: 'Lions',
      price: 1000,
      pImg:
          'https://images.unsplash.com/photo-1541701494587-cb58502866ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
  ArtPiece(
      pName: 'Lions',
      price: 1000,
      pImg:
          'https://images.unsplash.com/photo-1541701494587-cb58502866ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
];

class _BuildFeaturedState extends State<BuildFeatured> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //Featured Art
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Featured Art',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // Search Bar
            height: 300,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: _featuredItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 250,
                    width: 250,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: 15,
                          child: Container(
                            width: 220,
                            height: 230,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image:
                                      NetworkImage(_featuredItems[index].pImg),
                                  fit: BoxFit.cover,
                                  //colorFilter: ColorFilter.mode(Colors.white.withOpacity(.4),BlendMode.lighten)
                                )),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 5,
                          child: Container(
                            height: 70,
                            width: 240,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 2),
                                      color: Colors.redAccent.withOpacity(0.08),
                                      blurRadius: 4,
                                      spreadRadius: 2)
                                ]),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

import 'package:Artivation/models/category_item.dart';
import 'package:Artivation/models/pieces.dart';
import 'package:flutter/material.dart';

class FragmentIndex extends StatefulWidget {
  @override
  _FragmentIndexState createState() => _FragmentIndexState();
}

class _FragmentIndexState extends State<FragmentIndex> {
  String _offerString;
  List<CategoryItem> _listCategories = [
    CategoryItem(categoryName: 'Music', icon: Icons.music_note),
    CategoryItem(categoryName: 'Art', icon: Icons.color_lens),
    CategoryItem(categoryName: 'Videos', icon: Icons.video_call_rounded),
    CategoryItem(categoryName: 'Brush', icon: Icons.brush),
    CategoryItem(categoryName: 'Paintings', icon: Icons.format_paint),
  ];

  List<ArtPiece> _featuredItems = [
    ArtPiece(
        pieceName: 'Lions',
        price: 1000,
        pieceImage:
            'https://images.unsplash.com/photo-1541701494587-cb58502866ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
    ArtPiece(
        pieceName: 'Lions',
        price: 1000,
        pieceImage:
            'https://images.unsplash.com/photo-1541701494587-cb58502866ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
    ArtPiece(
        pieceName: 'Lions',
        price: 1000,
        pieceImage:
            'https://images.unsplash.com/photo-1541701494587-cb58502866ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
  ];

  void initState() {
    super.initState();
    _offerString = '60%';
  }

  void fetchData() {}

  Widget _buildCategories() {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _listCategories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: InkWell(
              splashColor: Colors.blueAccent,
              borderRadius: BorderRadius.circular(25),
              onTap: () {}, //open cat page
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white.withOpacity(0.8),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 3,
                            spreadRadius: 1)
                      ]),
                  child: Row(
                    children: [
                      Icon(
                        _listCategories[index].icon,
                        color: Colors.blueGrey,
                        size: 22,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        _listCategories[index].categoryName,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  )),
            ),
          );
        });
  }

  Widget _buildFeatured() {
    return ListView.builder(
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
                          image: NetworkImage(_featuredItems[index].pieceImage),
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  // Welcome
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 130,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          'Welcome to Artivation',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '$_offerString Offer today',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        //Categories
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: _buildCategories(),
                        height: 60,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
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
                        child: _buildFeatured(),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //SearchBar
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 3,
                              spreadRadius: 1)
                        ]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Color(0xff999999),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Search Art...',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff999999),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    //Likes
                    height: 60,
                    width: 60,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 4),
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 3,
                              spreadRadius: 1)
                        ]),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.redAccent.withOpacity(0.8),
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    //Settings
                    height: 60,
                    width: 60,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 3,
                              spreadRadius: 1)
                        ]),
                    child: Center(
                      child: Icon(
                        Icons.settings,
                        color: Color(0xff999999),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

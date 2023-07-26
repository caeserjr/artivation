import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/models/category_item.dart';
import 'package:flutter/material.dart';

class BuildCategories extends StatefulWidget {
  const BuildCategories({Key? key}) : super(key: key);

  @override
  State<BuildCategories> createState() => _BuildCategoriesState();
}

class _BuildCategoriesState extends State<BuildCategories> {
  int selectedCategory = 0;
  List<CategoryItem> _listCategories = [
    CategoryItem(categoryName: 'Music', icon: Icons.music_note),
    CategoryItem(categoryName: 'Art', icon: Icons.color_lens),
    CategoryItem(categoryName: 'Videos', icon: Icons.video_call_rounded),
    CategoryItem(categoryName: 'Brush', icon: Icons.brush),
    CategoryItem(categoryName: 'Paintings', icon: Icons.format_paint),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      color: Colors.transparent,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _listCategories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: InkWell(
              splashColor: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                setState(() {
                  selectedCategory = index;
                });
              }, //open cat page
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.8),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 4),
                          color: selectedCategory == index
                              ? Constants.kPrimaryLightColor.withOpacity(.45)
                              : Colors.grey.withOpacity(0.2),
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/models/category_item.dart';
import 'package:flutter/material.dart';

class BuildCategories extends StatefulWidget {
  const BuildCategories({Key key}) : super(key: key);

  @override
  State<BuildCategories> createState() => _BuildCategoriesState();
}

List<CategoryItem> _listCategories = [
  CategoryItem(categoryName: 'Music'),
  CategoryItem(categoryName: 'Art', icon: Icons.color_lens),
  CategoryItem(categoryName: 'Videos', icon: Icons.video_call_rounded),
  CategoryItem(categoryName: 'Brush', icon: Icons.brush),
  CategoryItem(categoryName: 'Paintings', icon: Icons.format_paint),
];

class _BuildCategoriesState extends State<BuildCategories> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _listCategories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(5),
                  child: InkWell(
                    splashColor: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {}, //open cat page
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.86),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 4),
                                color: Color.fromARGB(255, 135, 134, 134)
                                    .withOpacity(0.3),
                                blurRadius: 3,
                                spreadRadius: 1)
                          ]),
                      child: Row(
                        children: [
                          Icon(
                            _listCategories[index].icon,
                            color: Colors.blueGrey,
                            size: Constants.iconSize,
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
              }),
          height: 55,
        ),
      ],
    );
  }
}

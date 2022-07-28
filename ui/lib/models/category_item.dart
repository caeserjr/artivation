import 'package:flutter/material.dart';

class CategoryItem {
  String categoryName;
  IconData icon;

  CategoryItem({this.categoryName, this.icon});

  CategoryItem.fromJSON(Map<String, dynamic> json) {
    this.categoryName = json['categoryName'];
    switch (json['categoryName']) {
      case 'Music':
      case 'music':
        this.icon = Icons.music_note;
        break;
      default:
    }
  }
}

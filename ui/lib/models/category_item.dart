import 'package:flutter/material.dart';

class CategoryItem {
  String categoryName;
  IconData icon;

  CategoryItem({
    required this.categoryName,
    required this.icon,
  });

  CategoryItem.fromJSON(Map<String, dynamic> json)
      : this.categoryName = json['categoryName'],
        this.icon = _getCategoryIcon(json['categoryName']);
}

IconData _getCategoryIcon(String categoryName) {
  switch (categoryName) {
    case 'Music':
    case 'music':
      return Icons.music_note;
    default:
      return Icons.adb;
  }
}

import 'dart:ffi';

import 'package:cozzinhe2/models/category_item.dart';

class Item {
  final String name;
  final String categories;
  final String? image;

  const Item({
    required this.name,
    required this.categories,
    this.image,
  });
}

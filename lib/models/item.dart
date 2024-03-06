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

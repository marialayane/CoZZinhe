import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../models/item.dart';
import '../../../models/category_item.dart';

class IgredientItem extends StatelessWidget {
  final Item item;
  final Categoria categoria;

  final availableWidth = mediaQueryData.size.width -
      mediaQueryData.padding.left -
      mediaQueryData.padding.right;

  IgredientItem(this.item, this.categoria, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
          footer: SizedBox(
            height: availableWidth * 0.08,
            child: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(
                item.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              trailing: const Icon(
                size: 17,
                Icons.remove_circle_outline_rounded,
                color: Colors.white,
              ),
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Image.asset(
              categoria.imagePath,
              fit: BoxFit.cover,
            ),
          )),
    );
    /*return Column(children: [
      SizedBox(
        width: availableWidth * 1,
        child: Card(
          elevation: 2,
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  categoria.imagePath,
                  height: availableWidth * 0.15,
                  width: availableWidth * 0.15,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: availableWidth * 0.25,
                    child: Text(
                      item.name,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    size: 20,
                    Icons.remove_circle_outline_rounded,
                    color: Colors.black,
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    ]);*/
  }
}

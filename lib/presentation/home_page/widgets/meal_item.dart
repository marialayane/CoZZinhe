import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  final availableWidth = mediaQueryData.size.width -
      mediaQueryData.padding.left -
      mediaQueryData.padding.right;

  MealItem(this.meal, {Key? key}) : super(key: key);

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      AppRoutes.mealDetail,
      arguments: meal,
    )
        .then((result) {
      if (result == null) {
        print('Sem resultado!');
      } else {
        print('O nome da refeição é $result.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Column(children: [
        SizedBox(
          width: availableWidth * 1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            // margin: const EdgeInsets.all(10),
            child: Row(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Image.network(
                  meal.imageUrl,
                  height: availableWidth * 0.3,
                  width: availableWidth * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: availableWidth * 0.6,
                height: availableWidth * 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.none,
                            child: Text(
                              meal.title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber),
                                Text(
                                  '${meal.duration}',
                                  style: const TextStyle(color: Colors.amber),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.schedule),
                                Text('${meal.duration} min',
                                    style: const TextStyle(color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}

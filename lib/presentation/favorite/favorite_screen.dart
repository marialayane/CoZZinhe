import 'package:flutter/material.dart';
import '../home_page/widgets/meal_item.dart';
import '../../models/meal.dart';
import '../../../core/app_export.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  final availableHeight = mediaQueryData.size.height -
      mediaQueryData.padding.top -
      mediaQueryData.padding.bottom;
  final availableWidth = mediaQueryData.size.width -
      mediaQueryData.padding.left -
      mediaQueryData.padding.right;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Stack(children: [
        SizedBox(
          height: availableHeight * 0.65,
          width: availableWidth * 1,
          child: Image.asset(
            'assets/images/cozzinheLogoCinza.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: availableHeight * 0.65),
            child: Text(
              'Nenhuma refeição foi marcada como favorita!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ]);
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}

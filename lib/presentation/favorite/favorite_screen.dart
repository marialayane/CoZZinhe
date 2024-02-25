import 'package:flutter/material.dart';
import '../home_page/meal_item.dart';
import '../../models/meal.dart';
import '../../../core/app_export.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final availableHeight = mediaQueryData.size.height -
      mediaQueryData.padding.top -
      mediaQueryData.padding.bottom;

  final availableWidth = mediaQueryData.size.width -
      mediaQueryData.padding.left -
      mediaQueryData.padding.right;

  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
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
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: Column(children: [
              _buildStackView(context),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.favoriteMeals.length,
                  itemBuilder: (ctx, index) {
                    return MealItem(widget.favoriteMeals[index]);
                  },
                ),
              ),
            ]),
          ),
        ),
      );
    }
  }

  Widget _buildStackView(BuildContext context) {
    return SizedBox(
      height: 60.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 50.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: appTheme.blueGray50,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: AppDecoration.outlineBlack900,
              child: Text(
                "CoZZinhe",
                style: theme.textTheme.displayMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

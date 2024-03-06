import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../../../core/app_export.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;

  const MealDetailScreen(this.onToggleFavorite, this.isFavorite, {Key? key})
      : super(key: key);

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    final availableWidth = mediaQueryData.size.width -
        mediaQueryData.padding.left -
        mediaQueryData.padding.right;
    final availableHeight = mediaQueryData.size.height -
        mediaQueryData.padding.top -
        mediaQueryData.padding.bottom;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildStackView(context),
            SizedBox(height: availableHeight * 0.03),
            Container(
              width: availableWidth * 0.9,
              padding: const EdgeInsets.all(2),
              height: availableHeight * 0.05,
              decoration: BoxDecoration(
                color: const Color(0XFFE62F31),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                meal.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: availableHeight * 0.02),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                  height: availableHeight * 0.33,
                  width: availableWidth * 0.9,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        meal.imageUrl,
                        fit: BoxFit.cover,
                      ))),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            Container(
              width: availableWidth * 0.9,
              height: availableHeight * 0.35,
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
              margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 206, 86),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Expanded(
                child: ListView.builder(
                    itemCount: meal.ingredients.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(
                            meal.ingredients[index],
                            style: const TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            _createSectionTitle(context, 'Passos'),
            Container(
              width: availableWidth * 0.9,
              height: availableHeight * 0.35,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 115, 117),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Expanded(
                child: ListView.builder(
                    itemCount: meal.ingredients.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(
                            meal.steps[index],
                            style: const TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0XFFE62F31),
        child: Icon(
          isFavorite(meal) ? Icons.favorite : Icons.favorite_border,
          color: Colors.white,
        ),
        onPressed: () {
          onToggleFavorite(meal);
        },
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

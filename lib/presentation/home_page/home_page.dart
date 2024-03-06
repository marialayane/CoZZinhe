import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '/widgets/custom_elevated_button.dart';
import '/widgets/custom_search_view.dart';
import '../../data/meals.dart';
import 'meal_item.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  final availableHeight = mediaQueryData.size.height -
      mediaQueryData.padding.top -
      mediaQueryData.padding.bottom;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildStackView(context),
              SizedBox(height: 3.v),
              _buildBarraDePesquisa(context),
              SizedBox(height: 10.v),
              _buildFiltrosRow(context),
              SizedBox(height: 10.v),
              _buildHomeList(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
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

  /// Section Widget
  Widget _buildBarraDePesquisa(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadius.circular(70),
      ),
      margin: EdgeInsets.only(
        left: 35.h,
        right: 35.h,
      ),
      child: CustomSearchView(
        controller: searchController,
        hintText: "Pesquisar",
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildFiltrosRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 35.h,
        right: 47.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.v),
            child: const Text(
              "Sugestões",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CustomElevatedButton(
            onPressed: () => {},
            height: 35.v,
            width: 115.h,
            text: "Filtros",
            margin: EdgeInsets.only(bottom: 5.v),
            leftIcon: Container(
              margin: EdgeInsets.only(right: 8.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgMifilter,
                height: 24.v,
                width: 18.h,
              ),
            ),
            buttonTextStyle: CustomTextStyles.bodyMediumBlack90014,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHomeList(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          itemCount: Meals.length,
          itemBuilder: (ctx, index) {
            return MealItem(Meals[index]);
          },
        ),
      ),
    );
  }
}

import '../home_page/widgets/homelist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luko1de_s_cozzinhe/core/app_export.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_elevated_button.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.outlineBlack9002,
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
      width: 360.h,
      margin: EdgeInsets.symmetric(horizontal: 35.h),
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 4.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: CustomSearchView(
        width: 24.adaptSize,
        controller: searchController,
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
            child: Text(
              "Sugestões",
              style: theme.textTheme.titleLarge,
            ),
          ),
          CustomElevatedButton(
            height: 30.v,
            width: 108.h,
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
    // Exemplo de dados para cada item na lista
    List<Map<String, String>> itemList = [
      {
        'imagePath': ImageConstant.boloDeBanana,
        'title': 'Bolo de Banana',
        'rating': '5',
        'time': '120 min',
      },
      {
        'imagePath': ImageConstant.boloDeCenoura,
        'title': 'Bolo de Cenoura',
        'rating': '4.5',
        'time': '40 min',
      },
      {
        'imagePath': ImageConstant.pratocamarao,
        'title': 'Risoto de Camarão',
        'rating': '5',
        'time': '40 min',
      },
      {
        'imagePath': ImageConstant.guioza,
        'title': 'Guioza',
        'rating': '5',
        'time': '55 min',
      },
      {
        'imagePath': ImageConstant.boloIntegral,
        'title': 'Bolo Integral',
        'rating': '3.5',
        'time': '75 min',
      },
      {
        'imagePath': ImageConstant.imageNotFound,
        'title': 'ImageNotFound',
        'rating': '?',
        'time': '?',
      },
      {
        'imagePath': ImageConstant.imageNotFound,
        'title': 'ImageNotFound',
        'rating': '?',
        'time': '?',
      },
    ];

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 12.v,
            );
          },
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            final item = itemList[index];
            return HomelistItemWidget(
              imagePath: item['imagePath'] ?? '',
              title: item['title'] ?? '',
              rating: item['rating'] ?? '',
              time: item['time'] ?? '',
            );
          },
        ),
      ),
    );
  }
}

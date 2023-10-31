import '../perfil_page/widgets/dietaryrestrictionslist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luko1de_s_cozzinhe/core/app_export.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_search_view.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class PerfilPage extends StatelessWidget {
  PerfilPage({Key? key})
      : super(
          key: key,
        );

  TextEditingController group176Controller = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController group174Controller = TextEditingController();

  TextEditingController searchController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.outlineBlack9002,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildLoginStack(context),
                  SizedBox(height: 20.v),
                  Container(
                    height: 100.adaptSize,
                    width: 100.adaptSize,
                    padding: EdgeInsets.all(16.h),
                    decoration: AppDecoration.fillBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder50,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgUser,
                      height: 66.adaptSize,
                      width: 66.adaptSize,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(height: 19.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 35.h),
                      child: Text(
                        "Nome:",
                        style: CustomTextStyles.bodyLargeBlack900,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.h),
                    child: CustomTextFormField(
                      controller: group176Controller,
                      hintText: "Seu nome ficará aqui",
                    ),
                  ),
                  SizedBox(height: 15.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 35.h),
                      child: Text(
                        "E-mail:",
                        style: CustomTextStyles.bodyLargeBlack900,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.h),
                    child: CustomTextFormField(
                      controller: emailController,
                      hintText: "Seu email ficará aqui",
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 15.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 27.v,
                      width: 61.h,
                      margin: EdgeInsets.only(left: 35.h),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Senha:",
                              style: CustomTextStyles.bodyLargeBlack900,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Senha:",
                              style: CustomTextStyles.bodyLargeBlack900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.h),
                    child: CustomTextFormField(
                      controller: group174Controller,
                      hintText: "Sua senha ficará aqui",
                    ),
                  ),
                  SizedBox(height: 17.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 35.h),
                      child: Text(
                        "Restrição Alimentar:",
                        style: CustomTextStyles.bodyLargeBlack900,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.v),
                  _buildSearchBar(context),
                  SizedBox(height: 20.v),
                  _buildDietaryRestrictionsList(context),
                  SizedBox(height: 15.v),
                  _buildDiabetesColumn(context),
                  SizedBox(height: 36.v),
                  _buildDiabetesColumn1(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginStack(BuildContext context) {
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
  Widget _buildSearchBar(BuildContext context) {
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
  Widget _buildDietaryRestrictionsList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 15.v,
          );
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return DietaryrestrictionslistItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildDiabetesColumn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 18.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 6.v,
                    bottom: 21.v,
                  ),
                  child: Text(
                    "Diabetes",
                    style: CustomTextStyles.bodyLargeLexendBlack900_1,
                  ),
                ),
                Spacer(),
                Container(
                  height: 49.v,
                  width: 64.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.h,
                    vertical: 3.v,
                  ),
                  decoration: AppDecoration.fillBluegray30059.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder7,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgAmendoim43,
                    height: 42.v,
                    width: 37.h,
                    alignment: Alignment.center,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgBolinhaColorido,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(
                    left: 16.h,
                    top: 11.v,
                    bottom: 14.v,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.v),
          Divider(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDiabetesColumn1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 18.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 213.h,
                  margin: EdgeInsets.only(bottom: 23.v),
                  child: Text(
                    "Diabetes",
                    maxLines: null,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyLargeLexendBlack900_1.copyWith(
                      height: 2.63,
                    ),
                  ),
                ),
                Container(
                  height: 49.v,
                  width: 64.h,
                  margin: EdgeInsets.only(
                    left: 25.h,
                    top: 4.v,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.h,
                    vertical: 3.v,
                  ),
                  decoration: AppDecoration.fillBluegray30059.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder7,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgAmendoim43,
                    height: 42.v,
                    width: 37.h,
                    alignment: Alignment.center,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgBolinhaColorido,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(
                    left: 16.h,
                    top: 15.v,
                    bottom: 14.v,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.v),
          Divider(),
        ],
      ),
    );
  }
}

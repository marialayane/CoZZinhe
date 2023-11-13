import '../cadastro_screen/widgets/foodrestrictions_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luko1de_s_cozzinhe/core/app_export.dart';
import 'package:luko1de_s_cozzinhe/widgets/app_bar/appbar_subtitle.dart';
import 'package:luko1de_s_cozzinhe/widgets/app_bar/appbar_title.dart';
import 'package:luko1de_s_cozzinhe/widgets/app_bar/custom_app_bar.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_elevated_button.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_search_view.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CadastroScreen extends StatelessWidget {
  CadastroScreen({Key? key}) : super(key: key);

  TextEditingController insertNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController insertPasswordController = TextEditingController();

  TextEditingController searchController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.blueGray50,
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 35.h, vertical: 1.v),
                    child: Column(children: [
                      _buildInsertName(context),
                      SizedBox(height: 15.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("E-mail:",
                              style: CustomTextStyles.bodyLargeBlack900)),
                      SizedBox(height: 2.v),
                      _buildEmail(context),
                      SizedBox(height: 15.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                              height: 27.v,
                              width: 61.h,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Text("Senha:",
                                        style: CustomTextStyles
                                            .bodyLargeBlack900)),
                                Align(
                                    alignment: Alignment.center,
                                    child: Text("Senha:",
                                        style:
                                            CustomTextStyles.bodyLargeBlack900))
                              ]))),
                      SizedBox(height: 2.v),
                      _buildInsertPassword(context),
                      SizedBox(height: 17.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Restrição Alimentar:",
                              style: CustomTextStyles.bodyLargeBlack900)),
                      SizedBox(height: 8.v),
                      _buildSearchBar(context),
                      SizedBox(height: 20.v),
                      _buildFoodRestrictions(context)
                    ]))),
            bottomNavigationBar: _buildRegisterButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        centerTitle: true,
        title: SizedBox(
            height: 80.3.v,
            width: 360.h,
            child: Stack(alignment: Alignment.topCenter, children: [
              AppbarSubtitle(
                  text: "Nome:",
                  margin: EdgeInsets.only(top: 53.v, right: 302.h)),
              AppbarTitle(
                  text: "CoZZinhe", margin: EdgeInsets.only(bottom: 3.v))
            ])));
  }

  /// Section Widget
  Widget _buildInsertName(BuildContext context) {
    return CustomTextFormField(
        controller: insertNameController, hintText: "Insira seu nome");
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
        controller: emailController,
        hintText: "Insira seu e-mail",
        textInputType: TextInputType.emailAddress);
  }

  /// Section Widget
  Widget _buildInsertPassword(BuildContext context) {
    return CustomTextFormField(
        controller: insertPasswordController, hintText: "Insira sua senha");
  }

  /// Section Widget
  Widget _buildSearchBar(BuildContext context) {
    return Container(
        width: 360.h,
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.v),
        decoration: AppDecoration.outlineBlack9001
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: CustomSearchView(
            width: 24.adaptSize, controller: searchController));
  }

  Widget _buildFoodRestrictions(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 15.v);
        },
        itemCount: 5,
        itemBuilder: (context, index) {
          // Crie um índice baseado em 1, pois os índices geralmente começam em 0
          int itemIndex = index + 1;

          // Use o índice para obter informações sobre a restrição alimentar
          var restrictionInfo = getFoodRestrictionInfoForIndex(itemIndex);
          String imagePath = restrictionInfo[0];
          String text = restrictionInfo[1];

          return FoodrestrictionsItemWidget(
            imagePath: imagePath,
            textoPath: text,
          );
        },
      ),
    );
  }

// Função para obter o caminho da imagem e o texto com base no índice
  List<dynamic> getFoodRestrictionInfoForIndex(int index) {
    switch (index) {
      case 1:
        return [ImageConstant.imgAmedoim, "Amendoim"];
      case 2:
        return [ImageConstant.imgTrigo, "Trigo"];
      case 3:
        return [ImageConstant.imgCamarao, "Camarão"];
      case 4:
        return [ImageConstant.imgAcucar, "Açúcar"];
      case 5:
        return [ImageConstant.imgLaticinios, "Laticínios"];
      default:
        return [ImageConstant.imageNotFound, "Imagem não encontrada"];
    }
  }

  /// Section Widget
  Widget _buildRegisterButton(BuildContext context) {
    return CustomElevatedButton(
        width: 232.h,
        text: "CADASTRAR",
        margin: EdgeInsets.only(left: 99.h, right: 99.h, bottom: 57.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        onPressed: () {
          onTapRegisterButton(context);
        });
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapRegisterButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}

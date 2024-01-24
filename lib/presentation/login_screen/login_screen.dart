import 'package:flutter/material.dart';
import 'package:luko1de_s_cozzinhe/core/app_export.dart';
import 'package:luko1de_s_cozzinhe/presentation/home_page/home_page.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_elevated_button.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_outlined_button.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.blueGray50,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 33.h, vertical: 49.v),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  CustomImageView(
                      imagePath: ImageConstant.logo,
                      height: 183.adaptSize,
                      width: 183.adaptSize,
                      radius: BorderRadius.circular(91.h)),
                  SizedBox(height: 62.v),
                  _buildEmail(context),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  Widget _buildEmailField(BuildContext context) {
    return CustomTextFormField(
        controller: emailFieldController,
        borderDecoration: TextFormFieldStyleHelper.outlineBlackTL12,
        fillColor: appTheme.blueGray50.withOpacity(0.5),
        autofocus: false);
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context) {
    return CustomTextFormField(
        controller: passwordFieldController,
        textInputAction: TextInputAction.done,
        borderDecoration: TextFormFieldStyleHelper.outlineBlackTL12,
        fillColor: appTheme.blueGray50.withOpacity(0.5),
        autofocus: false);
  }

  /// Section Widget
  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
        text: "Entrar",
        margin: EdgeInsets.symmetric(horizontal: 49.h),
        buttonStyle: CustomButtonStyles.fillPrimary,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
          onTapLoginButton(context);
        },
        alignment: Alignment.center);
  }

  /// Section Widget
  Widget _buildRegisterButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "Cadastrar",
        margin: EdgeInsets.symmetric(horizontal: 49.h),
        onPressed: () {
          onTapRegisterButton(context);
        },
        alignment: Alignment.center);
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 3.v),
        decoration: AppDecoration.fillBlueGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Text("Login", style: theme.textTheme.headlineLarge)),
              SizedBox(height: 16.v),
              Text("Email", style: CustomTextStyles.bodyLargeBlack900),
              SizedBox(height: 3.v),
              _buildEmailField(context),
              SizedBox(height: 15.v),
              Text("Senha", style: CustomTextStyles.bodyLargeBlack900),
              SizedBox(height: 3.v),
              _buildPasswordField(context),
              SizedBox(height: 5.v),
              Text("Esqueci minha senha",
                  style: CustomTextStyles.bodyLargeBlack900_1
                      .copyWith(decoration: TextDecoration.underline)),
              SizedBox(height: 26.v),
              _buildLoginButton(context),
              SizedBox(height: 24.v),
              _buildRegisterButton(context),
              SizedBox(height: 27.v)
            ]));
  }

  onTapLoginButton(BuildContext context) {
    // TODO: implement Actions
  }

  /// Navigates to the cadastroScreen when the action is triggered.
  onTapRegisterButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.cadastroScreen);
  }
}

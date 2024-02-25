import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../tab_screen.dart';
import '/widgets/custom_elevated_button.dart';
import '/widgets/custom_outlined_button.dart';
import '/widgets/custom_text_form_field.dart';
import '../../models/meal.dart';

class LoginScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const LoginScreen(this.favoriteMeals, {super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

  final availableHeight = mediaQueryData.size.height -
      mediaQueryData.padding.top -
      mediaQueryData.padding.bottom;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.blueGray50,
            resizeToAvoidBottomInset: false,
            body: Container(
                height: availableHeight,
                width: double.maxFinite,
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(top: availableHeight * 0.1),
                  ),
                  SizedBox(
                    height: availableHeight * 0.3,
                    child: Image.asset(
                      'assets/images/cozzinheLogo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    height: availableHeight * 0.5,
                    child: _buildEmail(context),
                  ),
                ]))));
  }

  /// Section Widget
  Widget _buildEmailField(BuildContext context) {
    return CustomTextFormField(
      autofocus: false,
      controller: emailFieldController,
      borderDecoration: TextFormFieldStyleHelper.outlineBlackTL12,
      fillColor: appTheme.blueGray50.withOpacity(0.5),
      hintText: 'Digite seu e-mail',
      textInputType: TextInputType.emailAddress,
    );
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context) {
    return CustomTextFormField(
        autofocus: false,
        hintText: 'Digite sua senha',
        controller: passwordFieldController,
        textInputAction: TextInputAction.done,
        borderDecoration: TextFormFieldStyleHelper.outlineBlackTL12,
        fillColor: appTheme.blueGray50.withOpacity(0.5));
  }

  /// Section Widget
  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
        text: "Entrar",
        margin: EdgeInsets.symmetric(horizontal: 49.h),
        buttonStyle: CustomButtonStyles.fillPrimary,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TabsScreen(widget.favoriteMeals)));
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
        width: double.maxFinite,
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

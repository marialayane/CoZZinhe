import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '/widgets/app_bar/appbar_title.dart';
import '/widgets/app_bar/custom_app_bar.dart';
import '/widgets/custom_elevated_button.dart';
import '/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CadastroScreen extends StatelessWidget {
  CadastroScreen({Key? key}) : super(key: key);

  TextEditingController insertNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController insertPasswordController = TextEditingController();

  TextEditingController searchController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    height: availableHeight * 1,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 25.h),
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Nome:",
                                      style:
                                          CustomTextStyles.bodyLargeBlack900)),
                              _buildInsertName(context),
                            ],
                          ),
                          SizedBox(height: 20.v),
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("E-mail:",
                                      style:
                                          CustomTextStyles.bodyLargeBlack900)),
                              _buildEmail(context),
                            ],
                          ),
                          SizedBox(height: 20.v),
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Senha: ",
                                      style:
                                          CustomTextStyles.bodyLargeBlack900)),
                              _buildInsertPassword(context),
                            ],
                          ),
                          SizedBox(height: 25.v),
                          _buildRegisterButton(context)
                        ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        centerTitle: true,
        title: SizedBox(
            height: 80.3.v,
            width: 360.h,
            child: Stack(alignment: Alignment.topCenter, children: [
              AppbarTitle(
                  text: "CoZZinhe", margin: EdgeInsets.only(bottom: 3.v))
            ])));
  }

  /// Section Widget
  Widget _buildInsertName(BuildContext context) {
    return CustomTextFormField(
        autofocus: false,
        controller: insertNameController,
        hintText: "Insira seu nome");
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
        autofocus: false,
        controller: emailController,
        hintText: "Insira seu e-mail",
        textInputType: TextInputType.emailAddress);
  }

  /// Section Widget
  Widget _buildInsertPassword(BuildContext context) {
    return CustomTextFormField(
        autofocus: false,
        controller: insertPasswordController,
        hintText: "Insira sua senha");
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
    print(
        "${emailController.text}, ${insertNameController.text}, ${insertPasswordController.text}");
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}

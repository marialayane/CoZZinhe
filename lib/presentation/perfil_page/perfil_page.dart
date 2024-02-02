import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class PerfilPage extends StatelessWidget {
  PerfilPage({Key? key})
      : super(
          key: key,
        );

  TextEditingController group176Controller = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController group174Controller = TextEditingController();

  TextEditingController contactController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final availableHeight = mediaQueryData.size.height -
      mediaQueryData.padding.top -
      mediaQueryData.padding.bottom;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    print('mageConstant.imgUser');
    print(ImageConstant.imgUser);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildLoginStack(context, availableHeight),
                  SizedBox(height: 20.v),
                  Container(
                    height: availableHeight * 0.3.adaptSize,
                    width: availableHeight * 0.3.adaptSize,
                    padding: EdgeInsets.all(0.2),
                    child: CustomImageView(
                      imagePath: ('assets/images/img_user.png'),
                      height: availableHeight * 0.3.adaptSize,
                      width: availableHeight * 0.3.adaptSize,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(height: 19.v),
                  _buildForm(context, group176Controller, 'Nome:',
                      'Seu nome ficará aqui'),
                  SizedBox(height: 20.v),
                  _buildForm(context, emailController, 'Email:',
                      'Seu email ficará aqui'),
                  SizedBox(height: 20.v),
                  _buildForm(context, group174Controller, 'Senha:',
                      'Sua senha ficará aqui'),
                  SizedBox(height: 20.v),
                  _buildForm(context, contactController, 'Contato:',
                      'Seu contato ficará aqui'),
                  SizedBox(height: 29.v),
                  _buildSaveButton(context, availableHeight),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginStack(BuildContext context, availableHeight) {
    return SizedBox(
      height: availableHeight * 0.14.adaptSize,
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
                color: Color(0XFFE62F31),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: AppDecoration.outlineBlack900,
              child: Text(
                "CoZZinhe",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: availableHeight * 0.05.adaptSize,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context, nameController, text, hintText) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.h),
          child: CustomTextFormField(
            controller: nameController,
            hintText: hintText,
          ),
        )
      ],
    );
  }
}

Widget _buildSaveButton(BuildContext context, availableHeight) {
  return SizedBox(
    height: availableHeight * 0.08.adaptSize,
    child: ElevatedButton(
        child: Text(
          "Salvar",
          style: TextStyle(
              color: Colors.white, fontSize: availableHeight * 0.04.adaptSize),
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFFE62F31),
          padding: EdgeInsets.symmetric(horizontal: 100.h, vertical: 15.v),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        )),
  );
}

onTapSaveButton(BuildContext context) {
  // TODO: implement Actions
}

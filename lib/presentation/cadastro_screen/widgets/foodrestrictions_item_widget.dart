import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '/widgets/custom_radio_button.dart';

// ignore: must_be_immutable
class FoodrestrictionsItemWidget extends StatelessWidget {
  final String imagePath;
  final String textoPath; // Adiciona o parâmetro textoPath

  FoodrestrictionsItemWidget(
      {Key? key, required this.imagePath, required this.textoPath})
      : super(key: key);

  String radioGroup = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 49.v,
          width: 342.h,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 6.v),
                  child: CustomRadioButton(
                    width: 342.h,
                    text: textoPath,
                    value: textoPath,
                    groupValue: radioGroup,
                    isRightCheck: true,
                    onChange: (value) {
                      radioGroup = value;
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 49.v,
                  width: 64.h,
                  margin: EdgeInsets.only(right: 40.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.h,
                    vertical: 3.v,
                  ),
                  decoration: AppDecoration.fillBluegray30059.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder7,
                  ),
                  child: CustomImageView(
                    imagePath: imagePath,
                    height: 42.v,
                    width: 37.h,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.v),
        const Divider(),
      ],
    );
  }
}

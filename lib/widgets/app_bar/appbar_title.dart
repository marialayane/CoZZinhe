import 'package:flutter/material.dart';
import 'package:luko1de_s_cozzinhe/core/app_export.dart';

// ignore: must_be_immutable
class AppbarTitle extends StatelessWidget {
  AppbarTitle({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Container(
          width: 58.h,
          decoration: AppDecoration.outlineBlack900,
          child: Text(
            text,
            maxLines: null,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.displayMediumPoppinsSecondaryContainer
                .copyWith(
              color: theme.colorScheme.secondaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}

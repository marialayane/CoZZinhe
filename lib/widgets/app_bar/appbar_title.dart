import 'package:flutter/material.dart';
import '../../core/app_export.dart';

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
      child: SizedBox(
        width: double.maxFinite,
        child: Text(
          text,
          maxLines: null,
          overflow: TextOverflow.ellipsis,
          style:
              CustomTextStyles.displayMediumPoppinsSecondaryContainer.copyWith(
            color: theme.colorScheme.secondaryContainer,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

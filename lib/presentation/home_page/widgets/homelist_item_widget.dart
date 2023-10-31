import 'package:flutter/material.dart';
import 'package:luko1de_s_cozzinhe/core/app_export.dart';

// ignore: must_be_immutable
class HomelistItemWidget extends StatelessWidget {
  const HomelistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage1,
            height: 92.adaptSize,
            width: 92.adaptSize,
            radius: BorderRadius.circular(
              2.h,
            ),
            margin: EdgeInsets.only(bottom: 25.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 9.h,
              top: 3.v,
              bottom: 25.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 147.h,
                  child: Text(
                    "Bolo de cenoura simples \ne fácil",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                SizedBox(height: 21.v),
                SizedBox(
                  width: 221.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 33.h,
                        margin: EdgeInsets.only(bottom: 4.v),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgStar15,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              margin: EdgeInsets.only(bottom: 4.v),
                            ),
                            Text(
                              "5",
                              style: theme.textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 22.v,
                        width: 61.h,
                        margin: EdgeInsets.only(top: 6.v),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgPhClockThin,
                              height: 22.adaptSize,
                              width: 22.adaptSize,
                              alignment: Alignment.centerLeft,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "40 min",
                                style: CustomTextStyles.bodySmallLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

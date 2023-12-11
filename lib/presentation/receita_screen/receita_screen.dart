import 'package:flutter/material.dart';
import 'package:luko1de_s_cozzinhe/core/app_export.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_bottom_bar.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_outlined_button.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_rating_bar.dart';

class ReceitaScreen extends StatelessWidget {
  ReceitaScreen({Key? key})
      : super(
          key: key,
        );

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildRecipeView(context),
                SizedBox(height: 5.v),
                _buildRecipeRet(context),
                SizedBox(height: 21.v),
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle4226242x360,
                  height: 242.v,
                  width: 360.h,
                  radius: BorderRadius.circular(
                    2.h,
                  ),
                ),
                SizedBox(height: 12.v),
                _buildRecipeInfo(context),
                SizedBox(height: 36.v),
                Container(
                  width: 360.h,
                  margin: EdgeInsets.symmetric(horizontal: 35.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 39.h,
                    vertical: 13.v,
                  ),
                  decoration: AppDecoration.fillSecondaryContainer.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 92.v),
                      Container(
                        width: 251.h,
                        margin: EdgeInsets.only(right: 30.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Ingredientes:\n",
                                style: CustomTextStyles.titleLargeOnPrimaryBold,
                              ),
                              TextSpan(
                                text:
                                    "\r\n1 ½\r xícaras de bananas amassadas, maduras\r\n2\r colheres de chá de suco de limão\r\n3\r xícaras de farinha\r\n1 ",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  height: 1.92,
                                ),
                              ),
                              TextSpan(
                                text: "½",
                                style: CustomTextStyles.bodyMedium15,
                              ),
                              TextSpan(
                                text:
                                    "\rcolheres de chá de bicarbonato de sódio\r\n",
                                style: theme.textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: "¼",
                                style: CustomTextStyles.bodyMedium15,
                              ),
                              TextSpan(
                                text: "\r colher de chá de sal\r\n",
                                style: theme.textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: "¾",
                                style: CustomTextStyles.bodyMedium15,
                              ),
                              TextSpan(
                                text: "\r xícara de manteiga amolecida\r\n2 ",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  height: 1.92,
                                ),
                              ),
                              TextSpan(
                                text: "⅛",
                                style: CustomTextStyles.bodyMedium15,
                              ),
                              TextSpan(
                                text:
                                    "\r xicaras de açúcar\r\n3 ovos grandes\r\n2\rcolheres de chá de baunilha\r\n1  ",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  height: 1.92,
                                ),
                              ),
                              TextSpan(
                                text: "½",
                                style: CustomTextStyles.bodyMedium15,
                              ),
                              TextSpan(
                                text: "\rxícaras de leitelho\r\n\n",
                                style: theme.textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: "Congelados",
                                style: theme.textTheme.labelLarge,
                              ),
                              TextSpan(
                                text: "",
                                style: theme.textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: "½",
                                style: CustomTextStyles.bodyMedium15,
                              ),
                              TextSpan(
                                text:
                                    "\rxícara de manteiga amolecida\r\n1 pacote de cream cheese, amolecido\r\n1\rcolher de chá de baunilha\r\n3 ",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  height: 1.92,
                                ),
                              ),
                              TextSpan(
                                text: "½",
                                style: CustomTextStyles.bodyMedium15,
                              ),
                              TextSpan(
                                text:
                                    "\rxícaras de açúcar de confeiteiro\r\n\n",
                                style: theme.textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: "Guarnição\n",
                                style: theme.textTheme.labelLarge,
                              ),
                              TextSpan(
                                text: "Nozes picadas",
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 17.v),
                Container(
                  width: 360.h,
                  margin: EdgeInsets.symmetric(horizontal: 35.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 42.h,
                    vertical: 31.v,
                  ),
                  decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 29.v),
                      Container(
                        width: 255.h,
                        margin: EdgeInsets.only(right: 21.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Modo de preparo:\n",
                                style: CustomTextStyles.titleLargeOnPrimaryBold,
                              ),
                              TextSpan(
                                text: "",
                                style: theme.textTheme.labelLarge!.copyWith(
                                  height: 1.54,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "1. Pré-aqueça o forno a 135°C.\n 2. Unte e enfarinhe uma forma 9 x 13.\n 3. Em uma tigela pequena, misture o purê de banana com o suco de limão; reserve.\n 4. Em uma tigela média, misture a farinha, o bicarbonato e o sal; reserve.\n 5. Em uma tigela grande, bata ",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  height: 1.54,
                                ),
                              ),
                              TextSpan(
                                text: "¾",
                                style: CustomTextStyles.titleLargeOnPrimary,
                              ),
                              TextSpan(
                                text: " xícara de manteiga e 2 ",
                                style: theme.textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: "⅛",
                                style: CustomTextStyles.titleLargeOnPrimary,
                              ),
                              TextSpan(
                                text:
                                    " xícara de açúcar até obter um creme claro e fofo.\n 6. Junte os ovos, um de cada vez, e junte 2 colheres de chá de baunilha.\n 7. Junte a mistura de farinha alternadamente com o leitelho.\n 8. Junte a mistura de banana.\n 9. Despeje a massa na forma preparada e leve ao forno pré-aquecido por uma hora.\n 10. Retire do forno e coloque diretamente no freezer por 45 minutos. \n 11. Para a cobertura, bata a manteiga e o cream cheese até ficar homogêneo.\n 12. Junte 1 colher de chá de baunilha.\n 13. Adicione o açúcar de confeiteiro e bata em velocidade baixa até incorporar, depois em velocidade alta até a cobertura ficar homogênea.\n 14. Espalhe sobre o bolo resfriado.\n 15. Polvilhe nozes picadas por cima da cobertura, se desejar.",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  height: 1.54,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildRecipeView(BuildContext context) {
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
  Widget _buildRecipeRet(BuildContext context) {
    return SizedBox(
      height: 36.v,
      width: 361.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 33.v,
              width: 361.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(
                  2.h,
                ),
                boxShadow: [
                  BoxShadow(
                    color: appTheme.black900.withOpacity(0.25),
                    spreadRadius: 2.h,
                    blurRadius: 2.h,
                    offset: Offset(
                      0,
                      4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Bolo de Banana",
              style: CustomTextStyles.headlineSmallPoppins,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRecipeInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: CustomRatingBar(
              initialRating: 5,
            ),
          ),
          CustomOutlinedButton(
            height: 27.v,
            width: 181.h,
            text: "Informações nutricionais",
            margin: EdgeInsets.only(left: 28.h),
            buttonStyle: CustomButtonStyles.outlineGray,
            buttonTextStyle: theme.textTheme.bodySmall!,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
    );
  }
}

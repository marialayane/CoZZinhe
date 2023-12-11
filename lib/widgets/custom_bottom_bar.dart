import 'package:flutter/material.dart';
import 'package:luko1de_s_cozzinhe/core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  final Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      activeIcon: ImageConstant.imgHome,
      title: "Início",
      type: BottomBarEnum.Incio,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCarbonFavorite,
      activeIcon: ImageConstant.imgCarbonFavorite,
      title: "Favoritos",
      type: BottomBarEnum.Favoritos,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavItens,
      activeIcon: ImageConstant.imgNavItens,
      title: "Itens",
      type: BottomBarEnum.Itens,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUserBlueGray10001,
      activeIcon: ImageConstant.imgUserBlueGray10001,
      title: "Perfil",
      type: BottomBarEnum.Perfil,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  color: appTheme.blueGray10001,
                ),
                Text(
                  bottomMenuList[index].title ?? "",
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: appTheme.blueGray10001,
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 30.v,
                  width: 24.h,
                  color: appTheme.blueGray10001,
                ),
                Text(
                  bottomMenuList[index].title ?? "",
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: appTheme.blueGray10001,
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Incio,
  Favoritos,
  Itens,
  Perfil,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

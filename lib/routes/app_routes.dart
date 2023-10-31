import 'package:flutter/material.dart';
import 'package:luko1de_s_cozzinhe/presentation/login_screen/login_screen.dart';
import 'package:luko1de_s_cozzinhe/presentation/cadastro_screen/cadastro_screen.dart';
import 'package:luko1de_s_cozzinhe/presentation/receita_screen/receita_screen.dart';
import 'package:luko1de_s_cozzinhe/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';

  static const String cadastroScreen = '/cadastro_screen';

  static const String perfilPage = '/perfil_page';

  static const String homePage = '/home_page';

  static const String receitaScreen = '/receita_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    cadastroScreen: (context) => CadastroScreen(),
    receitaScreen: (context) => ReceitaScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}

// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'theme/theme_helper.dart';
import 'routes/app_routes.dart';
import 'presentation/login_screen/login_screen.dart';
import 'presentation/cadastro_screen/cadastro_screen.dart';
import 'presentation/perfil_page/perfil_page.dart';
import 'presentation/tab_screen.dart';
import 'presentation/meal_detail/meal_detail_sreen.dart';
import 'models/meal.dart';
import 'presentation/item_screen/item_screen.dart';
import 'presentation/home_page/filter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Meal> _favoriteMeals = [];

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        title: 'Cozzinhe',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.loginScreen,
        routes: {
          AppRoutes.loginScreen: (ctx) => LoginScreen(_favoriteMeals),
          AppRoutes.cadastroScreen: (ctx) => CadastroScreen(),
          AppRoutes.perfilPage: (ctx) => PerfilPage(),
          AppRoutes.homePage: (ctx) => TabsScreen(_favoriteMeals),
          AppRoutes.mealDetail: (ctx) =>
              MealDetailScreen(_toggleFavorite, _isFavorite),
          AppRoutes.itemScreen: (ctx) => ItemScreen(),
          // AppRoutes.filterScreen: (ctx) => FilterScreen(),
        });
  }
}

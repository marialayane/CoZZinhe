import 'package:flutter/material.dart';
import 'home_page/home_page.dart';
import 'perfil_page/perfil_page.dart';
import 'favorite/favorite_screen.dart';
import '../models/meal.dart';
import 'item_screen/item_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  List<Map<String, Object>>? _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'CoZZinhe',
        'screen': HomePage(),
      },
      {
        'title': 'Receitas',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
      {
        'title': 'Receitas',
        'screen': ItemScreen(),
      },
      {
        'title': 'Meu Perfil',
        'screen': PerfilPage(),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens![_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: const Color(0XFFE62F31),
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage_rounded),
            label: 'Itens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:luko1de_s_cozzinhe/presentation/home_page/home_page.dart';
import 'package:luko1de_s_cozzinhe/presentation/perfil_page/perfil_page.dart';
import 'package:luko1de_s_cozzinhe/presentation/login_screen/login_screen.dart';

class CustomNavBar extends StatefulWidget {
  final int selectedIndex;

  CustomNavBar({required this.selectedIndex});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE62F31),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavBarItem(Icons.home, 'Home', 0),
          buildNavBarItem(Icons.favorite, 'Favoritos', 1),
          buildNavBarItem(Icons.shopping_cart, 'Itens', 2),
          buildNavBarItem(Icons.person, 'Perfil', 3),
        ],
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    bool isSelected = index == widget.selectedIndex;

    return GestureDetector(
      onTap: () {
        handleItemSelected(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.white54,
            size: isSelected ? 28.0 : 24.0,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white54,
              fontSize: isSelected ? 12.0 : 10.0,
            ),
          ),
        ],
      ),
    );
  }

  void handleItemSelected(int index) {
    // Implemente a navegação com base no índice selecionado
    if (index == 0) {
      // Navegação para a página inicial ("Home")
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      // Navegação para a página de favoritos
    } else if (index == 2) {
      // Navegação para a página de itens
    } else if (index == 3) {
      // Navegação para a página de perfil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PerfilPage()),
      );
    }
  }
}

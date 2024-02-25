/*import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../models/meal.dart';
import '../../routes/app_routes.dart';

class FilterScreen extends StatelessWidget {
  final availableWidth = mediaQueryData.size.width -
      mediaQueryData.padding.left -
      mediaQueryData.padding.right;

  FilterScreen({Key? key}) : super(key: key);

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtros'),
      ),
      body: Column(
        children: [
          _buildSwitchListTile(
            'Sem Glúten',
            'Só incluir refeições sem glúten',
            (newValue) {
              setState(() {
                _isGlutenFree = newValue;
              });
            },
            _isGlutenFree,
          ),
          _buildSwitchListTile(
            'Lactose',
            'Só incluir refeições sem lactose',
            (newValue) {
              setState(() {
                _isLactoseFree = newValue;
              });
            },
            _isLactoseFree,
          ),
          _buildSwitchListTile(
            'Vegetariana',
            'Só incluir refeições vegetarianas',
            (newValue) {
              setState(() {
                _isVegetarian = newValue;
              });
            },
            _isVegetarian,
          ),
          _buildSwitchListTile(
            'Vegana',
            'Só incluir refeições veganas',
            (newValue) {
              setState(() {
                _isVegan = newValue;
              });
            },
            _isVegan,
          ),
        ],
      ),
    );
  }
}
*/

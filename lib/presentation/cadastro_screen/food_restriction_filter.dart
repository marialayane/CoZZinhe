import 'package:flutter/material.dart';
import 'settings_food_restriction.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged, {Key? key})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

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
    return Expanded(
      child: ListView(
        children: [
          _createSwitch(
            'Sem Glutén',
            'Só exibe refeições sem glúten!',
            settings!.isGlutenFree,
            (value) => setState(() => settings!.isGlutenFree = value),
          ),
          _createSwitch(
            'Sem Lactose',
            'Só exibe refeições sem lactose!',
            settings!.isLactoseFree,
            (value) => setState(() => settings!.isLactoseFree = value),
          ),
        ],
      ),
    );
  }
}

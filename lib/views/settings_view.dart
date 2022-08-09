import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsView extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;

  const SettingsView(
      {Key? key, required this.onSettingsChanged, required this.settings})
      : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  Settings settings = Settings();

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
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: const Text(
        'Configurações',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );

    return Scaffold(
      appBar: appBar,
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch('Sem Glútem', 'Só exibe refeições sem glútem',
                  settings.isGlutenFree, (value) {
                setState(() {
                  settings.isGlutenFree = value;
                });
              }),
              _createSwitch('Sem Lactose', 'Só exibe refeições sem Lactose',
                  settings.isLactoseFree, (value) {
                setState(() {
                  settings.isLactoseFree = value;
                });
              }),
              _createSwitch('Vegetariano', 'Só exibe refeições vegetarianas',
                  settings.isVegetarian, (value) {
                setState(() {
                  settings.isVegetarian = value;
                });
              }),
              _createSwitch(
                  'Vegano', 'Só exibe refeições veganas', settings.isVegan,
                  (value) {
                setState(() {
                  settings.isVegan = value;
                });
              }),
            ],
          )),
        ],
      ),
    );
  }
}

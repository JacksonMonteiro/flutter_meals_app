import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

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
      body: const Center(
        child: Text('Configurações'),
      ),
    );
  }
}

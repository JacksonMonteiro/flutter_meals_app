import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _createItem(
      {required IconData icon,
      required String label,
      required Function onTap}) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        label,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: onTap as void Function(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          color: Theme.of(context).colorScheme.secondary,
          alignment: Alignment.bottomCenter,
          child: const Text(
            'Vamos Cozinhar!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        _createItem(
          icon: Icons.restaurant,
          label: 'Refeições',
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(AppRoutes.home),
        ),
        _createItem(
          icon: Icons.settings,
          label: 'Configurações',
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(AppRoutes.settings),
        ),
      ]),
    );
  }
}
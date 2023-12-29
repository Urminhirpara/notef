import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/components/drawer_tile.dart';
import 'package:note/pages/settings_page.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(children: [
        DrawerHeader(
          child: Icon(Icons.ac_unit_sharp, size: 100.0,),
        ),
        DrawerTile(
            title: "Notes",
            leading: const Icon(Icons.home),
            onTap: () => Navigator.pop(context)),
        DrawerTile(
            title: "Settings ",
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            }),
      ]),
    );
  }
}

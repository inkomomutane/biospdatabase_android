import 'package:biospdatabase/View/About/About.dart';
import 'package:biospdatabase/View/Relatorio/RelatorioDiario.dart';
import 'package:biospdatabase/View/SyncData/SyncData.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key, required this.biospName}) : super(key: key);
  final String biospName;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Biosp Database"),
              accountEmail: Text(biospName),
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/drawer.jpg'),
              )),
              currentAccountPicture: Padding(
                padding: EdgeInsets.all(4),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/logo.png'),
                ),
              )),
          ListTile(
              leading: Icon(
                Icons.add_chart,
                color: Colors.grey.shade600,
              ),
              title: const Text(
                'Relatórios',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w800),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => RelatorioDiario(),
                    fullscreenDialog: true,
                  ),
                );
              }),
          ListTile(
            leading: Icon(
              Icons.sync_problem_rounded,
              color: Colors.red.shade400,
            ),
            title: const Text(
              'Dados não sincronizados',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w800),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => SyncData(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          ListTile(
              leading: Icon(
                Icons.perm_device_info_outlined,
                color: Colors.grey.shade600,
              ),
              title: const Text(
                'Sobre o aplicativo',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w800),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => About(),
                      fullscreenDialog: true,
                    ));
              }),
        ],
      ),
    );
  }
}

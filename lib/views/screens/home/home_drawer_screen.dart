import 'package:flutter/material.dart';

class HomeDrawerScreen extends StatelessWidget {
  const HomeDrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: const [
          UserAccountsDrawerHeader(
              accountName: Text("Biosp Database"),
              accountEmail: Text("Biosp Test"),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/drawer.jpg'),
                  )),
              currentAccountPicture: Padding(
                padding: EdgeInsets.all(4),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/icon/icon.png'),
                ),
              )),
          AboutListTile(
            icon: Icon(
              Icons.info_outline_rounded,
            ),
            applicationVersion: "v2.0.1",
            aboutBoxChildren: [

            ],
          ),

        ],
      ),
    );
  }
}
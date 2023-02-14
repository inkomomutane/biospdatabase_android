import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../translations/locale_keys.g.dart';
import '../crud/create_screen.dart';
import 'home_drawer_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const HomeDrawerScreen(),
      body: ListView(
        children: [
          ListTile(
            tileColor: Theme.of(context).canvasColor,
            shape: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5.0), //or 15.0
              child: Container(
                height: 40.0,
                width: 40.0,
                color: Theme.of(context).hoverColor,
                child: const Icon(Icons.volume_up),
              ),
            ),
            onTap: () {},
            title: const Text("Nelson Alexandre Mutane",
                style: TextStyle(fontWeight: FontWeight.w800)),
            subtitle: Row(
              children: const [
                Icon(
                  Icons.phone_android_rounded,
                  size: 14,
                ),
                SizedBox(
                  width: 4,
                ),
                Text("+258 847607095",
                    style: TextStyle(fontWeight: FontWeight.normal))
              ],
            ),
          ),
          ListTile(
            tileColor: Theme.of(context).canvasColor,
            shape: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5.0), //or 15.0
              child: Container(
                height: 40.0,
                width: 40.0,
                color: Theme.of(context).hoverColor,
                child: const Icon(Icons.volume_up),
              ),
            ),
            onTap: () {},
            title: const Text("Nelson Alexandre Mutane",
                style: TextStyle(fontWeight: FontWeight.w800)),
            subtitle: Row(
              children: const [
                Icon(
                  Icons.phone_android_rounded,
                  size: 14,
                ),
                SizedBox(
                  width: 4,
                ),
                Text("+258 847607095",
                    style: TextStyle(fontWeight: FontWeight.normal))
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: 0,
        showElevation: true,
        itemCornerRadius: 10,
        curve: Curves.easeIn,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.people),
            title: Text(LocaleKeys.beneficiaries.tr().capitalize),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Badge(
              backgroundColor: Colors.deepOrange,
              label: null,
              child: Icon(Icons.sync),
            ),
            title: const Text('Beneficiaries'),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          )
        ],
        onItemSelected: (int value) {},
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const CreateScreen(),
            fullscreenDialog: true,
          ),
        ),
      ),
    );
  }
}

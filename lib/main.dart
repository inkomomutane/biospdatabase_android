import 'package:biospdatabase/Controller/BenificiaryController.dart';
import 'package:biospdatabase/View/Home/Home.dart';
import 'package:biospdatabase/View/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Syncronization.boot();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    
    home: Hive.box('token').get("token") != null ? Home() : LoginPage(),
  ));
}

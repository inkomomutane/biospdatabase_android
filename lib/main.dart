import 'package:biospdatabase/Model/Auth/Auth.dart';
import 'package:biospdatabase/Syncronization/ServerSync.dart';
import 'package:biospdatabase/Syncronization/Syncronization.dart';
import 'package:biospdatabase/View/Home.dart';
import 'package:biospdatabase/View/login/login_page.dart';
import 'package:flutter/cupertino.dart';
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

import 'package:biospdatabase/Syncronization/ServerSync.dart';
import 'package:biospdatabase/Syncronization/Syncronization.dart';
import 'package:biospdatabase/View/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Syncronization.boot();
  Hive.box('token').put('token', '8v2ZFYAJkcOQqfa88YwcIaSaSYKIrcpd14xoTE8x');
  ServerSync data = ServerSync();
  data.syncSettings();
  runApp(Home());
}

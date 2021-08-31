import 'package:biospdatabase/Syncronization/Syncronization.dart';
import 'package:biospdatabase/View/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Syncronization.boot();
  runApp(Home());
}

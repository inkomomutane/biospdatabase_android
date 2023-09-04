
import 'package:flutter/material.dart';
import 'HomeScaffold.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.index = 0}) : super(key: key);
  final int index;

  @override
  _HomeState createState() => _HomeState(index);
}

class _HomeState extends State<Home> {
  _HomeState(this.index);
  final int index;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurple,
        ),
        focusColor: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      title: "Biosp Database",
      home: HomeScaffold(index),
    );
  }
}

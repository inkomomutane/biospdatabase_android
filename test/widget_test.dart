// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:biospdatabase/Model/Genre/Genre.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(GenreAdapter());
  await Hive.initFlutter();
  var created = await Hive.openBox<Genre>('created');
  final Genre genre = Genre(
      uuid: Uuid().v4(),
      name: "Music",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

  // ignore: unrelated_type_equality_checks

  // var updated = await Hive.openBox<Genre>('updated');
//  created.deleteAll(keys)();
  created.put(Uuid().v4(), genre);

  created.keys.forEach((element) {
    print(element);
  });
  // created.containsKey('key');
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LabelComponent extends StatelessWidget {
  const LabelComponent({Key? key, required this.labelText}) : super(key: key);
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Text(
        labelText,
        style: TextStyle(fontSize: 20, color: Colors.black54),
      ),
      padding: EdgeInsets.only(top: 25, bottom: 0, left: 35, right: 35),
    );
  }
}

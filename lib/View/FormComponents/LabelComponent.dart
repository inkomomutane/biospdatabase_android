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
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
        textAlign: TextAlign.start,
      ),
      padding: EdgeInsets.only(top: 15, bottom: 0, left: 35, right: 35),
    );
  }
}

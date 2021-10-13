
import 'package:flutter/material.dart';

class CardRelatorioUI extends StatelessWidget {
  const CardRelatorioUI(
      {Key? key, required this.letter, this.onTap, this.subtitle, this.title})
      : super(key: key);

  final Widget? subtitle;
  final String letter;
  final Widget? title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amberAccent,
                child: Text(
                  letter,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
              title: title,
              subtitle: subtitle,
            ),
          )),
      onTap: onTap,
    );
  }
}

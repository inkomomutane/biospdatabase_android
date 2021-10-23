import 'package:flutter/material.dart';

class CardRelatorioUI extends StatelessWidget {
  const CardRelatorioUI(
      {Key? key,required this.color ,required this.letter, this.onTap, this.subtitle, this.title})
      : super(key: key);

  final Widget? subtitle;
  final Widget letter;
  final Widget? title;
  final Color color;
  
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
                backgroundColor: color,
                child: letter
              ),
              title: title,
              subtitle: subtitle,
            ),
          )),
      onTap: onTap,
    );
  }
}

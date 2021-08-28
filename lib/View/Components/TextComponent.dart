import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  const TextComponent(
      {Key? key,
      required this.hintText,
      this.onChanged,
      this.onSaved,
      this.onSubmited})
      : super(key: key);
  final String hintText;
  final void Function(String string)? onChanged;
  final void Function(String? string)? onSaved;
  final void Function(String)? onSubmited;

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hintText,
            focusColor: Colors.black,
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black45, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1.3),
            )),
        onChanged: onChanged,
        onSaved: onSaved,
        onFieldSubmitted: onSubmited,
      ),
      padding: EdgeInsets.only(left: 35, right: 35, top: 10),
    );
  }
}

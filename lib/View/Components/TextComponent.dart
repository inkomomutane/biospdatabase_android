import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextComponent extends StatelessWidget {
  TextComponent(
      {Key? key,
      required this.hintText,
      this.onChanged,
      this.onSaved,
      this.controller,
      this.onSubmited,
      this.initialValue,
      this.validator})
      : super(key: key);
  final String hintText;
  void Function(String string)? onChanged;
  void Function(String? string)? onSaved;
  void Function(String)? onSubmited;
  TextEditingController? controller;
  String? initialValue;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.black54,
          ),
          focusColor: Colors.black,
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black45, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF311b92), width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
          ),
        ),
        initialValue: initialValue != null ? initialValue : "",
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        onFieldSubmitted: onSubmited,
        validator: validator,
      ),
      padding: EdgeInsets.only(left: 35, right: 35, top: 10),
    );
  }
}

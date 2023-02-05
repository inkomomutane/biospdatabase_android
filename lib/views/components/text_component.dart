import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  TextComponent(
      {Key? key,
        required this.hintText,
        this.onChanged,
        this.onSaved,
        this.controller,
        this.onSubmitted,
        this.initialValue,
        this.validator})
      : super(key: key);
  final String hintText;
 late void Function(String string)? onChanged;
  late void Function(String? string)? onSaved;
  late void Function(String)? onSubmitted;
  late TextEditingController? controller;
  late String? initialValue;
  late String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
      child: TextFormField(
        decoration:  InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
          ),
          filled: true,
          focusColor: Theme.of(context).hintColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
          ),
          focusedBorder:   OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
        ),
        initialValue: initialValue ?? "",
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        onFieldSubmitted: onSubmitted,
        validator: validator,
      ),
    );
  }
}
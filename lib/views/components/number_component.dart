import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NumberComponent extends StatelessWidget {
  NumberComponent(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.onSaved,
      this.initialValue,
      this.onSubmited,
      this.controller})
      : super(key: key);
  final String? hintText;
  void Function(String string)? onChanged;
  void Function(String? string)? onSaved;
  void Function(String)? onSubmited;
  String? initialValue;

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 35, right: 35, top: 10),
        child: TextFormField(
          keyboardType: TextInputType.number,
          initialValue: initialValue != null ? initialValue : "",
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hintText,
              // focusColor: Colors.black,
              // fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide:  BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                     BorderSide(color: Theme.of(context).primaryColor, width: 2),
              )),
          onChanged: onChanged,
          onSaved: onSaved,
          controller: controller,
          onFieldSubmitted: onSubmited,


        ));
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PhoneNumberComponent extends StatelessWidget {
  PhoneNumberComponent(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.onSaved,
      this.onSubmited,
      this.controller})
      : super(key: key);
  final String? hintText;
  void Function(String string)? onChanged;
  Function(String? string)? onSaved;
  final void Function(String)? onSubmited;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 35, right: 35, top: 10),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          initialValue: "",
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hintText,
              focusColor: Colors.black,
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black45, width: 1.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFF311b92), width: 2.0),
              )),
          onChanged: onChanged,
          controller: controller,
          onSaved: onSaved,
          onFieldSubmitted: onSubmited,
        ));
  }
}

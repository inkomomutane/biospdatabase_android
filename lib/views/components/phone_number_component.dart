import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PhoneNumberComponent extends StatelessWidget {
  PhoneNumberComponent(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.onSaved,
      this.initialValue,
      this.onSubmited,
      this.validator,
      this.controller})
      : super(key: key);
  final String? hintText;
  void Function(String string)? onChanged;
  Function(String? string)? onSaved;
  final void Function(String)? onSubmited;
  TextEditingController? controller;
  String? initialValue;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          initialValue: initialValue ?? "",
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hintText,
              focusColor: Colors.black,
              fillColor: Colors.white,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45, width: 1.0),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color(0xFF311b92), width: 2.0),
              )),
          onChanged: onChanged,
          controller: controller,
          onSaved: onSaved,
          validator: validator,
          onFieldSubmitted: onSubmited,
        ));
  }
}

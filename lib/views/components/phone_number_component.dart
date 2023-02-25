import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PhoneNumberComponent extends StatelessWidget {
  PhoneNumberComponent(
      {Key? key,
      this.hintText,
      this.labelText,
      this.onChanged,
      this.onSaved,
      this.initialValue,
      this.onSubmited,
      this.validator,
      this.controller})
      : super(key: key);
  final String? hintText;
  final String? labelText;
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
            labelText: labelText,
            contentPadding: const EdgeInsets.all(12),
            filled: true,
            hintStyle: const TextStyle(
              fontSize: 15,
            ),
            focusColor: Theme.of(context).hintColor,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 2, color: Theme.of(context).primaryColor),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
          onChanged: onChanged,
          controller: controller,
          onSaved: onSaved,
          validator: validator,
          onFieldSubmitted: onSubmited,
        ));
  }
}

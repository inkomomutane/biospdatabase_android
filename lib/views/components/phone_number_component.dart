import 'package:flutter/material.dart';

class PhoneNumberComponent extends StatelessWidget {
  const PhoneNumberComponent(
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
  final void Function(String string)? onChanged;
  final Function(String? string)? onSaved;
  final void Function(String)? onSubmited;
  final TextEditingController? controller;
  final String? initialValue;
  final String? Function(String?)? validator;

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
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NumberComponent extends StatelessWidget {
  const NumberComponent({
    Key? key,
    this.hintText,
    this.onChanged,
    this.onSaved,
    this.initialValue,
    this.onSubmited,
    this.validator,
    this.controller,
  }) : super(key: key);
  final String? hintText;
  final void Function(String string)? onChanged;
  final void Function(String? string)? onSaved;
  final void Function(String)? onSubmited;
  final String? initialValue;
  final String? Function(String?)? validator;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
        child: TextFormField(
          keyboardType: TextInputType.number,
          initialValue: initialValue ?? "",
          validator: validator,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hintText,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 1.0),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0),
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

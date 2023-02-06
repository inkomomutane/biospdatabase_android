import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordComponent extends StatefulWidget {
  PasswordComponent(
      {Key? key,
      required this.hintText,
      this.onChanged,
      this.onSaved,
      this.controller,
      this.onSubmited,
      this.obscureText = true,
      this.initialValue,
      this.validator})
      : super(key: key);
  final String hintText;
  void Function(String string)? onChanged;
  void Function(String? string)? onSaved;
  void Function(String)? onSubmited;
  bool obscureText;
  TextEditingController? controller;
  String? initialValue;
  String? Function(String?)? validator;

  @override
  _PasswordComponentState createState() => _PasswordComponentState(
        onChanged: onChanged,
        onSaved: onSaved,
        controller: controller,
        onSubmited: onSubmited,
        obscureText: obscureText,
        initialValue: initialValue,
        validator: validator,
        hintText: hintText,
      );
}

class _PasswordComponentState extends State<PasswordComponent> {
  _PasswordComponentState(
      {required this.hintText,
      this.onChanged,
      this.onSaved,
      this.controller,
      this.onSubmited,
      this.obscureText = true,
      this.initialValue,
      this.validator});

  final String hintText;
  void Function(String string)? onChanged;
  void Function(String? string)? onSaved;
  void Function(String)? onSubmited;
  bool obscureText;
  TextEditingController? controller;
  String? initialValue;
  String? Function(String?)? validator;
  Icon icon = Icon(Icons.visibility_off_sharp);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35, right: 35, top: 10),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: icon,
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
                if (obscureText) {
                  icon = const Icon(Icons.key_outlined);
                } else {
                  icon = const Icon(Icons.remove_red_eye_outlined);
                }
              });
              // Your codes...
            },
          ),
          border: OutlineInputBorder(),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
          ),
          // focusColor: Colors.black,
          // fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
        ),
        initialValue: initialValue ?? "",
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        onFieldSubmitted: onSubmited,
        validator: validator,
        obscureText: obscureText,
      ),
      // Stack(
      //   alignment: Alignment.centerRight,
      //   children: <Widget>[
      //
      //   ],
      // ),
    );
  }
}

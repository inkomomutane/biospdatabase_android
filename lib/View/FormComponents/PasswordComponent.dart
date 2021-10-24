import 'package:flutter/cupertino.dart';
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
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextFormField(
            autofocus: true,
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
                borderSide:
                    const BorderSide(color: Color(0xFF311b92), width: 2),
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
            obscureText: obscureText,
          ),
          IconButton(
            icon: icon,
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
                if (obscureText)
                  icon = Icon(Icons.visibility_off_sharp);
                else
                  icon = Icon(Icons.visibility);
              });
              // Your codes...
            },
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 35, right: 35, top: 10),
    );
  }
}

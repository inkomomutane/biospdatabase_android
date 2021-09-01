import 'package:dropdown_search2/dropdown_search2.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
//import 'dart:collection';

class SelectComponent extends StatelessWidget {
  SelectComponent(
      {Key? key,
      required this.hintText,
      required this.items,
      this.showSearchBox = false,
      this.mode = Mode.MENU})
      : super(key: key);
  final String hintText;
  final List<String> items;
  final bool showSearchBox;
  final Mode mode;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 35, right: 35, top: 10),
        child: DropdownSearch<String>(
          mode: mode,
          showSelectedItem: true,
          items: items,
          showSearchBox: showSearchBox,
          selectedItem: items.first,
          hint: hintText,
          onChanged: print,
          searchBoxDecoration: InputDecoration(
              hintText: "Pesquisar " + hintText,
              border: OutlineInputBorder(),
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
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFF311b92), width: 2),
              )),
        ));
  }
}

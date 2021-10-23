import 'package:dropdown_search2/dropdown_search2.dart';
import 'package:flutter/material.dart';
//import 'dart:collection';

// ignore: must_be_immutable
class SelectComponent<T> extends StatelessWidget {
  SelectComponent(
      {Key? key,
      required this.hintText,
      required this.items,
      this.showSearchBox = false,
      this.onSaved,
      this.onChanged,
      this.controller,
      this.mode = Mode.MENU,
      this.label,
      this.itemAsString,
      this.selectedItem})
      : super(key: key);
  final String hintText;
  final List<T> items;
  final bool showSearchBox;
  final Mode mode;
  final String? label;
  void Function(T?)? onSaved;
  void Function(T?)? onChanged;
  TextEditingController? controller;
  String Function(T)? itemAsString;
  var selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 35, right: 35, top: 10),
        child: DropdownSearch<T>(
          mode: mode,
          items: items,
          showSearchBox: showSearchBox,
          selectedItem: selectedItem != null ? selectedItem : null,
          hint: hintText,
          label: label,
          onChanged: onChanged,
          onSaved: onSaved,
          itemAsString: itemAsString,
          searchBoxController: controller,
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

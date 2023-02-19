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
      this.label,
      this.itemAsString,
      this.selectedItem})
      : super(key: key);
  final String hintText;
  final List<T> items;
  final bool showSearchBox;
  void Function(T?)? onSaved;
  void Function(T?)? onChanged;
  TextEditingController? controller;
  String Function(T?)? itemAsString;
  final dynamic selectedItem;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
        child: DropdownSearch<T>(
          mode: Mode.DIALOG,
          items: items,
          showSearchBox: true,
          selectedItem: selectedItem,
          onChanged: onChanged,
          onSaved: onSaved,
          itemAsString: itemAsString,
          showClearButton: true,
          dropdownSearchDecoration: InputDecoration(
            hintText: "Pesquisar $hintText",
            label: label,
            contentPadding: const EdgeInsets.all(12),
            border: const OutlineInputBorder(),
            
            // hintStyle: const TextStyle(
            //   fontSize: 15,
            //   color: Colors.black54,
            // ),
            // focusColor: Colors.black,
            // fillColor: Colors.white,
            filled: true,
            // enabledBorder: const OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.black45, width: 1.0),
            // ),
            // errorBorder: const OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.red, width: 2.0),
            // ),
            // focusedBorder: const OutlineInputBorder(
            //   borderSide: BorderSide(color: Color(0xFF311b92), width: 2),
            // ),
          ),
        ));
  }
}

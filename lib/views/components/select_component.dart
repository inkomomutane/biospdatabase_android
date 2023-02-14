import 'package:dropdown_search/dropdown_search.dart';
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
  final String? label;
  void Function(T?)? onSaved;
  void Function(T?)? onChanged;
  TextEditingController? controller;
  String Function(T)? itemAsString;
  final  dynamic selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
        child: DropdownSearch<T>(
          items: items,
          selectedItem: selectedItem,
          popupProps: const PopupProps.dialog(
            showSelectedItems: true,
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
              decoration:  InputDecoration(border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              )),
              
            )
          ),
          onChanged: onChanged,
          onSaved: onSaved,
          itemAsString: itemAsString,
          dropdownDecoratorProps:  DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
                hintText: "Pesquisar $hintText",
                border: const OutlineInputBorder(),
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).primaryColor,
                ),
                // focusColor: Colors.black,
                // fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                   BorderSide(color: Theme.of(context).primaryColor, width: 2),
                )),
          ),

          // searchBoxController: controller,
          // searchBoxDecoration:
        ));
  }
}

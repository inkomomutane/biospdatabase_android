import 'package:dropdown_search2/dropdown_search2.dart';
import 'package:flutter/material.dart';

class SelectComponent<T> extends StatelessWidget {
  const SelectComponent(
      {Key? key,
      required this.hintText,
      required this.items,
      this.showSearchBox = true,
      this.onSaved,
      this.onChanged,
      this.controller,
      this.label,
      this.showSelectedItems = false,
      this.itemAsString,
      this.validator,
      this.selectedItem})
      : super(key: key);
  final String hintText;
  final List<T> items;
  final bool showSearchBox;
  final bool showSelectedItems;
  final void Function(T?)? onSaved;
  final void Function(T?)? onChanged;
  final TextEditingController? controller;
  final String Function(T?)? itemAsString;
  final dynamic selectedItem;
  final Widget? label;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
      child: DropdownSearch<T>(
        mode: Mode.BOTTOM_SHEET,
        items: items,
        showSearchBox: showSearchBox,
        selectedItem: selectedItem,
        onChanged: onChanged,
        onSaved: onSaved,
        itemAsString: itemAsString,
        validator: validator,
        showSelectedItems: showSelectedItems,
        showClearButton: true,
        dropdownSearchDecoration: InputDecoration(
          hintText: hintText,
          label: label,
          contentPadding: const EdgeInsets.all(12),
          border: const OutlineInputBorder(),
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
      ),
    );
  }
}

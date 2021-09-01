import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
//import 'dart:collection';

class SelectComponent extends StatelessWidget {
  SelectComponent(
      {Key? key,
      required this.items,
      required this.titulo,
      required this.hintText,
      this.onChanged,
      this.onSubmitted,
      this.onSaved})
      : super(key: key);
  List<Map<String, dynamic>> items;
  final String titulo;
  final String hintText;
  final void Function(String value)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    var itemsArray = mappedItems(items);
    return Padding(
        child: SelectFormField(
          type: SelectFormFieldType.dialog,
          dialogSearchHint: 'Pesquisar',
          dialogCancelBtn: 'Ok',
          dialogTitle: titulo,
          items: itemsArray,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusColor: Colors.black,
              fillColor: Colors.white,
              hintText: hintText,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black45, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1.3),
              )),
          onChanged: (value) {
            itemsArray
                .where((element) => element['value'] != value)
                .forEach((element) {
              element['icon'] = Icon(Icons.check_box_outline_blank);
            });
            itemsArray
                .where((element) => element['value'] == value)
                .forEach((element) {
              element['icon'] = Icon(Icons.check_box_outlined);
            });
          },
          onFieldSubmitted: onSubmitted,
          onSaved: onSaved,
        ),
        padding: EdgeInsets.only(left: 35, right: 35, top: 10));
  }

  List<Map<String, dynamic>> mappedItems(List<Map<String, dynamic>> items) {
    return List.generate(items.length, (index) {
      return {
        'value': items.elementAt(index).keys.first,
        'label': items.elementAt(index).values.first,
        'icon': Icon(Icons.check_box_outline_blank)
      };
    });
  }
}

import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class SelectComponent extends StatelessWidget {
  const SelectComponent(
      {Key? key,
      required this.items,
      required this.titulo,
      required this.hintText,
      this.onChanged,
      this.onSubmitted,
      this.onSaved})
      : super(key: key);
  final List<Map<String, dynamic>> items;
  final String titulo;
  final String hintText;
  final void Function(String value)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
        child: SelectFormField(
          type: SelectFormFieldType.dialog,
          dialogSearchHint: 'Pesquisar',
          dialogCancelBtn: 'CANCELAR',
          dialogTitle: titulo,
          items: items,
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
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          onSaved: onSaved,
        ),
        padding: EdgeInsets.only(left: 35, right: 35, top: 10));
  }
}

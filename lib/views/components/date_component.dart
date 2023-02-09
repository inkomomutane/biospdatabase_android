import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DateComponent extends StatelessWidget {
  DateComponent(
      {Key? key,
        this.onSubmited,
        this.onChanged,
        this.onSaved,
        this.initialValue,
        this.controller})
      : super(key: key);
  void Function(DateTime?)? onSubmited;
  void Function(DateTime?)? onChanged;
  void Function(DateTime?)? onSaved;
  TextEditingController? controller;
  DateTime? initialValue;
  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd-MM-yyyy");

    return Padding(
        padding: EdgeInsets.only(left: 35, right: 35, top: 10),
        child: DateTimeField(
          format: format,
          controller: controller,
          onFieldSubmitted: onSubmited,
          onChanged: onChanged,
          onSaved: onSaved,
          initialValue: initialValue!=null ? initialValue :DateTime.now(),
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime.now());
            if (date != null) {
              return date; //DateTimeField.combine(date, TimeOfDay.now());
            } else {
              return currentValue;
            }
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              // focusColor: Colors.black45,
              // fillColor: Colors.white,
              suffixIcon: const Icon(Icons.date_range),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide:  BorderSide(color:Theme.of(context).primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                 BorderSide(color:Theme.of(context).primaryColor, width: 2),
              )),
        ));
  }
}
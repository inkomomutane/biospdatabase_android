import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DateTimeComponent extends StatelessWidget {
  DateTimeComponent(
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
    final format = DateFormat("dd-MM-yyyy HH:mm");
    return Padding(
        padding: EdgeInsets.only(left: 35, right: 35, top: 10),
        child: DateTimeField(
          format: format,
          onChanged: onChanged,
          onSaved: onSaved,
          initialValue: initialValue != null ? initialValue : DateTime.now(),
          controller: controller,
          onFieldSubmitted: onSubmited,
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusColor: Colors.black,
              fillColor: Colors.white,
              filled: true,
              suffixIcon: Icon(Icons.date_range),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black45, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFF311b92), width: 2),
              )),
        ));
  }
}

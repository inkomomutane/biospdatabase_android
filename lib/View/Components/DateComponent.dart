import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DateComponent extends StatelessWidget {
  const DateComponent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd-MM-yyyy");
    return Padding(
        padding: EdgeInsets.only(left: 35, right: 35, top: 10),
        child: DateTimeField(
          format: format,
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
              hintText: "test",
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black45, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1.3),
              )),
        ));
  }
}

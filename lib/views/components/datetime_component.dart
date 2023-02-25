import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DateTimeComponent extends StatelessWidget {
  DateTimeComponent(
      {Key? key,
      this.onSubmitted,
      this.onChanged,
      this.onSaved,
      this.initialValue,
      this.controller})
      : super(key: key);
  void Function(DateTime?)? onSubmitted;
  void Function(DateTime?)? onChanged;
  void Function(DateTime?)? onSaved;
  TextEditingController? controller;
  DateTime? initialValue;
  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd-MM-yyyy HH:mm");
    return Padding(
        padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
        child: DateTimeField(
          format: format,
          onChanged: onChanged,
          onSaved: onSaved,
          initialValue: initialValue ?? DateTime.now(),
          controller: controller,
          onFieldSubmitted: onSubmitted,
          onShowPicker: (context, currentValue) => showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100))
              .then(
            (date) => showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(
                currentValue ?? DateTime.now(),
              ),
            ).then(
              (time) => DateTimeField.combine(date ?? DateTime.now(), time),
            ),
          ),
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              filled: true,
              suffixIcon: const Icon(Icons.date_range),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColor, width: 2),
              )),
        ));
  }
}

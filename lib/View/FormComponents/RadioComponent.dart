import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RadioComponent extends StatelessWidget {
  RadioComponent(
      {Key? key, required this.labels, required this.values, this.onSetValue})
      : super(key: key);
  List<String> labels;
  List<String> values;
  final void Function(String)? onSetValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 35, right: 35, top: 10),
        child: CustomRadioButton(
          elevation: 0,
          enableShape: true,
          shapeRadius: 5,
          unSelectedBorderColor: Colors.black54,
          selectedBorderColor: Colors.black87,
          absoluteZeroSpacing: true,
          height: 42,
          radius: 5,
          unSelectedColor: Theme.of(context).canvasColor,
          buttonLables: labels,
          buttonValues: values,
          margin: EdgeInsets.only(right: 10),
          buttonTextStyle: ButtonTextStyle(
              selectedColor: Colors.black,
              unSelectedColor: Colors.black,
              textStyle: TextStyle(fontSize: 16)),
          radioButtonValue: (value) {},
          selectedColor: Colors.black26,
          // padding: 45,
        ));
  }
}

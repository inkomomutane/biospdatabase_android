import 'package:flutter/material.dart';

class RadioComponent extends StatelessWidget {
  const RadioComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Radio(value: 3, groupValue: [3, 5], onChanged: (value) {});
  }
}

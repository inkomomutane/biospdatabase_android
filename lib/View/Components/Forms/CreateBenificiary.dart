import 'package:biospdatabase/View/Components/LabelComponent.dart';
import 'package:biospdatabase/View/Components/NumberComponent.dart';
import 'package:biospdatabase/View/Components/RadioComponent.dart';
import 'package:biospdatabase/View/Components/SelectComponent.dart';
import 'package:biospdatabase/View/Components/TextComponent.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateBenificiary extends StatefulWidget {
  const CreateBenificiary({Key? key}) : super(key: key);

  @override
  _CreateBenificiaryState createState() => _CreateBenificiaryState();
}

class _CreateBenificiaryState extends State<CreateBenificiary> {
  String name = "";

  List<Map<String, dynamic>> _items = [
    {
      'value': 'boxValue',
      'label': 'Box Label',
      'icon': Icon(Icons.check_box_outline_blank)
    },
    {
      'value': 'circleValue',
      'label': 'Circle Label',
      'icon': Icon(Icons.check_box_rounded)
    },
    {
      'value': 'starValue',
      'label': 'Star Label',
      'icon': Icon(Icons.check_box_outline_blank)
    },
  ];

  void debug() {
    print(this.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RadioComponent(
        labels: ["ddsdd", "Ddd"],
        values: ["ddd", "Ddd"],
        onSetValue: (value) {},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this.debug();
          /*  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateForm()),
          );*/
        },
        tooltip: 'Salvar',
        child: Icon(Icons.save_alt_outlined),
      ),
    );
  }
}

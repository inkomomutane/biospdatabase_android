import 'package:biospdatabase/View/Components/DateComponent.dart';
import 'package:biospdatabase/View/Components/DateTimeComponent.dart';
import 'package:biospdatabase/View/Components/LabelComponent.dart';
import 'package:biospdatabase/View/Components/NumberComponent.dart';
import 'package:biospdatabase/View/Components/SelectComponent.dart';
import 'package:biospdatabase/View/Components/TextComponent.dart';
import 'package:flutter/material.dart';

class FormComponent extends StatefulWidget {
  const FormComponent({Key? key}) : super(key: key);

  @override
  _FormComponentState createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          LabelComponent(labelText: "Nome completo"),
          TextComponent(hintText: "Nome completo"),
          LabelComponent(labelText: "Bairro"),
          SelectComponent(items: [
            {
              "1": "Macuti",
            },
          ], titulo: "Bairro", hintText: "Bairro"),
          LabelComponent(labelText: "Sexo"),
          SelectComponent(items: [
            {
              "1": "Masculino",
            },
            {
              "2": "Feminino",
            },
          ], titulo: "Sexo", hintText: "Sexo"),
          LabelComponent(labelText: "1⁰ visita ou frequência"),
          NumberComponent(
            hintText: "1⁰ visita ou frequência",
          ),
          LabelComponent(labelText: "Proviniência"),
          SelectComponent(items: [
            {
              "1": "Vikings",
            },
            {
              "2": "Vikings 23",
            },
            {
              "3": "Vikings 45",
            },
            {
              "4": "Vikings 47",
            }
          ], titulo: "Proviniência", hintText: "Proviniência"),
          LabelComponent(labelText: "Data de nascimento"),
          DateComponent(),
          LabelComponent(labelText: "Bairro"),
          LabelComponent(labelText: "Bairro"),
          LabelComponent(labelText: "Bairro"),
          LabelComponent(labelText: "Bairro"),
        ],
      ),
    );
  }
}

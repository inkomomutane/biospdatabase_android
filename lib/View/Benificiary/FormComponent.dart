import 'package:biospdatabase/View/Components/DateComponent.dart';
import 'package:biospdatabase/View/Components/DateTimeComponent.dart';
import 'package:biospdatabase/View/Components/LabelComponent.dart';
import 'package:biospdatabase/View/Components/NumberComponent.dart';
import 'package:biospdatabase/View/Components/PhoneNumberComponent.dart';
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
          SelectComponent(
            hintText: "Bairro",
            items: ["Macuti"],
          ),
          LabelComponent(labelText: "Sexo"),
          SelectComponent(
            hintText: "Sexo",
            items: ["Masculino", "Feminino"],
          ),
          LabelComponent(labelText: "1⁰ visita ou frequência"),
          NumberComponent(
            hintText: "1⁰ visita ou frequência",
          ),
          LabelComponent(labelText: "Proviniência"),
          SelectComponent(
            hintText: "Proviniência",
            items: ["Comunidade"],
          ),
          LabelComponent(labelText: "Data de nascimento"),
          DateComponent(),
          LabelComponent(labelText: "Contacto"),
          PhoneNumberComponent(
            hintText: "Contacto",
          ),
          LabelComponent(labelText: "Data de atendimento"),
          DateTimeComponent(),
          LabelComponent(labelText: "Objectivo da visita"),
          SelectComponent(
            hintText: "Objectivo da visita",
            items: ["1. Welma"],
          ),
          LabelComponent(
              labelText: "Se tiver formação profissional Especificar"),
          TextComponent(hintText: "Se tiver formação profissional Especificar"),
          LabelComponent(labelText: "Motivo de abertura de processo"),
          SelectComponent(
            hintText: "Motivo de abertura de processo",
            items: ["1. Welma"],
          ),
          LabelComponent(labelText: "Documentos necessários"),
          SelectComponent(
            hintText: "Documentos necessários",
            items: ["1. Welma"],
          ),
          LabelComponent(labelText: "Serviço encaminhado"),
          SelectComponent(
            hintText: "Serviço encaminhado",
            items: ["1. FIP"],
          ),
          LabelComponent(labelText: "Especificar Serviço"),
          TextComponent(hintText: "Especificar Serviço"),
          LabelComponent(labelText: "Necessita de acompanhamento domiciliar?"),
          SelectComponent(
            hintText: "Necessita de acompanhamento domiciliar?",
            items: ["1. Sim", "2. Não"],
          ),
          LabelComponent(labelText: "Objectivo da(s)  visita(s)"),
          TextComponent(hintText: "Objectivo da(s)  visita(s)"),
          LabelComponent(labelText: "Data que foi recebida pelo serviço"),
          DateTimeComponent(),
          LabelComponent(labelText: "Resolveu o seu problema?"),
          SelectComponent(
            hintText: "Resolveu o seu problema?",
            items: ["1. Sim", "2. Não"],
          ),
          LabelComponent(labelText: ""),
        ],
      ),
    );
  }
}

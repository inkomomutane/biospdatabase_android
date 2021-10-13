import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/Syncronization/Syncronization.dart';
import 'package:biospdatabase/View/Components/LabelComponent.dart';
import 'package:biospdatabase/View/Relatorio/CardRelatorioUI.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RelatorioDiario extends StatelessWidget {
  const RelatorioDiario({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        title: Text(
          "Relatório diario",
          style: TextStyle(color: Colors.black54),
        ),
        elevation: 1,
      ),
      body: ListView(
        children: [
          LabelComponent(labelText: "Último benificiario"),
          ultimoBenificiario(),
        ],
      ),
    );
  }

  Widget ultimoBenificiario() {
    DateFormat dateFormat = DateFormat("d-MM-y");
    if (Syncronization.sortedBenificiaries().isEmpty) return Container();
    Benificiary last = Syncronization.sortedBenificiaries().first;
    return CardRelatorioUI(
        letter:
            "${(last.fullName != null ? last.fullName!.substring(0, 1).toUpperCase() : "")}",
        title: Text("${(last.fullName != null ? last.fullName : "")}"),
        subtitle: Text("${last.phone != null ? last.phone : ""}"));
  }
}

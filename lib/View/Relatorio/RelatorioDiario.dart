import 'package:biospdatabase/Controller/ServerSyncController.dart';
import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/Controller/BenificiaryController.dart';
import 'package:biospdatabase/View/FormComponents/LabelComponent.dart';
import 'package:biospdatabase/View/Home/BenificiaryListTile.dart';
import 'package:biospdatabase/View/Relatorio/CardRelatorioUI.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RelatorioDiario extends StatelessWidget {
  const RelatorioDiario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        title: Text(
          "Relatórios",
          style: TextStyle(color: Colors.black54),
        ),
        elevation: 1,
      ),
      body: ListView(
        children: [
          LabelComponent(labelText: "Último benificiario atendido"),
          ultimoBenificiario(),
          CardRelatorioUI(
            color: Colors.grey.shade300,
            letter: Icon(
              Icons.group,
              color: Colors.grey.shade500,
            ),
            title: Text(
              'Total atendidos mês passado',
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: Colors.grey.shade800),
            ),
            subtitle: Text(
                ' ${Syncronization.getBeneficiaries().values.where((element) {
              var dateTime = DateTime.now();
              return (element.serviceDate!.year > (dateTime.year - 1)) &&
                  element.serviceDate!.month == DateTime.now().month - 1;
            }).length}'),
          ),
          CardRelatorioUI(
            color: Colors.grey.shade300,
            letter: Icon(
              Icons.group,
              color: Colors.grey.shade500,
            ),
            title: Text(
              'Total atendidos hoje',
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: Colors.grey.shade800),
            ),
            subtitle: Text(
                ' ${Syncronization.getBeneficiaries().values.where((element) {
              var dateTime = DateTime.now();
              dateTime = dateTime.subtract(Duration(days: dateTime.weekday));
              return element.serviceDate!.isAfter(dateTime) &&
                  element.serviceDate!.day == DateTime.now().day;
            }).length}'),
          ),
          CardRelatorioUI(
            color: Colors.grey.shade300,
            letter: Icon(
              Icons.print_rounded,
              color: Colors.grey.shade500,
            ),
            onTap: () async {
              if (Syncronization.getNeighborhoods().isNotEmpty) {
                var result = await ServerSyncController().getRepport(
                    Syncronization.getNeighborhoods().values.first.uuid);
                if (result)
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Relatório baixado com sucesso',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                  ));
                else
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Ocorreu um erro ao baixar relatório. tente de novo! Caso o erro persista por favor contacte o administrador',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.red,
                  ));
              } else
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Ocorreu um erro ao baixar relatório. tente de novo! Caso o erro persista por favor contacte o administrador',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ));
            },
            title: Text(
              'Baixar relatório mensal',
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: Colors.grey.shade800),
            ),
            subtitle: Text(
                'Total atendidos este mês: ${Syncronization.getBeneficiaries().values.where((element) {
              var dateTime = DateTime.now();

              return (element.serviceDate!.year > (dateTime.year - 1)) &&
                  element.serviceDate!.month == DateTime.now().month;
            }).length}'),
          ),
          graph()
        ],
      ),
    );
  }

  Widget ultimoBenificiario() {
    if (Syncronization.sortedBenificiaries().isEmpty) return Container();
    Benificiary last = Syncronization.sortedBenificiaries().first;
    return BenificiaryListTile(benificiary: last);
  }

  Widget graph() {
    var d = DateTime.now();
    var weekDay = d.weekday;
    var firstDayOfWeek = d.subtract(Duration(days: weekDay));
    var bens = Syncronization.sortedBenificiaries().where((element) {
      return element.serviceDate!.isAfter(firstDayOfWeek);
    }).toList();
    print(bens.where((element) => element.serviceDate!.weekday == 5).length);
    return Container(
      child: Column(
        children: [
          LabelComponent(
              labelText: "Gráfico benificiarios atendidos nesta semana."),
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(),
              // adding multiple axis
              series: <ChartSeries>[
                LineSeries<SalesData, String>(
                    dataSource: [
                      SalesData(
                          'Seg',
                          bens
                              .where((element) =>
                                  element.serviceDate!.weekday == 1)
                              .length),
                      SalesData(
                          'Ter',
                          bens
                              .where((element) =>
                                  element.serviceDate!.weekday == 2)
                              .length),
                      SalesData(
                          'Qua',
                          bens
                              .where((element) =>
                                  element.serviceDate!.weekday == 3)
                              .length),
                      SalesData(
                          'Qui',
                          bens
                              .where((element) =>
                                  element.serviceDate!.weekday == 4)
                              .length),
                      SalesData(
                          'Sex',
                          bens
                              .where((element) =>
                                  element.serviceDate!.weekday == 5)
                              .length)
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales),
              ]),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales, [this.numeric]);
  final String year;
  final int? sales;
  final int? numeric;
}

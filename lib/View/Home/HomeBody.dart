import 'package:biospdatabase/Controller/BenificiaryController.dart';
import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'BenificiaryListTile.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 48.0),
      padding: EdgeInsets.only(top: 8.0),
      child: ValueListenableBuilder<Box<Benificiary>>(
        valueListenable: Syncronization.getBeneficiaries().listenable(),
        builder: (context, box, _) {
          final benificiaries = box.values.toList().cast<Benificiary>();
          mergeSort(benificiaries, compare: (a, b) {
            a = a as Benificiary;
            b = b as Benificiary;
            return -a.createdAt.compareTo(b.createdAt);
          });
          return ListView.builder(
              itemCount: benificiaries.length,
              itemBuilder: (context, int index) {
                return BenificiaryListTile(
                    benificiary: Benificiary.fromJson(
                        benificiaries.elementAt(index).toJson()));
              });
        },
      ),
    );
  }
}

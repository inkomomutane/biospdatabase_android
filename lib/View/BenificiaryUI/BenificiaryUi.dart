import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:flutter/material.dart';
import 'DesktopTile.dart';
import 'MobileTile.dart';

class BenificiaryUi extends StatefulWidget {
  final Benificiary benificiary;
  const BenificiaryUi({Key? key, required this.benificiary})
      : super(key: key);
  @override
  _BenificiaryUiState createState() =>
      _BenificiaryUiState(this.benificiary);
}

class _BenificiaryUiState extends State<BenificiaryUi> {
  final Benificiary benificiary;

  _BenificiaryUiState(this.benificiary);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return MobileTile(
              benificiary: this.benificiary,
            );
          } else {
            return DesktopTile(benificiary: this.benificiary);
          }
        },
      ),
    );
  }
}

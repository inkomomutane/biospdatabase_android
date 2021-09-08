import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:flutter/material.dart';
import 'DesktopTile.dart';
import 'MobileTile.dart';

class BenificiaryTile extends StatefulWidget {
  final Benificiary benificiary;
  const BenificiaryTile({Key? key, required this.benificiary})
      : super(key: key);
  @override
  _BenificiaryTileState createState() =>
      _BenificiaryTileState(this.benificiary);
}

class _BenificiaryTileState extends State<BenificiaryTile> {
  final Benificiary benificiary;

  _BenificiaryTileState(this.benificiary);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return MobileTile(
            benificiary: this.benificiary,
          );
        } else {
          return DesktopTile(benificiary: this.benificiary);
        }
      },
    );
  }
}

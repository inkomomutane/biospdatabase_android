import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/View/BenificiaryUI/BenificiaryUi.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/material.dart';

class BenificiaryListTile extends StatelessWidget {
  const BenificiaryListTile({Key? key, required this.benificiary, this.icon})
      : super(key: key);
  final Benificiary benificiary;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.person,
              color: Colors.grey.shade500,
            ),
            backgroundColor: Colors.grey.shade300,
          ),
          title: benificiary.fullName != null
              ? Text(
                  "${capitalize(benificiary.fullName ?? "")}",
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.grey.shade800),
                )
              : Text(""),
          subtitle: benificiary.phone != null
              ? Text("${benificiary.phone}")
              : Text(""),
          trailing: icon != null ? icon : Text(""),
        ),
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                BenificiaryUi(benificiary: benificiary),
            fullscreenDialog: true,
          ),
        );
      },
    );
  }
}

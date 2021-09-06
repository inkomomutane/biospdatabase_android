import 'package:biospdatabase/View/Components/LabelComponent.dart';
import 'package:biospdatabase/View/Components/TextComponent.dart';
import 'package:biospdatabase/View/login/FormComponents.dart';
import 'package:flutter/material.dart';

class MobileMode extends StatefulWidget {
  const MobileMode({Key? key}) : super(key: key);

  @override
  _MobileModeState createState() => _MobileModeState();
}

class _MobileModeState extends State<MobileMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/backgroundDesktop.png"))),
          child: Center(
              child: Card(
                  elevation: 9,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Padding(
                              child: Container(
                                child: Image(
                                  image: AssetImage("images/mobile_login.png"),
                                ),
                              ),
                              padding: EdgeInsets.all(8),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              child: Container(child: FormComponents()),
                            )),
                      ],
                    ),
                  ))),
        ));
  }
}

import 'package:biospdatabase/View/login/FormComponents.dart';
import 'package:flutter/material.dart';

class DesktopMode extends StatefulWidget {
  const DesktopMode({Key? key}) : super(key: key);

  @override
  _DesktopModeState createState() => _DesktopModeState();
}

class _DesktopModeState extends State<DesktopMode> {
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
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Padding(
                              child: Container(
                                child: Image(
                                  image: AssetImage("images/logo.png"),
                                ),
                              ),
                              padding: EdgeInsets.all(8),
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                              child: Center(child: FormComponents()),
                            )),
                      ],
                    ),
                  ))),
        ));
  }
}

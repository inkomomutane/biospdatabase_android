import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/Syncronization/Syncronization.dart';
import 'package:biospdatabase/View/Benificiary/Benificiary.dart';
import 'package:biospdatabase/View/BenificiaryTile/ContentTile.dart';
import 'package:flutter/material.dart';

class DesktopTile extends StatefulWidget {
  const DesktopTile({Key? key, required this.benificiary}) : super(key: key);
  final Benificiary benificiary;

  @override
  _DesktopTileState createState() => _DesktopTileState(this.benificiary);
}

class _DesktopTileState extends State<DesktopTile> {
  final Benificiary benificiary;

  _DesktopTileState(this.benificiary);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 9,
        margin: EdgeInsets.only(top: 8),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Padding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              BenificiaryForm(
                                                  benificiaryForEdit:
                                                      benificiary),
                                          fullscreenDialog: true,
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.edit)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: IconButton(
                                    onPressed: () {
                                      if (Syncronization.addDeleted(
                                          benificiary)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            'Benificiario deletado com sucesso',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          backgroundColor: Colors.green,
                                        ));
                                        Navigator.of(context).pop();
                                      }
                                    },
                                    icon: Icon(Icons.delete)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(
                                        Icons.cancel_presentation_outlined)),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("images/logo.png"))),
                          ),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(0),
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xFFf4f8fd)),
                    child: Center(
                        child: ContentTile(
                      benificiary: benificiary,
                    )),
                  )),
            ],
          ),
        ));
  }
}

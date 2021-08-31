import 'dart:html';

import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/Syncronization/Syncronization.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Biosp Database",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Biosp Database",
            style: TextStyle(color: Colors.black54),
          ),
          elevation: 0,
        ),
        body: ValueListenableBuilder<Box<Benificiary>>(
          valueListenable: Syncronization.getBeneficiaries().listenable(),
          builder: (context, box, _) {
            final benificiaries = box.values.toList().cast<Benificiary>();
            return ListView.builder(
                itemCount: benificiaries.length,
                itemBuilder: (context, int index) {
                  return BenificiaryCard(
                      context, benificiaries.elementAt(index));
                });
            //return Text("${benificiaries.length}");
          },
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) => setState(() => _currentIndex = index),
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Benificiarios'),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.cloud_off),
              title: Text('Sincronizar'),
              activeColor: Colors.blueAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.print),
              title: Text('Relatórios'),
              activeColor: Colors.blue,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Syncronization.addCreated(Benificiary(
                uuid: Uuid().v4(),
                createdAt: DateTime.now(),
                updatedAt: DateTime.now()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget BenificiaryCard(BuildContext context, Benificiary benificiary) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          leading: Icon(
            Icons.person,
            color: Colors.amber,
          ),
          title: Text(benificiary.createdAt.year.toString()),
        ),
        elevation: 0,
      ),
      onTap: () {
        showDialog<void>(
            context: context,
            builder: (context) => AlertDialog(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  contentPadding: EdgeInsets.all(0),
                  title: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xFFFdffdf),
                    ),
                    child: Text("Data",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.w800)),
                  ),
                  titlePadding: EdgeInsets.all(0),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.blueGrey,
                        ),
                        Icon(
                          Icons.message,
                          color: Colors.blueGrey,
                        ),
                        Icon(
                          Icons.edit,
                          color: Colors.blueGrey,
                        ),
                        Icon(
                          Icons.delete_outlined,
                          color: Colors.blueGrey,
                        )
                      ],
                    )
                  ],
                  actionsPadding: EdgeInsets.all(10),
                ));

        /* print(benificiary.toJson());
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => FullScreenDialog(),
            fullscreenDialog: true,
          ),
        );*/
      },
    );
  }
}

class FullScreenDialog extends StatefulWidget {
  const FullScreenDialog({Key? key}) : super(key: key);

  @override
  _FullScreenDialogState createState() => _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Full-screen Dialog'),
      ),
      body: Center(
        child: Text("Full-screen dialog"),
      ),
    );
  }
}

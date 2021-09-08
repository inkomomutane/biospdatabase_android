import 'package:badges/badges.dart';
import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/Syncronization/ServerSync.dart';
import 'package:biospdatabase/Syncronization/Syncronization.dart';
import 'package:biospdatabase/View/Benificiary/Benificiary.dart';
import 'package:biospdatabase/View/BenificiaryTile/BenificiaryTile.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.index = 0}) : super(key: key);
  final int index;

  @override
  _HomeState createState() => _HomeState(index);
}

class _HomeState extends State<Home> {
  _HomeState(this.index);
  final int index;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          primaryColorDark: Colors.deepPurple,
          accentColor: Colors.deepPurple,
        ),
        focusColor: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      title: "Biosp Database",
      home: MainComponent(index),
    );
  }
}

class MainComponent extends StatefulWidget {
  const MainComponent(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  _MainComponentState createState() => _MainComponentState(index);
}

class _MainComponentState extends State<MainComponent> {
  _MainComponentState(this._currentIndex);
  int _currentIndex;
  int _syncLength = Syncronization.getCreatedBeneficiaries().values.length +
      Syncronization.getUpdatedBeneficiaries().values.length +
      Syncronization.getDeletedBeneficiaries().values.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Biosp Database",
          style: TextStyle(color: Colors.black54),
        ),
        elevation: 1,
      ),
      body: ValueListenableBuilder<Box<Benificiary>>(
        valueListenable: Syncronization.getBeneficiaries().listenable(),
        builder: (context, box, _) {
          final benificiaries = box.values.toList().cast<Benificiary>();
          return ListView.builder(
              itemCount: benificiaries.length,
              itemBuilder: (context, int index) {
                return benificiaryCard(
                    context,
                    Benificiary.fromJson(
                        benificiaries.elementAt(index).toJson()));
              });
          //return Text("${benificiaries.length}");
        },
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          if (index == 1) {
            ServerSync data = ServerSync();
            data.syncSettings().then((value) {
              setState(() {
                _currentIndex = 0;
              });
              if (value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Syncronização feita com sucesso',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Ocorreu um ao sincronizar. tente de novo! Caso o erro persista por favor contacte o administrador',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ));
              }
            });
          }
        }),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Benificiarios'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: ValueListenableBuilder<Box<Benificiary>>(
              valueListenable: Syncronization.getBeneficiaries().listenable(),
              builder: (context, asc, _) {
                int size = Syncronization.getCreatedBeneficiaries().length +
                    Syncronization.getUpdatedBeneficiaries().length +
                    Syncronization.getDeletedBeneficiaries().length;
                return Badge(
                  badgeColor:
                      size > 0 ? Colors.orange.shade500 : Colors.green.shade500,
                  badgeContent: Text(
                    size > 0 ? "$size" : "",
                    style: TextStyle(fontSize: 11),
                  ),
                  child: size > 0
                      ? Icon(Icons.cloud_upload_outlined)
                      : Icon(
                          Icons.cloud_done_outlined,
                          color: Colors.green.shade500,
                        ),
                );
              },
            ),
            title: Text('Sincronizar'),
            activeColor: Colors.blueAccent,
            textAlign: TextAlign.center,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (Syncronization.getNeighborhoods().isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => BenificiaryForm(),
                fullscreenDialog: true,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                'Por favor Syncronize primeiro',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blueGrey,
            ));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget benificiaryCard(BuildContext context, Benificiary benificiary) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amberAccent,
            child: Text(
              (benificiary.fullName != "" && benificiary.fullName != null)
                  ? "${benificiary.fullName!.substring(0, 1).toUpperCase()}"
                  : "",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
          title: benificiary.fullName != null
              ? Text(
                  "${benificiary.fullName!.toUpperCase()}",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              : Text(""),
          subtitle: benificiary.phone != null
              ? Text("${benificiary.phone}")
              : Text(""),
        ),
        elevation: 0.4,
        margin: EdgeInsets.all(0.1),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                BenificiaryTile(benificiary: benificiary),
            fullscreenDialog: true,
          ),
        );
      },
    );
  }
}

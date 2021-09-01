import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/Syncronization/Syncronization.dart';
import 'package:biospdatabase/View/Benificiary/Benificiary.dart';
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
      home: MainComponent(),
    );
  }
}

class MainComponent extends StatefulWidget {
  const MainComponent({Key? key}) : super(key: key);

  @override
  _MainComponentState createState() => _MainComponentState();
}

class _MainComponentState extends State<MainComponent> {
  int _currentIndex = 0;

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
                return benificiaryCard(context, benificiaries.elementAt(index));
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
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => BenificiaryForm(),
              fullscreenDialog: true,
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget benificiaryCard(BuildContext context, Benificiary benificiary) {
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
      },
    );
  }
}

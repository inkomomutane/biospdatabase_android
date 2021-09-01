import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/View/Benificiary/FormComponent.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class BenificiaryForm extends StatefulWidget {
  const BenificiaryForm({Key? key}) : super(key: key);

  @override
  _BenificiaryFormState createState() => _BenificiaryFormState();
}

class _BenificiaryFormState extends State<BenificiaryForm> {
  int _currentIndex = 1;
  var benificiary = new Benificiary(
      uuid: Uuid().v4(), createdAt: DateTime.now(), updatedAt: DateTime.now());

  @override
  Widget build(BuildContext context) {
    print(benificiary.toJson());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black45,
        elevation: 1,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FormComponent(),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() {
          this._currentIndex = index;
        }),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.block),
            title: Text('Cancelar'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.save),
            title: Text('Guardar'),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

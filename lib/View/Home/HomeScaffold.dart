import 'package:badges/badges.dart';
import 'package:biospdatabase/Controller/BenificiaryController.dart';
import 'package:biospdatabase/Controller/ServerSyncController.dart';
import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/View/BenificiaryForm/BenificiaryForm.dart';
import 'package:biospdatabase/View/Home/BenificiaryListTile.dart';
import 'package:biospdatabase/View/Home/HomeBody.dart';
import 'package:biospdatabase/View/Home/HomeDrawer.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class HomeScaffold extends StatefulWidget {
  const HomeScaffold(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  _HomeScaffoldState createState() => _HomeScaffoldState(index);
}

class _HomeScaffoldState extends State<HomeScaffold> {
  _HomeScaffoldState(this._currentIndex);
  int _currentIndex;
  String biospName = "";
  List<Benificiary> benificiaries = <Benificiary>[];

  @override
  void initState() {
    if (Syncronization.getNeighborhoods().isNotEmpty) {
      biospName =
          "Bairro de " + Syncronization.getNeighborhoods().values.first.name;
    }
    benificiaries = Syncronization.sortedBenificiaries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(biospName: biospName),
      body: Stack(
        fit: StackFit.expand,
        children: [
          HomeBody(),
          buildFloatingSearchBar(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          if (index == 1) {
            ServerSyncController data = ServerSyncController();
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
                    'Ocorreu um erro ao sincronizar. tente de novo! Caso o erro persista por favor contacte o administrador',
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

  Widget buildFloatingSearchBar() {
    return FloatingSearchBar(
      hint: 'Pesquisar ...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 400),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      openAxisAlignment: 0.0,
      width: MediaQuery.of(context).size.width,
      debounceDelay: const Duration(milliseconds: 200),
      onQueryChanged: (query) {
        setState(() {
          benificiaries = Syncronization.sortedBenificiaries()
              .where((element) =>
                  element.fullName!
                      .toLowerCase()
                      .contains(query.toLowerCase()) ||
                  element.fullName!
                          .toLowerCase()
                          .compareTo(query.toLowerCase()) ==
                      0)
              .toList();
        });
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.person_search),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: benificiaries.map((color) {
                return BenificiaryListTile(
                  benificiary: color,
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

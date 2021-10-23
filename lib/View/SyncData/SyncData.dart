import 'package:biospdatabase/Controller/BenificiaryController.dart';
import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/View/Home/BenificiaryListTile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SyncData extends StatefulWidget {
  const SyncData({Key? key}) : super(key: key);

  @override
  _SyncDataState createState() => _SyncDataState();
}

class _SyncDataState extends State<SyncData> {
  List<Benificiary> benificiaries = <Benificiary>[];

  @override
  void initState() {
    benificiaries = Syncronization.getCreatedBeneficiaries().values.toList();
    benificiaries
        .addAll(Syncronization.getUpdatedBeneficiaries().values.toList());
    mergeSort(benificiaries, compare: (a, b) {
      a = a as Benificiary;
      b = b as Benificiary;
      return -a.updatedAt.compareTo(b.updatedAt);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            padding: EdgeInsets.all(18),
            child: ValueListenableBuilder<Box<Benificiary>>(
                valueListenable: Syncronization.getBeneficiaries().listenable(),
                builder: (context, box, _) {
                  benificiaries =
                      Syncronization.getCreatedBeneficiaries().values.toList();
                  benificiaries.addAll(
                      Syncronization.getUpdatedBeneficiaries().values.toList());
                  mergeSort(benificiaries, compare: (a, b) {
                    a = a as Benificiary;
                    b = b as Benificiary;
                    return -a.updatedAt.compareTo(b.updatedAt);
                  });
                  return ListView(
                      children: benificiaries.map((e) {
                    return BenificiaryListTile(
                      benificiary: e,
                      icon: Icon(
                        Icons.sync_problem_outlined,
                        color: Colors.red.shade300,
                      ),
                    );
                  }).toList());
                }),
          ),
          buildFloatingSearchBar(),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    return FloatingSearchBar(
      hint: 'Dados não sync..',
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

import 'package:biospdatabase/Controller/BenificiaryController.dart';
import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/View/Home/BenificiaryListTile.dart';
import 'package:diacritic/diacritic.dart';
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
  List<BenificiaryListTile> benificiaries = <BenificiaryListTile>[];

  @override
  void initState() {
    benificiaries = Syncronization.getCreatedBeneficiaries()
        .values
        .map((e) => BenificiaryListTile(
              benificiary: e,
              icon: Icon(
                Icons.person_add_sharp,
                color: Colors.green,
              ),
            ))
        .toList();
    benificiaries.addAll(Syncronization.getUpdatedBeneficiaries()
        .values
        .map((e) => BenificiaryListTile(
              benificiary: e,
              icon: Icon(Icons.mode_edit_outline, color: Colors.amber),
            ))
        .toList());

    benificiaries.addAll(Syncronization.getDeletedBeneficiaries()
        .values
        .map((e) => BenificiaryListTile(
              benificiary: e,
              icon: Icon(
                Icons.auto_delete_outlined,
                color: Colors.red.shade500,
              ),
              isDisabled: true,
            ))
        .toList());

    mergeSort(benificiaries, compare: (a, b) {
      a = a as BenificiaryListTile;
      b = b as BenificiaryListTile;
      return -a.benificiary.updatedAt.compareTo(b.benificiary.updatedAt);
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
                  benificiaries = Syncronization.getCreatedBeneficiaries()
                      .values
                      .map((e) => BenificiaryListTile(
                            benificiary: e,
                            icon: Icon(
                              Icons.person_add_sharp,
                              color: Colors.green,
                            ),
                          ))
                      .toList();
                  benificiaries.addAll(Syncronization.getUpdatedBeneficiaries()
                      .values
                      .map((e) => BenificiaryListTile(
                            benificiary: e,
                            icon: Icon(Icons.mode_edit_outline,
                                color: Colors.amber),
                          ))
                      .toList());

                  benificiaries.addAll(Syncronization.getDeletedBeneficiaries()
                      .values
                      .map((e) => BenificiaryListTile(
                            benificiary: e,
                            icon: Icon(
                              Icons.auto_delete_outlined,
                              color: Colors.red.shade500,
                            ),
                            isDisabled: true,
                          ))
                      .toList());

                  mergeSort(benificiaries, compare: (a, b) {
                    a = a as BenificiaryListTile;
                    b = b as BenificiaryListTile;
                    return -a.benificiary.updatedAt
                        .compareTo(b.benificiary.updatedAt);
                  });
                  return ListView(children: benificiaries);
                }),
          ),
          buildFloatingSearchBar(),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    return FloatingSearchBar(
      hint: 'Dados não sincronizados',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 400),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      openAxisAlignment: 0.0,
      width: MediaQuery.of(context).size.width,
      debounceDelay: const Duration(milliseconds: 200),
      onQueryChanged: (query) {
        setState(() {
          this.benificiaries = Syncronization.sortedBenificiaries()
              .where((element) =>
                  removeDiacritics(element.fullName!.toLowerCase())
                      .contains(removeDiacritics(query.toLowerCase())) ||
                  removeDiacritics(element.fullName!.toLowerCase())
                          .compareTo(removeDiacritics(query.toLowerCase())) ==
                      0)
              .map((e) => BenificiaryListTile(
                    benificiary: e,
                    icon: Icon(Icons.lock_clock),
                  ))
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
            child:
                Column(mainAxisSize: MainAxisSize.min, children: benificiaries),
          ),
        );
      },
    );
  }
}

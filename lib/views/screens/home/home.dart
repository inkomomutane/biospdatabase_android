import 'package:biosp/bloc/components/cubit/create_update_beneficiary_cubit.dart';
import 'package:biosp/domain/actions/app_sync_count.dart';
import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:biosp/sync/app_sync.dart';
import 'package:isar/isar.dart';

import '../../../bloc/components/cubit/home_bottom_bar_index_cubit.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../bloc/components/cubit/language_cubit.dart';
import '../../../core/inject.dart';
import '../../../domain/actions/beneficiary/get_beneficiaries.dart';
import '../../../domain/entity/language_entity.dart';
import '../../../translations/locale_keys.g.dart';
import 'home_drawer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguageCubit, LanguageEntity>(
      listener: (context, state)  => context.setLocale(Locale(state.lang)),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          drawer: const HomeDrawerScreen(),
          body: BlocBuilder<CreateUpdateBeneficiaryCubit, BeneficiaryEntity>(
            builder: (context, state) {
              return FutureBuilder(
                future:GetIt.I<GetBeneficiaries>()(),
                builder: (_, snap) {
                  if (snap.hasData) {
                    return snap.data!.fold(
                            (l) => Inject.placeholder(),
                            (r) => ListView(
                          children: r
                              .map(
                                (beneficiary) => ListTile(
                              tileColor: Theme.of(context).canvasColor,
                              shape: Border(
                                bottom: BorderSide(
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    5.0), //or 15.0
                                child: Container(
                                  height: 40.0,
                                  width: 40.0,
                                  color: Theme.of(context).hoverColor,
                                  child: const Icon(
                                    Icons.volume_up,
                                  ),
                                ),
                              ),
                              onTap: () {
                                context.read<CreateUpdateBeneficiaryCubit>().validate(beneficiary);
                                Navigator.of(context).pushNamed('create_update');

                              },
                              title: Text(
                                beneficiary.fullName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  const Icon(
                                    Icons.phone_android_rounded,
                                    size: 14,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    beneficiary.phone,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                              .toList(),
                        ));
                  } else {
                    return Inject.placeholder();
                  }
                },
              );
            },
          ),
          bottomNavigationBar: BlocBuilder<HomeBottomBarIndexCubit, int>(
            builder: (context, state) {
              return BottomNavyBar(
                selectedIndex: context.read<HomeBottomBarIndexCubit>().state,
                showElevation: true,
                itemCornerRadius: 10,
                curve: Curves.easeIn,
                items: <BottomNavyBarItem>[
                  BottomNavyBarItem(
                    icon: const Icon(Icons.people),
                    title: Text(LocaleKeys.beneficiaries.tr().capitalize),
                    activeColor: Colors.red,
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(
                    icon: FutureBuilder(
                        future: GetIt.I<AppSyncCount>()(),
                        builder: (_, snap) {
                          int count = 0;

                          if (snap.hasData) {
                            count = snap.data!.fold((l) => 0, (r) => r);
                          }
                          return Badge(
                            label: Text(
                              count.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            child: const Icon(Icons.sync),
                          );
                        }),
                    title: Text(LocaleKeys.sync.tr().capitalize),
                    activeColor: Colors.green,
                    textAlign: TextAlign.center,
                  )
                ],
                onItemSelected: (int index) {
                  context.read<HomeBottomBarIndexCubit>().changeIndex(index);
                  if (index == 1) {
                    AppSync(GetIt.I<Isar>())().then((value) {
                      value.fold((l) {
                        debugPrint(l);
                      }, (r) {
                        context.read<HomeBottomBarIndexCubit>().changeIndex(0);
                      });
                    });
                  }
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.person_add),
            onPressed: () => Navigator.of(context).pushNamed('create_update'),
          ),
        );
      },
    );
  }
}

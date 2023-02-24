import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/language_entity.dart';

class LanguageCubit extends Cubit<LanguageEntity> {
  LanguageCubit() : super(const LanguageEntity());
  void change(String lang) => emit(state.copyWith(lang: lang));
}
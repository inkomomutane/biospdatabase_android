import 'package:biosp/bloc/components/cubit/language_cubit.dart';
import 'package:biosp/domain/entity/language_entity.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  late LanguageCubit languageCubit;
  setUp(() {
    languageCubit = LanguageCubit();
  });

  group('Language bloc test group', () {
    test("it should test initial state of language cubit to be pt.", () {
      expect(languageCubit.state.lang, 'pt');
    });

    blocTest(
      "it should change state to new on changing language",
      build: () => languageCubit,
      act: (state) => state.emit(const LanguageEntity(lang: 'en')),
      expect: () => [const LanguageEntity(lang: 'en')],
    );
  });

  tearDown(() {
    languageCubit.close();
  });
}

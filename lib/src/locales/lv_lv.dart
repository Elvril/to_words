import '../interfaces/locale.dart';
import '../models/currency_options.dart';
import '../models/locale_config.dart';
import '../models/number_word_map.dart';

class LocaleLvLv implements Locale {
  @override
  final LocaleConfig config = const LocaleConfig(
    currency: CurrencyOptions(
      name: 'eiro',
      plural: 'eiro',
      singular: 'eiro',
      symbol: '€',
      fractionalUnit: FractionalUnit(
        name: 'cents',
        singular: 'cents',
        plural: 'centi',
        symbol: '',
      ),
    ),
    texts: LocaleTexts(
      and: 'un',
      minus: 'mīnus',
      only: '',
      point: 'komats',
    ),
    numberWordsMapping: [
      NumberWordMap(number: 1000000000000000, value: 'kvadriljon'),
      NumberWordMap(number: 1000000000000, value: 'triljon'),
      NumberWordMap(number: 1000000000, value: 'miljard'),
      NumberWordMap(
          number: 1000000, value: 'miljoni', singularValue: 'miljons'),
      NumberWordMap(
          number: 1000, value: 'tūkstoši', singularValue: 'tūkstotis'),
      NumberWordMap(number: 900, value: 'deviņi simti'),
      NumberWordMap(number: 800, value: 'astoņi simti'),
      NumberWordMap(number: 700, value: 'septiņi simti'),
      NumberWordMap(number: 600, value: 'seši simti'),
      NumberWordMap(number: 500, value: 'pieci simti'),
      NumberWordMap(number: 400, value: 'četri simti'),
      NumberWordMap(number: 300, value: 'trīs simti'),
      NumberWordMap(number: 200, value: 'divi simti'),
      NumberWordMap(number: 100, value: 'simtu'),
      NumberWordMap(number: 90, value: 'deviņdesmit'),
      NumberWordMap(number: 80, value: 'astoņdesmit'),
      NumberWordMap(number: 70, value: 'septiņdesmit'),
      NumberWordMap(number: 60, value: 'sešdesmit'),
      NumberWordMap(number: 50, value: 'piecdesmit'),
      NumberWordMap(number: 40, value: 'četrdesmit'),
      NumberWordMap(number: 30, value: 'trīsdesmit'),
      NumberWordMap(number: 20, value: 'divdesmit'),
      NumberWordMap(number: 19, value: 'deviņpadsmit'),
      NumberWordMap(number: 18, value: 'astoņpadsmit'),
      NumberWordMap(number: 17, value: 'septiņpadsmit'),
      NumberWordMap(number: 16, value: 'sešpadsmit'),
      NumberWordMap(number: 15, value: 'piecpadsmit'),
      NumberWordMap(number: 14, value: 'četrdpadsmit'),
      NumberWordMap(number: 13, value: 'trīspadsmit'),
      NumberWordMap(number: 12, value: 'divpadsmit'),
      NumberWordMap(number: 11, value: 'vienpadsmit'),
      NumberWordMap(number: 10, value: 'desmit'),
      NumberWordMap(number: 9, value: 'deviņi'),
      NumberWordMap(number: 8, value: 'astoņi'),
      NumberWordMap(number: 7, value: 'septiņi'),
      NumberWordMap(number: 6, value: 'seši'),
      NumberWordMap(number: 5, value: 'pieci'),
      NumberWordMap(number: 4, value: 'četri'),
      NumberWordMap(number: 3, value: 'trīs'),
      NumberWordMap(number: 2, value: 'divi'),
      NumberWordMap(number: 1, value: 'viens'),
      NumberWordMap(number: 0, value: 'nulle'),
    ],
    ignoreOneForWords: [
      'simtu',
      'divi simti',
      'trīs simti',
      'četri simti',
      'pieci simti',
      'seši simti',
      'septiņi simti',
      'astoņi simti',
      'deviņi simti',
    ],
    exactWordsMapping: [NumberWordMap(number: 100, value: 'Simtu')],
    pluralMark: 'i',
    pluralWords: ['kvadriljon', 'triljon', 'miljard'],
  );
}

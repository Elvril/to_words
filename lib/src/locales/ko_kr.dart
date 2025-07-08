import '../interfaces/locale.dart';
import '../models/currency_options.dart';
import '../models/locale_config.dart';
import '../models/number_word_map.dart';

class LocaleKoKr implements Locale {
  @override
  final LocaleConfig config = const LocaleConfig(
    currency: CurrencyOptions(
      name: '원',
      plural: '원',
      singular: '원',
      symbol: '',
      fractionalUnit: FractionalUnit(
        name: '',
        singular: '',
        plural: '',
        symbol: '',
      ),
    ),
    texts: LocaleTexts(
      and: '하고 ',
      minus: '마이너스',
      only: '',
      point: '점',
    ),
    trim: true,
    numberWordsMapping: [
      NumberWordMap(number: 1000000000000, value: '조'),
      NumberWordMap(number: 100000000, value: '억'),
      NumberWordMap(number: 10000, value: '만'),
      NumberWordMap(number: 1000, value: '천'),
      NumberWordMap(number: 100, value: '백'),
      NumberWordMap(number: 90, value: '구십'),
      NumberWordMap(number: 80, value: '팔십'),
      NumberWordMap(number: 70, value: '칠십'),
      NumberWordMap(number: 60, value: '육십'),
      NumberWordMap(number: 50, value: '오십'),
      NumberWordMap(number: 40, value: '사십'),
      NumberWordMap(number: 30, value: '삼십'),
      NumberWordMap(number: 20, value: '이십'),
      NumberWordMap(number: 19, value: '십구'),
      NumberWordMap(number: 18, value: '십팔'),
      NumberWordMap(number: 17, value: '십칠'),
      NumberWordMap(number: 16, value: '십육'),
      NumberWordMap(number: 15, value: '십오'),
      NumberWordMap(number: 14, value: '십사'),
      NumberWordMap(number: 13, value: '십삼'),
      NumberWordMap(number: 12, value: '십이'),
      NumberWordMap(number: 11, value: '십일'),
      NumberWordMap(number: 10, value: '십'),
      NumberWordMap(number: 9, value: '구'),
      NumberWordMap(number: 8, value: '팔'),
      NumberWordMap(number: 7, value: '칠'),
      NumberWordMap(number: 6, value: '육'),
      NumberWordMap(number: 5, value: '오'),
      NumberWordMap(number: 4, value: '사'),
      NumberWordMap(number: 3, value: '삼'),
      NumberWordMap(number: 2, value: '이'),
      NumberWordMap(number: 1, value: '일'),
      NumberWordMap(number: 0, value: '영'),
    ],
  );
}

import '../interfaces/locale.dart';
import '../models/currency_options.dart';
import '../models/locale_config.dart';
import '../models/number_word_map.dart';

class LocaleEnMu implements Locale {
  @override
  final LocaleConfig config = const LocaleConfig(
    currency: CurrencyOptions(
      name: 'Rupee',
      plural: 'Rupees',
      singular: 'Rupee',
      symbol: 'Rs',
      fractionalUnit: FractionalUnit(
        name: 'Cent',
        singular: 'Cent',
        plural: 'Cents',
        symbol: '',
      ),
    ),
    texts: LocaleTexts(
      and: 'And',
      minus: 'Minus',
      only: 'Only',
      point: 'Point',
    ),
    numberWordsMapping: [
      NumberWordMap(number: 10000000, value: 'Crore'),
      NumberWordMap(number: 100000, value: 'Lakh'),
      NumberWordMap(number: 1000, value: 'Thousand'),
      NumberWordMap(number: 100, value: 'Hundred'),
      NumberWordMap(number: 90, value: 'Ninety'),
      NumberWordMap(number: 80, value: 'Eighty'),
      NumberWordMap(number: 70, value: 'Seventy'),
      NumberWordMap(number: 60, value: 'Sixty'),
      NumberWordMap(number: 50, value: 'Fifty'),
      NumberWordMap(number: 40, value: 'Forty'),
      NumberWordMap(number: 30, value: 'Thirty'),
      NumberWordMap(number: 20, value: 'Twenty'),
      NumberWordMap(number: 19, value: 'Nineteen'),
      NumberWordMap(number: 18, value: 'Eighteen'),
      NumberWordMap(number: 17, value: 'Seventeen'),
      NumberWordMap(number: 16, value: 'Sixteen'),
      NumberWordMap(number: 15, value: 'Fifteen'),
      NumberWordMap(number: 14, value: 'Fourteen'),
      NumberWordMap(number: 13, value: 'Thirteen'),
      NumberWordMap(number: 12, value: 'Twelve'),
      NumberWordMap(number: 11, value: 'Eleven'),
      NumberWordMap(number: 10, value: 'Ten'),
      NumberWordMap(number: 9, value: 'Nine'),
      NumberWordMap(number: 8, value: 'Eight'),
      NumberWordMap(number: 7, value: 'Seven'),
      NumberWordMap(number: 6, value: 'Six'),
      NumberWordMap(number: 5, value: 'Five'),
      NumberWordMap(number: 4, value: 'Four'),
      NumberWordMap(number: 3, value: 'Three'),
      NumberWordMap(number: 2, value: 'Two'),
      NumberWordMap(number: 1, value: 'One'),
      NumberWordMap(number: 0, value: 'Zero'),
    ],
    exactWordsMapping: [NumberWordMap(number: 100, value: 'One Hundred')],
  );
}

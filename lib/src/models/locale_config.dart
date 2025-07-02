import 'currency_options.dart';
import 'number_word_map.dart';

class LocaleConfig {
  final CurrencyOptions currency;
  final LocaleTexts texts;
  final List<NumberWordMap> numberWordsMapping;
  final List<NumberWordMap>? exactWordsMapping;
  final bool namedLessThan1000;
  final String? splitWord;
  final bool ignoreZeroInDecimals;
  final Map<int, String>? decimalLengthWordMapping;
  final List<String>? ignoreOneForWords;
  final String? pluralMark;
  final List<String>? pluralWords;
  final List<String>? noSplitWordAfter;
  final bool onlyInFront;
  final bool trim;

  const LocaleConfig({
    required this.currency,
    required this.texts,
    required this.numberWordsMapping,
    this.exactWordsMapping,
    this.namedLessThan1000 = false,
    this.splitWord,
    this.ignoreZeroInDecimals = false,
    this.decimalLengthWordMapping,
    this.ignoreOneForWords,
    this.pluralMark,
    this.pluralWords,
    this.noSplitWordAfter,
    this.onlyInFront = false,
    this.trim = false,
  });
}

class LocaleTexts {
  final String and;
  final String minus;
  final String only;
  final String point;

  const LocaleTexts(
      {required this.and,
      required this.minus,
      required this.only,
      required this.point});
}

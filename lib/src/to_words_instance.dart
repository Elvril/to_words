import 'package:collection/collection.dart';

import 'interfaces/locale.dart';
import 'locales/locales.dart';
import 'models/converter_options.dart';
import 'models/number_word_map.dart';
import 'models/to_words_options.dart';

class ToWords {
  final ToWordsOptions options;
  late final Locale _locale;

  ToWords({this.options = const ToWordsOptions()}) {
    _locale = _getLocale();
  }

  Locale _getLocale() {
    final locale = locales[options.localeCode.toLowerCase()];
    if (locale == null) {
      throw UnimplementedError(
          'Locale "${options.localeCode}" is not supported.');
    }
    return locale;
  }

  String convert(num number, {ConverterOptions? options}) {
    final converterOptions = options ?? this.options.converterOptions;

    if (!isValidNumber(number)) {
      throw ArgumentError.value(number, 'number', 'Is not a valid number');
    }

    if (converterOptions.ignoreDecimal) {
      number = number.truncate();
    }

    List<String> words = [];
    if (converterOptions.currency) {
      words = _convertCurrency(number, converterOptions);
    } else {
      words = _convertNumber(number);
    }

    return _locale.config.trim ? words.join() : words.join(' ').trim();
  }

  List<String> _convertNumber(num number) {
    final isNegativeNumber = number < 0;
    if (isNegativeNumber) {
      number = number.abs();
    }

    final parts = number.toString().split('.');
    final intPart = int.parse(parts[0]);

    List<String> words = _convertInternal(intPart);

    final List<String> wordsWithDecimal = [];
    if (isFloat(number)) {
      // For any decimal number, we add the point separator. The integer part
      // (e.g., "Zero") is now handled correctly above.
      wordsWithDecimal.add(_locale.config.texts.point);
      final String decimalPart = parts.length > 1 ? parts[1] : '';
      if (decimalPart.startsWith('0') &&
          _locale.config.decimalLengthWordMapping == null) {
        final zeroWords = <String>[];
        for (final numChar in decimalPart.split('')) {
          zeroWords.addAll(_convertInternal(int.parse(numChar)));
        }
        wordsWithDecimal.addAll(zeroWords);
      } else {
        wordsWithDecimal.addAll(_convertInternal(int.parse(decimalPart)));
        final decimalLengthWord =
            _locale.config.decimalLengthWordMapping?[decimalPart.length];
        if (decimalLengthWord != null) {
          wordsWithDecimal.add(decimalLengthWord);
        }
      }
    }

    if (words.isNotEmpty && isNegativeNumber) {
      words.insert(0, _locale.config.texts.minus);
    }

    words.addAll(wordsWithDecimal);
    return words;
  }

  List<String> _convertCurrency(num number, ConverterOptions options) {
    final currencyOptions = options.currencyOptions ?? _locale.config.currency;

    final isNegativeNumber = number < 0;
    if (isNegativeNumber) {
      number = number.abs();
    }

    number = toFixed(number);
    final parts = number.toString().split('.');
    final intPart = int.parse(parts[0]);

    List<String> words = _convertInternal(intPart);

    if (intPart == 1 && currencyOptions.singular != null) {
      words.add(currencyOptions.singular!);
    } else {
      words.add(currencyOptions.plural);
    }

    final ignoreZero = isNumberZero(number) &&
        (options.ignoreZeroCurrency ||
            (_locale.config.ignoreZeroInDecimals && number != 0));

    if (ignoreZero) {
      words = [];
    }

    final List<String> wordsWithDecimal = [];
    if (isFloat(number)) {
      if (!ignoreZero) {
        wordsWithDecimal.add(_locale.config.texts.and);
      }
      String decimalPartStr = parts.length > 1 ? parts[1] : '0';
      // Pad with zeros to get 2 decimal places
      if (decimalPartStr.length == 1) {
        decimalPartStr += '0';
      }
      final decimalPart = int.parse(decimalPartStr);

      if (decimalPart > 0) {
        wordsWithDecimal.addAll(_convertInternal(decimalPart));

        final decimalLengthWord =
            _locale.config.decimalLengthWordMapping?[decimalPartStr.length];
        if (decimalLengthWord != null) {
          wordsWithDecimal.add(decimalLengthWord);
        }

        if (decimalPart == 1 &&
            currencyOptions.fractionalUnit.singular != null) {
          wordsWithDecimal.add(currencyOptions.fractionalUnit.singular!);
        } else {
          wordsWithDecimal.add(currencyOptions.fractionalUnit.plural);
        }
      }
    }

    final bool isEmpty = words.isEmpty && wordsWithDecimal.isEmpty;
    if (!isEmpty && isNegativeNumber) {
      words.insert(0, _locale.config.texts.minus);
    }

    if (!isEmpty &&
        _locale.config.texts.only.isNotEmpty &&
        !options.doNotAddOnly &&
        !_locale.config.onlyInFront) {
      wordsWithDecimal.add(_locale.config.texts.only);
    }

    if (wordsWithDecimal.isNotEmpty) {
      words.addAll(wordsWithDecimal);
    }

    if (!isEmpty && !options.doNotAddOnly && _locale.config.onlyInFront) {
      words.insert(0, _locale.config.texts.only);
    }

    return words;
  }

  List<String> _convertInternal(int number, {bool trailing = false}) {
    final config = _locale.config;

    final exactMatch = config.exactWordsMapping
        ?.firstWhereOrNull((elem) => number == elem.number);
    if (exactMatch != null) {
      if (exactMatch.value is List<String>) {
        return [trailing ? exactMatch.value[1] : exactMatch.value[0]];
      }
      return [exactMatch.value as String];
    }

    final match = config.numberWordsMapping.firstWhere(
        (elem) => number >= elem.number,
        orElse: () => const NumberWordMap(number: 0, value: ''));

    // This condition is met if the input `number` is 0 and was not found
    // in the `exactWordsMapping` at the top of the function.
    if (match.number == 0) {
      // We provide a hardcoded fallback to prevent an empty output.
      return ['Zero'];
    }

    final List<String> words = [];
    // By changing to `< 100`, we ensure that 100 is handled by the recursive
    // logic below, which correctly prepends "One" to "Hundred". This also
    // makes the logic consistent for all scale numbers (100, 1000, etc.).
    if (number < 100 || (number < 1000 && config.namedLessThan1000)) {
      words.add(match.value is List<String> ? match.value[0] : match.value);
      number -= match.number;
      if (number > 0) {
        if (config.splitWord != null && config.splitWord!.isNotEmpty) {
          words.add(config.splitWord!);
        }
        words.addAll(_convertInternal(number, trailing: trailing));
      }
      return words;
    }

    final quotient = (number / match.number).floor();
    final remainder = number % match.number;
    String matchValue =
        match.value is List<String> ? match.value[0] : match.value;

    if (quotient > 1 &&
        (config.pluralWords?.contains(matchValue) ?? false) &&
        config.pluralMark != null) {
      matchValue += config.pluralMark!;
    }

    if (quotient % 10 == 1 && match.singularValue != null) {
      matchValue = match.singularValue!;
    }

    if (quotient == 1 &&
        (config.ignoreOneForWords?.contains(matchValue) ?? false)) {
      words.add(matchValue);
    } else {
      words.addAll(_convertInternal(quotient));
      words.add(matchValue);
    }

    if (remainder > 0) {
      if (config.splitWord != null && config.splitWord!.isNotEmpty) {
        if (!(config.noSplitWordAfter?.contains(matchValue) ?? false)) {
          words.add(config.splitWord!);
        }
      }
      words.addAll(_convertInternal(remainder, trailing: trailing));
    }

    return words;
  }

  num toFixed(num number, [int precision = 2]) {
    return num.parse(number.toStringAsFixed(precision));
  }

  bool isFloat(num number) => number % 1 != 0;

  bool isValidNumber(num number) => !number.isInfinite && !number.isNaN;

  bool isNumberZero(num number) => number >= 0 && number < 1;
}

import 'package:to_words/to_words.dart';

void main() {
  print('--- Number Conversion ---');

  print('100         -> ${toWords(100)}');
  print('12345.67    -> ${toWords(12345.67)}');
  print('0.67    -> ${toWords(0.67)}');
  print('-0.67    -> ${toWords(-0.67)}');
  print('-50         -> ${toWords(-50)}');
  print('1000000     -> ${toWords(1000000)}');

  print('--- Number Conversion in French (fr-FR) ---');
  print(
      '123         -> ${toWords(123, options: ToWordsOptions(localeCode: 'fr-FR', converterOptions: ConverterOptions(currency: false)))}');

  print('\n--- Currency Conversion (fr-FR) ---');
  final currencyOptionsFr = const ToWordsOptions(
    localeCode: 'fr-FR',
    converterOptions: ConverterOptions(currency: true),
  );
  print('1.00        -> ${toWords(1, options: currencyOptionsFr)}');
  print('100.00        -> ${toWords(100.00, options: currencyOptionsFr)}');
  print('1.01        -> ${toWords(1.01, options: currencyOptionsFr)}');
  print('15.50       -> ${toWords(15.50, options: currencyOptionsFr)}');
  print('1234567.89  -> ${toWords(1234567.89, options: currencyOptionsFr)}');

  print('\n--- Currency Conversion (fr-FR) ignoring the zero ---');
  print('0.15        -> ${toWords(0.15, options: ToWordsOptions(
        localeCode: 'fr-FR',
        converterOptions:
            ConverterOptions(currency: true, ignoreZeroCurrency: true),
      ))}');

  print('\n--- Currency Conversion (en-AE) ---');
  final currencyOptionsOM = const ToWordsOptions(
    localeCode: 'en-AE',
    converterOptions: ConverterOptions(currency: true),
  );
  print('45.750      -> ${toWords(45.750, options: currencyOptionsOM)}');
}

import 'package:to_words/to_words.dart';

void main() {
  print('--- Number Conversion ---');
  print('123         -> ${toWords(123)}');
  print('12345.67    -> ${toWords(12345.67)}');
  print('-50         -> ${toWords(-50)}');
  print('1000000     -> ${toWords(1000000)}');

  print('\n--- Currency Conversion (en-AE) ---');
  final currencyOptionsAE = const ToWordsOptions(
    localeCode: 'en-om',
    converterOptions: ConverterOptions(currency: true),
  );
  print('1.00        -> ${toWords(1, options: currencyOptionsAE)}');
  print('1.01        -> ${toWords(1.01, options: currencyOptionsAE)}');
  print('15.50       -> ${toWords(15.50, options: currencyOptionsAE)}');
  print('1234567.89  -> ${toWords(1234567.89, options: currencyOptionsAE)}');

  print('\n--- Currency Conversion (en-OM) ---');
  final currencyOptionsOM = const ToWordsOptions(
    localeCode: 'en-om',
    converterOptions: ConverterOptions(currency: true),
  );
  print('45.750      -> ${toWords(45.750, options: currencyOptionsOM)}');
}

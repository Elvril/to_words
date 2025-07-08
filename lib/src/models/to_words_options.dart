import 'converter_options.dart';

class ToWordsOptions {
  final String localeCode;
  final ConverterOptions converterOptions;

  const ToWordsOptions({
    this.localeCode = 'en-us',
    this.converterOptions = const ConverterOptions(),
  });
}

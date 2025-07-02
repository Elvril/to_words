import 'currency_options.dart';

class ConverterOptions {
  final bool currency;
  final bool ignoreDecimal;
  final bool ignoreZeroCurrency;
  final bool doNotAddOnly;
  final CurrencyOptions? currencyOptions;

  const ConverterOptions({
    this.currency = false,
    this.ignoreDecimal = false,
    this.ignoreZeroCurrency = false,
    this.doNotAddOnly = false,
    this.currencyOptions,
  });
}

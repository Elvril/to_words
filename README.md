# to_words

[![pub package](https://img.shields.io/pub/v/to_words.svg)](https://pub.dev/packages/to_words)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A Dart port of the popular `to-words` JavaScript library for converting numbers (including decimals) into words with multi-locale and currency support. Ideal for invoicing, e-commerce, and financial apps.

## Features

* **Number to Words**: Convert integers and decimals to text.
* **Currency Support**: Easily handle conversions with locale-specific currency options.
* **Multi-Locale**: Supports multiple languages and regions.
* **Highly Configurable**: Tailor conversion rules to your needs.
* **Written in Dart**: Modern, fast, and cross-platform.
* **Well-tested**: Ensuring reliability and accuracy.

## Use Cases

* **Financial Applications**: Generate amount-in-words for invoices or cheques.
* **E-commerce Platforms**: Display totals in words for user receipts.
* **Educational Tools**: Teach number systems through text conversions.
* **Localization**: Support multiple languages and currencies seamlessly.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  to_words: ^0.2.0
```

Then run `dart pub get` or `flutter pub get`.

## Usage

Import the library:

```dart
import 'package:to_words/to_words.dart';
```

The `toWords` function is highly configurable through the `ToWordsOptions` and `ConverterOptions` classes.

### Basic Conversion

```dart
void main() {
  // Simple number to words
  print(toWords(123));
  // > One Hundred Twenty Three

  // Number with a decimal part
  print(toWords(123.45));
  // > One Hundred Twenty Three Point Four Five

  // Decimal part starting with zero
  print(toWords(123.045));
  // > One Hundred Twenty Three Point Zero Four Five
  // Note: When the fractional part starts with zero, the digits are converted individually.

  // Negative number
  print(toWords(-123.45));
  // > Minus One Hundred Twenty Three Point Four Five
}
```

### Currency Conversion

To convert a number to currency words, set `currency: true`.

```dart
void main() {
  final currencyOptions = const ToWordsOptions(
    converterOptions: ConverterOptions(
      currency: true,
    ),
  );

  print(toWords(452, options: currencyOptions));
  // > Four Hundred Fifty Two Dollars Only

  print(toWords(452.36, options: currencyOptions));
  // > Four Hundred Fifty Two Dollars And Thirty Six Cents Only

  // Ignore the decimal part
  final ignoreDecimalOptions = const ToWordsOptions(
    converterOptions: ConverterOptions(
      currency: true,
      ignoreDecimal: true,
    ),
  );
  print(toWords(452.36, options: ignoreDecimalOptions));
  // > Four Hundred Fifty Two Dollars Only

  // Ignore the currency if it's zero
  final ignoreZeroOptions = const ToWordsOptions(
    converterOptions: ConverterOptions(
      currency: true,
      ignoreZeroCurrency: true,
    ),
  );
  print(toWords(0.57, options: ignoreZeroOptions));
  // > Fifty Seven Cents Only

  // Do not add "Only" at the end
  final noOnlyOptions = const ToWordsOptions(
    converterOptions: ConverterOptions(
      currency: true,
      doNotAddOnly: true,
    ),
  );
  print(toWords(100, options: noOnlyOptions));
  // > One Hundred Dollars
}
```

### Locale and Custom Currency

Specify a locale or override default currency settings.

```dart
void main() {
  // Use a different locale (example for a future implementation)
  // final ptBrOptions = const ToWordsOptions(localeCode: 'pt-BR');
  // print(toWords(13, options: ptBrOptions));
  // > Treze

  // Override default currency options for the 'en-US' locale
  final euroOptions = const ToWordsOptions(
    converterOptions: ConverterOptions(
      currency: true,
      currencyOptions: CurrencyOptions(
        name: 'Euro',
        plural: 'Euros',
        symbol: '€',
        fractionalUnit: FractionalUnit(
          name: 'Cent',
          plural: 'Cents',
          symbol: '¢',
        ),
      ),
    ),
  );
  print(toWords(123.45, options: euroOptions));
  // > One Hundred Twenty Three Euros And Forty Five Cents Only
}
```

## Configuration Options

| Option             | Type            | Default | Description                                                                                                                    |
| ------------------ | --------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------ |
| localeCode         | String          | 'en-US' | Locale code to define the language and formatting.                                                                             |
| currency           | bool            | false   | Whether to format the number as currency.                                                                                      |
| ignoreDecimal      | bool            | false   | Ignore the fractional unit of a number.                                                                                        |
| ignoreZeroCurrency | bool            | false   | When set to true, ignores the main currency if zero. Example: 0.50 => 'Fifty Cents' instead of 'Zero Dollars and Fifty Cents'. |
| doNotAddOnly       | bool            | false   | Prevents adding the word "Only" at the end of currency output.                                                                 |
| currencyOptions    | CurrencyOptions | null    | Override default currency for a locale. Allows changing the name, symbol, and fractional unit while keeping locale language.   |

## Supported Locales

| Country            | Language   | Locale |
| ------------------ | ---------- | ------ |
| India              | Bengali    | bn-IN  |
| Estonia            | Estonian   | ee-EE  |
| UAE                | English    | en-AE  |
| OMR                | English    | en-OM  |
| Bangladesh         | English    | en-BD  |
| UK                 | English    | en-GB  |
| Ghana              | English    | en-GH  |
| Ireland            | English    | en-IE  |
| India              | English    | en-IN  |
| Myanmar            | English    | en-MM  |
| Mauritius          | English    | en-MU  |
| Nigeria            | English    | en-NG  |
| Nepal              | English    | en-NP  |
| USA                | English    | en-US  |
| Philippines        | English    | en-PH  |
| Argentina          | Spanish    | es-AR  |
| España             | Spanish    | es-ES  |
| Mexico             | Spanish    | es-MX  |
| Venezuela          | Spanish    | es-VE  |
| Iran               | Persian    | fa-IR  |
| Belgium            | French     | fr-BE  |
| France             | French     | fr-FR  |
| India              | Gujarati   | gu-IN  |
| India              | Hindi      | hi-IN  |
| India              | Kannada    | kn-IN  |
| Korea, Republic of | Hangul     | ko-KR  |
| Latvia             | Latvian    | lv-LV  |
| India              | Marathi    | mr-IN  |
| Suriname           | Dutch      | nl-SR  |
| Nepal              | Nepali     | np-NP  |
| Brazil             | Portuguese | pt-BR  |
| Turkey             | Turkish    | tr-TR  |
| Pakistan           | Urdu       | ur-PK  |

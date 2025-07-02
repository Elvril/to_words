# to_words (Dart)

A Dart port of the popular `to-words` JavaScript library for converting numbers to words.

## Features

- Convert numbers (integers and decimals) to words and currency.
- Extensible design to support multiple locales.
- Full support for currency, decimals, and negative numbers.
- Currently supports US English (`en-US`).

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  to_words: ^0.1.0
```

Then run `dart pub get` or `flutter pub get`.

## Usage

Import the library and use the `toWords` function.

```dart
import 'package:to_words/to_words.dart';

void main() {
  // Simple number conversion
  print(toWords(123)); 
  // > One Hundred Twenty Three

  // Currency conversion
  print(toWords(1234.56,
    options: const ToWordsOptions(
      converterOptions: ConverterOptions(
        currency: true,
      ),
    ),
  ));
  // > One Thousand Two Hundred Thirty Four Dollars And Fifty Six Cents
}
```
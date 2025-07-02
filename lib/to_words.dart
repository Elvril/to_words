library to_words;

import 'src/models/to_words_options.dart';
import 'src/to_words_instance.dart';

export 'src/models/converter_options.dart';
export 'src/models/currency_options.dart';
export 'src/models/to_words_options.dart';

/// A convenience function for the `ToWords` class.
///
/// Converts a [number] to words, with optional [options].
///
/// Example:
/// ```dart
/// print(toWords(123)); // 'One Hundred Twenty Three'
///
/// print(toWords(123.45,
///   options: ToWordsOptions(
///     localeCode: 'en-US',
///     converterOptions: ConverterOptions(
///       currency: true,
///     ),
///   ),
/// )); // 'One Hundred Twenty Three Dollars And Forty Five Cents'
/// ```
String toWords(num number, {ToWordsOptions? options}) {
  final toWords = ToWords(options: options ?? const ToWordsOptions());
  return toWords.convert(number);
}

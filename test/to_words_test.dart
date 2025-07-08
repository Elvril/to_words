import 'package:test/test.dart';
import 'package:to_words/to_words.dart';

/// This is a comprehensive test suite for the `to_words` package,
/// covering all supported locales and various conversion options.
void main() {
  group('Error Handling', () {
    test('throws error for unsupported locale', () {
      const options = ToWordsOptions(localeCode: 'xx-XX');
      expect(() => toWords(1, options: options),
          throwsA(isA<UnimplementedError>()));
    });

    test('throws error for invalid numbers', () {
      expect(() => toWords(double.nan), throwsA(isA<ArgumentError>()));
      expect(() => toWords(double.infinity), throwsA(isA<ArgumentError>()));
      expect(() => toWords(double.negativeInfinity),
          throwsA(isA<ArgumentError>()));
    });
  });

  group('Locale: en-US (Default)', () {
    const localeCode = 'en-US';
    const options = ToWordsOptions(
        localeCode: localeCode, converterOptions: ConverterOptions());

    test('converts integers', () {
      expect(toWords(0, options: options), equals('Zero'));
      expect(
          toWords(137, options: options), equals('One Hundred Thirty Seven'));
      expect(toWords(792581, options: options),
          equals('Seven Hundred Ninety Two Thousand Five Hundred Eighty One'));
      expect(
          toWords(9876543210, options: options),
          equals(
              'Nine Billion Eight Hundred Seventy Six Million Five Hundred Forty Three Thousand Two Hundred Ten'));
    });

    test('converts negative integers', () {
      expect(toWords(-137, options: options),
          equals('Minus One Hundred Thirty Seven'));
    });

    test('converts decimals', () {
      expect(
          toWords(0.04,
              options: ToWordsOptions(
                  localeCode: localeCode,
                  converterOptions: ConverterOptions())),
          equals('Zero Point Zero Four'));
      expect(toWords(37.68, options: options),
          equals('Thirty Seven Point Sixty Eight'));
    });

    group('with currency', () {
      const currencyOptions = ToWordsOptions(
        localeCode: localeCode,
        converterOptions: ConverterOptions(currency: true),
      );
      const ignoreZeroOptions = ToWordsOptions(
        localeCode: localeCode,
        converterOptions:
            ConverterOptions(currency: true, ignoreZeroCurrency: true),
      );
      const ignoreDecimalOptions = ToWordsOptions(
        localeCode: localeCode,
        converterOptions: ConverterOptions(currency: true, ignoreDecimal: true),
      );

      test('converts currency values', () {
        expect(toWords(1, options: currencyOptions), equals('One Dollar Only'));
        expect(toWords(37.68, options: currencyOptions),
            equals('Thirty Seven Dollars And Sixty Eight Cents Only'));
        expect(toWords(0.999, options: currencyOptions),
            equals('One Dollar Only'));
      });

      test('with ignoreZeroCurrency', () {
        expect(toWords(0.50, options: ignoreZeroOptions),
            equals('Fifty Cents Only'));
        expect(toWords(0, options: ignoreZeroOptions), equals(''));
      });

      test('with ignoreDecimal', () {
        expect(toWords(452.36, options: ignoreDecimalOptions),
            equals('Four Hundred Fifty Two Dollars Only'));
      });
    });
  });

  group('Locale: en-IN', () {
    const localeCode = 'en-IN';
    const options = ToWordsOptions(localeCode: localeCode);
    const currencyOptions = ToWordsOptions(
      localeCode: localeCode,
      converterOptions: ConverterOptions(currency: true),
    );

    test('converts integers using Indian numbering system', () {
      expect(toWords(792581, options: options),
          equals('Seven Lakh Ninety Two Thousand Five Hundred Eighty One'));
      expect(
          toWords(86429753, options: options),
          equals(
              'Eight Crore Sixty Four Lakh Twenty Nine Thousand Seven Hundred Fifty Three'));
    });

    test('converts currency', () {
      expect(toWords(37.68, options: currencyOptions),
          equals('Thirty Seven Rupees And Sixty Eight Paise Only'));
    });
  });

  group('Locale: fr-fr', () {
    const localeCode = 'fr-fr';
    const options = ToWordsOptions(localeCode: localeCode);
    const currencyOptions = ToWordsOptions(
      localeCode: localeCode,
      converterOptions: ConverterOptions(currency: true),
    );

    test('converts integers', () {
      expect(toWords(63892, options: options),
          equals('Soixante-Trois Mille Huit Cent Quatre-Vingt-Douze'));
    });

    test('converts currency', () {
      expect(toWords(37.68, options: currencyOptions),
          equals('Trente-Sept Euros Et Soixante-Huit Centimes'));
    });
  });

  group('Locale: fr-BE', () {
    const localeCode = 'fr-BE';
    const options = ToWordsOptions(localeCode: localeCode);

    test('converts integers with Belgian-French words', () {
      expect(toWords(63892, options: options),
          equals('Soixante-Trois Mille Huit Cent Nonante-Deux'));
    });
  });

  group('Locale: es-ES', () {
    const localeCode = 'es-ES';
    const options = ToWordsOptions(localeCode: localeCode);
    const currencyOptions = ToWordsOptions(
      localeCode: localeCode,
      converterOptions: ConverterOptions(currency: true),
    );

    test('converts integers', () {
      expect(toWords(137, options: options), equals('Ciento Treinta Y Siete'));
    });

    test('converts currency', () {
      expect(toWords(37.68, options: currencyOptions),
          equals('Treinta Y Siete Euros Y Sesenta Y Ocho Centimos'));
    });
  });

  group('Locale: pt-BR', () {
    const localeCode = 'pt-BR';
    const options = ToWordsOptions(localeCode: localeCode);
    const currencyOptions = ToWordsOptions(
      localeCode: localeCode,
      converterOptions: ConverterOptions(currency: true),
    );

    test('converts integers', () {
      expect(toWords(137, options: options), equals('Cento E Trinta E Sete'));
    });

    test('converts currency', () {
      expect(toWords(37.68, options: currencyOptions),
          equals('Trinta E Sete Reais E Sessenta E Oito Centavos'));
    });
  });

  group('Locale: hi-IN', () {
    const localeCode = 'hi-IN';
    const options = ToWordsOptions(localeCode: localeCode);
    const currencyOptions = ToWordsOptions(
      localeCode: localeCode,
      converterOptions: ConverterOptions(currency: true),
    );

    test('converts integers', () {
      expect(toWords(792581, options: options),
          equals('सात लाख बानवे हज़ार पांच सौ इक्यासी'));
    });

    test('converts currency', () {
      expect(toWords(37.68, options: currencyOptions),
          equals('सैंतीस रुपये और अड़सठ पैसे'));
    });
  });

  group('Locale: bn-IN', () {
    const localeCode = 'bn-IN';
    const options = ToWordsOptions(localeCode: localeCode);
    const currencyOptions = ToWordsOptions(
      localeCode: localeCode,
      converterOptions: ConverterOptions(currency: true),
    );

    test('converts integers', () {
      expect(toWords(792581, options: options),
          equals('সাত লাখ বিরানব্বই হাজার পাঁচ শত একাশী'));
    });

    test('converts currency', () {
      expect(toWords(37.68, options: currencyOptions),
          equals('সাঁইত্রিশ টাকা এবং অষ্টষষ্টি পয়সা'));
    });
  });

  group('Locale: fa-IR', () {
    const localeCode = 'fa-IR';
    const options = ToWordsOptions(localeCode: localeCode);
    const currencyOptions = ToWordsOptions(
      localeCode: localeCode,
      converterOptions: ConverterOptions(currency: true),
    );

    test('converts integers', () {
      expect(toWords(792581, options: options),
          equals('هفتصد و نود و دو هزار و پانصد و هشتاد و یک'));
    });
    test('converts integers with decimal', () {
      expect(toWords(324.32, options: options),
          equals('سیصد و بیست و چهار و سی و دو صدم'));
    });

    test('converts currency', () {
      expect(toWords(37.68, options: currencyOptions),
          equals('سی و هفت  و شصت و هشت صدم تومان'));
    });
  });

  group('Locale: ur-PK', () {
    const localeCode = 'ur-PK';
    const options = ToWordsOptions(localeCode: localeCode);
    const currencyOptions = ToWordsOptions(
      localeCode: localeCode,
      converterOptions: ConverterOptions(currency: true),
    );

    test('converts integers', () {
      expect(toWords(792581, options: options),
          equals('سات لاکھ بانوے ہزار پانچ سو اکیاسی'));
    });

    test('converts currency', () {
      expect(toWords(37.68, options: currencyOptions),
          equals('سینتیس روپے اور اڑسٹھ پیسے صرف'));
    });
  });

  group('Locale: tr-TR', () {
    const localeCode = 'tr-TR';
    const options = ToWordsOptions(localeCode: localeCode);
    const currencyOptions = ToWordsOptions(
      localeCode: localeCode,
      converterOptions: ConverterOptions(currency: true),
    );

    test('converts integers', () {
      expect(toWords(792581, options: options),
          equals('yedi yüz doksan iki bin beş yüz seksen bir'));
    });

    test('converts currency', () {
      expect(toWords(37.68, options: currencyOptions),
          equals('otuz yedi  virgül altmış sekiz yüzüncü lira'));
    });
  });

  group('Locale: ko-KR', () {
    const localeCode = 'ko-KR';
    const options = ToWordsOptions(localeCode: localeCode);
    const currencyOptions = ToWordsOptions(
      localeCode: localeCode,
      converterOptions: ConverterOptions(currency: true),
    );

    test('converts integers', () {
      expect(toWords(792581, options: options), equals('칠십구만이천오백팔십일'));
    });

    test('converts currency', () {
      // Korean currency does not use fractional units
      expect(toWords(3768, options: currencyOptions), equals('삼천칠백육십팔원'));
    });
  });
}

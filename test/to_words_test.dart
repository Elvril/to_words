import 'package:test/test.dart';
import 'package:to_words/to_words.dart';

void main() {
  group('toWords in English', () {
    test('converts zero', () {
      expect(toWords(0), equals('zero'));
    });

    test('converts single-digit numbers', () {
      expect(toWords(5), equals('five'));
    });

    test('converts teen numbers', () {
      expect(toWords(17), equals('seventeen'));
    });

    test('converts two-digit numbers', () {
      expect(toWords(42), equals('forty-two'));
      expect(toWords(90), equals('ninety'));
    });

    test('converts three-digit numbers', () {
      expect(toWords(100), equals('one hundred'));
      expect(toWords(123), equals('one hundred twenty-three'));
      expect(toWords(999), equals('nine hundred ninety-nine'));
    });

    test('converts large numbers', () {
      expect(toWords(1000), equals('one thousand'));
      expect(
        toWords(12345),
        equals('twelve thousand three hundred forty-five'),
      );
      expect(toWords(1000000), equals('one million'));
      expect(toWords(1001001), equals('one million one thousand one'));
    });

    test('converts negative numbers', () {
      expect(toWords(-3), equals('minus three'));
    });

    test('converts numbers with decimals', () {
      expect(toWords(12.34), equals('twelve and point three four'));
      expect(toWords(0.5), equals('zero and point five'));
    });
  });
}

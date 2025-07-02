import '../interfaces/locale.dart';
import 'en_ae.dart';
import 'en_om.dart';
import 'en_us.dart';

final Map<String, Locale> locales = {
  'en-us': LocaleEnUs(),
  'en-ae': LocaleEnAe(),
  'en-om': LocaleEnOm(),
  // TODO: Add other locales here
  // 'fr-fr': LocaleFrFr(),
};

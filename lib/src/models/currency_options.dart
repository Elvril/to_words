class CurrencyOptions {
  final String name;
  final String plural;
  final String? singular;
  final String symbol;
  final FractionalUnit fractionalUnit;

  const CurrencyOptions({
    required this.name,
    required this.plural,
    this.singular,
    required this.symbol,
    required this.fractionalUnit,
  });
}

class FractionalUnit {
  final String name;
  final String plural;
  final String? singular;
  final String symbol;

  const FractionalUnit(
      {required this.name,
      required this.plural,
      this.singular,
      required this.symbol});
}

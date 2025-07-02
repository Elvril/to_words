class NumberWordMap {
  final int number;
  final dynamic value; // Can be String or List<String>
  final String? singularValue;

  const NumberWordMap({
    required this.number,
    required this.value,
    this.singularValue,
  });
}

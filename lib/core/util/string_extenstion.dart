extension StringExtenstion on String? {
  String get money {
    if (this == null || this!.isEmpty) return '0.00';
    final double value = double.tryParse(this!) ?? 0.0;
    return value.toStringAsFixed(2);
  }
}

extension StringExtenstion on String? {
  String get money {
    if (this == null || this!.isEmpty) return '0.00';
    final double value = double.tryParse(this!) ?? 0.0;
    return _formatWithCommas(value.toStringAsFixed(2));
  }

  String _formatWithCommas(String value) {
    final parts = value.split('.');
    final integer = parts[0];
    final buffer = StringBuffer();
    for (int i = 0; i < integer.length; i++) {
      int position = integer.length - i;
      buffer.write(integer[i]);
      if (position > 1 && position % 3 == 1) {
        buffer.write(',');
      }
    }
    final formattedInt = buffer.toString();
    return parts.length > 1 ? '$formattedInt.${parts[1]}' : formattedInt;
  }
}

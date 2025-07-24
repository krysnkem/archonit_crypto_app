import 'package:flutter/material.dart';

class CryptoAsset {
  final Color color;
  final String id;
  final String name;
  final String symbol;
  final String price;

  CryptoAsset({
    required this.color,
    required this.id,
    required this.name,
    required this.symbol,
    required this.price,
  });
}

import 'package:archonit_crypto_app/core/util/text_styles.dart';
import 'package:flutter/material.dart';

class AssetListItemWidget extends StatelessWidget {
  const AssetListItemWidget({
    super.key,
    required this.assetId,
    required this.assetName,
    required this.assetSymbol,
    required this.assetPrice,
    required this.assetColor,
  });
  final String assetId;
  final String assetName;
  final String assetSymbol;
  final String assetPrice;
  final Color assetColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: assetColor,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              '$assetName($assetSymbol)',
              style: sfProText17600TextBlack,
            ),
          ),

          Text(assetPrice, style: sfProText17600TextBlack),
        ],
      ),
    );
  }
}

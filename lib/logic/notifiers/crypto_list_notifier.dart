import 'package:archonit_crypto_app/core/util/color_generator.dart';
import 'package:archonit_crypto_app/data/api/coincap_api_client.dart';
import 'package:archonit_crypto_app/data/api/coincap_api_models.dart';
import 'package:archonit_crypto_app/data/repository/coin_cap_repository/coin_cap_repository.dart';
import 'package:archonit_crypto_app/data/repository/coin_cap_repository/i_coin_cap_repository.dart';
import 'package:archonit_crypto_app/data/repository/result.dart';
import 'package:archonit_crypto_app/logic/models/crypto_asset.dart';
import 'package:archonit_crypto_app/logic/states/crypto_list_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class CryptoListNotifier extends ValueNotifier<CryptoListState> {
  CryptoListNotifier({required ICoinCapRepository coinCapRepository})
    : _coinCapRepository = coinCapRepository,
      super(CryptoListInitial());

  final ICoinCapRepository _coinCapRepository;

  Future<void> loadAssets() async {
    value = CryptoListLoading();
    final result = await _coinCapRepository.getAssets(AssetsQuery());
    switch (result) {
      case Success<AssetsListResponse>(:final data):
        if (data == null || data.data?.isEmpty == true) {
          value = CryptoListError(message: 'No assets found.');
          return;
        }
        final List<CryptoAsset> cryptoAssets = [];
        for (final asset in data.data!) {
          Color color = ColorGenerator.generateColor();
          final existingEntry = cryptoAssets.indexWhere(
            (cryptoAsset) => cryptoAsset.id == asset.id,
          );
          if (existingEntry != -1) {
            color = cryptoAssets[existingEntry].color;
          }
          cryptoAssets.add(
            CryptoAsset(
              color: color,
              id: asset.id ?? '',
              name: asset.name ?? '',
              symbol: asset.symbol ?? '',
            ),
          );
        }
        value = CryptoListLoaded(cryptoList: cryptoAssets);
        break;
      case Failure(:final message):
        value = CryptoListError(message: message, cryptoList: value.cryptoList);
        break;
    }
  }
}

final cryptoListValuNotifier = CryptoListNotifier(
  coinCapRepository: CoinCapRepository(createCoinCapApiClient()),
);

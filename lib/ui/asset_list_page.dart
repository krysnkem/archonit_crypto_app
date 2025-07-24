import 'package:archonit_crypto_app/core/util/text_styles.dart';
import 'package:archonit_crypto_app/logic/models/crypto_asset.dart';
import 'package:archonit_crypto_app/logic/notifiers/crypto_list_notifier.dart';
import 'package:archonit_crypto_app/logic/states/crypto_list_state.dart';
import 'package:archonit_crypto_app/ui/widget/asset_list_item_widget.dart';
import 'package:flutter/material.dart';

class AssetListPage extends StatefulWidget {
  const AssetListPage({super.key});

  @override
  State<AssetListPage> createState() => _AssetListPageState();
}

class _AssetListPageState extends State<AssetListPage> {
  late CryptoListNotifier _notifier;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _notifier = cryptoListValuNotifier;
    _notifier.loadAssets();
    _scrollController.addListener(_setupScrollLoadMoreLogic);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_setupScrollLoadMoreLogic);
    _scrollController.dispose();
    super.dispose();
  }

  void _setupScrollLoadMoreLogic() {
    if (_scrollController.position.pixels != 0 &&
        _scrollController.position.atEdge) {
      _notifier.loadMoreAssets();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ValueListenableBuilder(
          valueListenable: _notifier,
          builder: (context, state, child) {
            return switch (state) {
              CryptoListLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              CryptoListInitial() => const Center(
                child: CircularProgressIndicator(),
              ),
              CryptoListLoaded(:final cryptoList) => RefreshableAssetListWidget(
                notifier: _notifier,
                cryptoList: cryptoList,
                scrollController: _scrollController,
              ),
              CryptoListLoadingMore(:final cryptoList) =>
                RefreshableAssetListWidget(
                  notifier: _notifier,
                  cryptoList: cryptoList,
                  scrollController: _scrollController,
                  isLoadingMore: true,
                ),
              CryptoListError(:final message, :final cryptoList) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (cryptoList.isNotEmpty)
                    Expanded(
                      child: RefreshableAssetListWidget(
                        notifier: _notifier,
                        cryptoList: cryptoList,
                        scrollController: _scrollController,
                      ),
                    ),
                  ErrorWidget(
                    message: message,
                    onRetry: () {
                      cryptoList.isNotEmpty
                          ? _notifier.loadMoreAssets()
                          : _notifier.loadAssets();
                    },
                  ),
                ],
              ),
            };
          },
        ),
      ),
    );
  }
}

class RefreshableAssetListWidget extends StatelessWidget {
  const RefreshableAssetListWidget({
    super.key,
    required CryptoListNotifier notifier,
    required this.cryptoList,
    required ScrollController scrollController,
    this.isLoadingMore = false,
  }) : _notifier = notifier,
       _scrollController = scrollController;

  final CryptoListNotifier _notifier;
  final List<CryptoAsset> cryptoList;
  final ScrollController _scrollController;
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        await _notifier.loadAssets();
      },
      child: AssetListWidget(
        cryptoList: cryptoList,
        scrollController: _scrollController,
        isLoadingMore: isLoadingMore,
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key, required this.message, required this.onRetry});
  final String message;
  final void Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: sfProText17600TextBlack.copyWith(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            child: Text('Retry', style: sfProText17600TextBlack),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class AssetListWidget extends StatelessWidget {
  const AssetListWidget({
    super.key,
    required this.cryptoList,
    this.isLoadingMore = false,
    this.scrollController,
  });

  final List<CryptoAsset> cryptoList;
  final bool isLoadingMore;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: cryptoList.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (isLoadingMore && index == cryptoList.length) {
          return const Center(child: CircularProgressIndicator());
        }
        final asset = cryptoList[index];
        return AssetListItemWidget(
          assetId: asset.id,
          assetName: asset.name,
          assetSymbol: asset.symbol,
          assetPrice: '\$${asset.price}',
          assetColor: asset.color,
        );
      },
    );
  }
}

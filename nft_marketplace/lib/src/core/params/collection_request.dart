import 'package:nft_marketplace/src/core/utils/constants.dart';

class CollectionRequestParams {
  final String apiKey;
  final String include;
  final String chain;
  final int page;
  final int pageSize;

  const CollectionRequestParams({
    this.apiKey = kApiKey,
    this.chain = 'polygon',
    this.include = 'all',
    this.page = 1,
    this.pageSize = 20,
  });
}
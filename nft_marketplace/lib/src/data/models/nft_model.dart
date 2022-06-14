import 'package:nft_marketplace/src/domain/entities/nft.dart';

class NftModel extends NftEntity {
  const NftModel(
      {String? chain,
      String? contractAddress,
      String? tokenId,
      String? fileUrl})
      : super(
            chain: chain,
            contractAddress: contractAddress,
            tokenId: tokenId,
            fileUrl: fileUrl);

  factory NftModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return NftModel.empty();
    return NftModel(
      chain: json["chain"] as String?,
      contractAddress: json["contract_address"] as String?,
      tokenId: json["token_id"] as String?,
      fileUrl: json["file_url"] as String?,
    );
  }

  factory NftModel.empty() {
    return const NftModel();
  }
}

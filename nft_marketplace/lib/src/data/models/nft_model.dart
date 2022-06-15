import 'package:nft_marketplace/src/data/models/nft_metadata_model.dart';
import 'package:nft_marketplace/src/domain/entities/nft.dart';

class NftModel extends NftEntity {
  const NftModel({
    String? chain,
    String? contractAddress,
    String? tokenId,
    String? fileUrl,
    String? cachedFileUrl,
    NftMetaDataModel? metaDataModel,
  }) : super(
          chain: chain,
          contractAddress: contractAddress,
          tokenId: tokenId,
          fileUrl: fileUrl,
          cachedFileUrl: cachedFileUrl,
          metaData: metaDataModel,
        );

  factory NftModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return NftModel.empty();
    return NftModel(
      chain: json["chain"] as String?,
      contractAddress: json["contract_address"] as String?,
      tokenId: json["token_id"] as String?,
      fileUrl: json["file_url"] as String?,
      cachedFileUrl: json["cached_file_url"] as String?,
      metaDataModel: (json["metadata"] == null)
          ? null
          : NftMetaDataModel.fromJson(json["metadata"] as Map<String, dynamic>),
    );
  }

  factory NftModel.empty() {
    return const NftModel();
  }
}

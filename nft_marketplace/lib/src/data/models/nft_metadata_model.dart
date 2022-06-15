import 'package:nft_marketplace/src/domain/entities/nft_metadata.dart';

class NftMetaDataModel extends NftMetaData {
  const NftMetaDataModel({String? name, String? description, String? image})
      : super(name: name, description: description, image: image);

  factory NftMetaDataModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return NftMetaDataModel.empty();
    return NftMetaDataModel(
        name: json['name'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?);
  }

  factory NftMetaDataModel.empty() {
    return const NftMetaDataModel();
  }
}

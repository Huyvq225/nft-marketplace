import 'package:equatable/equatable.dart';
import 'package:nft_marketplace/src/data/models/nft_model.dart';

class CollectionModel extends Equatable {
  const CollectionModel({this.response, this.nfts});

  factory CollectionModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return CollectionModel.empty();
    final Iterable? _nftsMap = json['nfts'];
    return CollectionModel(
      response: json['response'] as String?,
      nfts: (_nftsMap == null)
          ? null
          : _nftsMap.map((e) => NftModel.fromJson(e)).toList(),
    );
  }

  @override
  List<Object?> get props => [response, nfts];

  factory CollectionModel.empty() {
    return const CollectionModel();
  }

  final String? response;
  final List<NftModel>? nfts;
}

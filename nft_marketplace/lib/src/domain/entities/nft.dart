import 'package:equatable/equatable.dart';
import 'package:nft_marketplace/src/domain/entities/nft_metadata.dart';

class NftEntity extends Equatable {
  const NftEntity(
      {this.chain,
      this.contractAddress,
      this.tokenId,
      this.fileUrl,
      this.cachedFileUrl,
      this.metaData});

  final String? chain;
  final String? contractAddress;
  final String? tokenId;
  final String? fileUrl;
  final String? cachedFileUrl;
  final NftMetaData? metaData;

  @override
  List<Object?> get props =>
      [chain, contractAddress, tokenId, fileUrl, contractAddress, metaData];

  @override
  bool? get stringify => true;
}

import 'package:equatable/equatable.dart';

class NftEntity extends Equatable {
  const NftEntity(
      {this.chain, this.contractAddress, this.tokenId, this.fileUrl});

  final String? chain;
  final String? contractAddress;
  final String? tokenId;
  final String? fileUrl;

  @override
  List<Object?> get props => [chain, contractAddress, tokenId, fileUrl];

  @override
  bool? get stringify => true;
}

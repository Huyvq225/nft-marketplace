import 'package:equatable/equatable.dart';

class NftMetaData extends Equatable {
  const NftMetaData({this.name, this.description, this.image});

  final String? name;
  final String? description;
  final String? image;

  @override
  List<Object?> get props => [name, description, image];
}

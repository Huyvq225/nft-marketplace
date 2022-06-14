import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nft_marketplace/src/data/models/nft_model.dart';

import '../../resources/resource_reader.dart';

void main() {
  //declare mock nft model
  const tNftModel = NftModel(
      chain: 'polygon',
      contractAddress: '0x7227e371540cf7b8e512544ba6871472031f3335',
      tokenId: '158456340228646354873711997891',
      fileUrl:
          'https://neon-district-season-one.s3.amazonaws.com/images/blkspecialneonpizzaagentp-rare-arms-female-thumb.png');

  group('fromJson method test', () {
    test(
      'should convert json to model by the mean of fromJson method',
      () {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(resource('nft_model.json'));
        //act
        final result = NftModel.fromJson(jsonMap);
        //assert
        expect(result, tNftModel);
      },
    );
  });
}

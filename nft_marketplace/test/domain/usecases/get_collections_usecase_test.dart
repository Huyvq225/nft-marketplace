import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:nft_marketplace/src/core/params/collection_request.dart';
import 'package:nft_marketplace/src/core/resources/data_state.dart';
import 'package:nft_marketplace/src/domain/entities/nft.dart';
import 'package:nft_marketplace/src/domain/repositories/collection_repository.dart';
import 'package:nft_marketplace/src/domain/usecases/get_collections_usecase.dart';

class MockCollectionRepositoryImpl extends Mock implements CollectionRepositoryImpl {}

void main() {
  late MockCollectionRepositoryImpl mockCollectionRepository;
  late GetCollectionsUseCase useCase;
  final locator = GetIt.instance;

  void setupLocator() {
    locator.registerSingleton<CollectionRepository>(MockCollectionRepositoryImpl());
  }

  setUp(() {
    setupLocator();
    mockCollectionRepository = MockCollectionRepositoryImpl();
    useCase = GetCollectionsUseCase(locator());
  });

  List<NftEntity> tNfts = [
    const NftEntity(
        chain: 'polygon',
        contractAddress: 'address1',
        tokenId: 'tokenId1',
        fileUrl: 'imageUrl1'),
    const NftEntity(
        chain: 'polygon',
        contractAddress: 'address2',
        tokenId: 'tokenId2',
        fileUrl: 'imageUrl2'),
  ];



  test('should get list ntf entity from the CollectionRepository', () async {
    //arrange
    when(mockCollectionRepository.getAllCollection(
      params: const CollectionRequestParams(),
    )).thenAnswer((_) async => DataSuccess<List<NftEntity>>(tNfts));

    //act
    final result = await useCase.call(params: const CollectionRequestParams());

    //assert
    expect(result, DataSuccess<List<NftEntity>>(tNfts));
    verify(mockCollectionRepository.getAllCollection(params: const CollectionRequestParams(),));
    verifyNoMoreInteractions(mockCollectionRepository);
  });
}

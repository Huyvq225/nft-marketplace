import 'package:get_it/get_it.dart';
import 'package:nft_marketplace/src/data/repositories/base_http_services_impl.dart';
import 'package:nft_marketplace/src/data/repositories/collection_services_impl.dart';
import 'package:nft_marketplace/src/data/services/base_http_services.dart';
import 'package:nft_marketplace/src/data/services/collection_services.dart';
import 'package:nft_marketplace/src/domain/repositories/collection_repository.dart';
import 'package:nft_marketplace/src/domain/usecases/get_collections_usecase.dart';
import 'package:http/http.dart' as http;

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //Data
  injector
      .registerSingleton<CollectionService>(CollectionServiceImpl(injector()));
  injector.registerSingleton<BaseHTTPServices>(BaseHTTPServiceImpl(injector()));

  //Domain
  injector.registerSingleton<CollectionRepository>(
    CollectionRepositoryImpl(
      injector(),
    ),
  );

  // UseCases
  injector.registerSingleton<GetCollectionsUseCase>(
      GetCollectionsUseCase(injector()));

  injector.registerLazySingleton(() => http.Client);
}

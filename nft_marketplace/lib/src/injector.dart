import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:nft_marketplace/src/data/repositories/base_http_services_impl.dart';
import 'package:nft_marketplace/src/data/repositories/collection_services_impl.dart';
import 'package:nft_marketplace/src/data/services/base_http_services.dart';
import 'package:nft_marketplace/src/data/services/collection_services.dart';
import 'package:nft_marketplace/src/domain/repositories/collection_repository.dart';
import 'package:nft_marketplace/src/domain/usecases/get_collections_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:nft_marketplace/src/presentation/views/main_page/bloc/main_page_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //Data
  injector.registerSingleton<http.Client>(http.Client());
  injector.registerSingleton<BaseHTTPServices>(BaseHTTPServiceImpl(injector()));
  injector
      .registerSingleton<CollectionService>(CollectionServiceImpl(injector()));

  //Domain
  injector.registerSingleton<CollectionRepository>(
    CollectionRepositoryImpl(
      injector(),
    ),
  );

  // UseCases
  injector.registerSingleton<GetCollectionsUseCase>(
      GetCollectionsUseCase(injector()));

  //bloc
  injector.registerFactory(() => MainPageBloc(injector()));
}

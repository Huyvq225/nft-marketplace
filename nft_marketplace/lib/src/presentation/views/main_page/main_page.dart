import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_marketplace/src/domain/entities/nft.dart';
import 'package:nft_marketplace/src/presentation/views/main_page/bloc/main_page_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('NFT Marketplace'),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<MainPageBloc, MainPageState>(
        buildWhen: (pre, curr) => curr is CollectionLoadedState,
        builder: (bodyContext, bodyState) {
          List<NftEntity> _collections = [];
          if (bodyState is CollectionLoadedState) {
            _collections = bodyState.collections;
          }
          return Column(
            children: [
              _collections.isEmpty ? Container() : _trendingList(_collections),
            ],
          );
        });
  }

  Widget _trendingList(List<NftEntity> _collection) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return _itemList(_collection[index]);
          }),
    );
  }

  Widget _itemList(NftEntity _nft) {
    String _imgUrl = _nft.cachedFileUrl ?? '';
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
          ),
          child: _imgUrl.isEmpty
              ? const Text('No data')
              : Image.network(
                  _imgUrl,
                ),
        ),
      ],
    );
  }
}

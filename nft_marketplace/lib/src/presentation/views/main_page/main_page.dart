import 'package:flutter/material.dart';
import 'package:nft_marketplace/src/domain/usecases/get_collections_usecase.dart';

class MainPage extends StatefulWidget {
  const MainPage(this.collectionsUseCase, {Key? key}) : super(key: key);

  final GetCollectionsUseCase collectionsUseCase;

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
    return Column(
      children: [
        _trendingList(),
        const SizedBox(
          height: 10,
        ),
        _todayPicksList()
      ],
    );
  }

  Widget _trendingList() {
    return ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return _itemList();
        });
  }

  Widget _todayPicksList() {
    return ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return _itemList();
        });
  }

  Widget _itemList() {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          color: Colors.blue,
        ),
      ],
    );
  }
}

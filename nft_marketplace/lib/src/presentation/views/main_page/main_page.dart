import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_marketplace/src/config/colors/nft_component_color.dart';
import 'package:nft_marketplace/src/domain/entities/nft.dart';
import 'package:nft_marketplace/src/presentation/views/main_page/bloc/main_page_bloc.dart';
import 'package:nft_marketplace/src/presentation/widgets/app_bar/app_bar_widget.dart';
import 'package:nft_marketplace/src/presentation/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final NftComponentColor nftComponentColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NFTAppBar(),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBarWidget(
        onChanged: (tabIndex) {
          print('Tab index');
        },
      ),
    );
  }

  Widget _buildBody() {
    // return Container();
    List<Widget> _pages = BottomNavItemConfig.pages();
    return PageView(
      children: _pages
    );
    return Container(
      color: NftComponentColor.of(context).background,
      child: BlocBuilder<MainPageBloc, MainPageState>(
          buildWhen: (pre, curr) => curr is CollectionLoadedState,
          builder: (bodyContext, bodyState) {
            List<NftEntity> _collections = [];
            if (bodyState is CollectionLoadedState) {
              _collections = bodyState.collections;
            }
            return Column(
              children: [
                _collections.isEmpty
                    ? Container()
                    : _trendingList(_collections),
              ],
            );
          }),
    );
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
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
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

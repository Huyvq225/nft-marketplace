import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_marketplace/src/config/colors/nft_component_color.dart';
import 'package:nft_marketplace/src/config/text_styles/nft_text_styles.dart';
import 'package:nft_marketplace/src/config/themes/nft_theme_type.dart';
import 'package:nft_marketplace/src/core/bloc/theme/theme_bloc.dart';
import 'package:nft_marketplace/src/domain/entities/nft.dart';
import 'package:nft_marketplace/src/presentation/views/main_page/bloc/main_page_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final NftComponentColor nftComponentColor;

  // @override
  // void initState() {
  //   nftComponentColor = NftComponentColor(context);
  //   super.initState();
  // }
  //
  // @override
  // void didUpdateWidget(covariant MainPage oldWidget) {
  //   nftComponentColor = NftComponentColor(context);
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: NftComponentColor.of(context).appBarBackground,
      title: Text(
        'NFT Marketplace',
        style: NFTTypography.t18B
            .style(fontColor: NftComponentColor.of(context).appBarTitle),
      ),
      leading: InkWell(
        onTap: () {
          BlocProvider.of<ThemeBloc>(context).add(
            ThemeChangedEvent(),
          );
        },
        child: const Icon(
          Icons.account_circle,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildBody() {
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

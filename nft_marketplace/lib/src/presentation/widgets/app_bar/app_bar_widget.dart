import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_marketplace/src/config/colors/nft_component_color.dart';
import 'package:nft_marketplace/src/config/text_styles/nft_text_styles.dart';
import 'package:nft_marketplace/src/core/bloc/theme/theme_bloc.dart';

class NFTAppBar extends StatefulWidget implements PreferredSizeWidget {
  const NFTAppBar({Key? key}) : super(key: key);

  @override
  State<NFTAppBar> createState() => _NFTAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _NFTAppBarState extends State<NFTAppBar> {
  @override
  Widget build(BuildContext context) {
    return kIsWeb ? _webAppBar() : _mobileAppBar();
  }

  AppBar _mobileAppBar() {
    return AppBar(
      backgroundColor: NftComponentColor.of(context).appBarBackground,
      title: Text(
        'NFT Marketplace',
        style: NFTTypography.t18B
            .style(fontColor: NftComponentColor.of(context).appBarTitle),
      ),
      leading: InkWell(
        onTap: () {},
        child: const Icon(
          Icons.account_circle,
          color: Colors.blue,
        ),
      ),
    );
  }

  AppBar _webAppBar() {
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
      actions: [
        Row(
          children: [
            _actionItem(title: 'Explore'),
            const SizedBox(
              width: 20,
            ),
            _actionItem(title: 'Ranking'),
            const SizedBox(
              width: 20,
            ),
            _actionItem(title: 'Resources'),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ],
    );
  }

  Widget _actionItem({String title = '', bool selected = false}) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: NFTTypography.t14B.style(
                    fontColor: NftComponentColor.of(context).appBarTitle),
              ),
            ),
          ),
          Visibility(
            visible: false,
            child: Container(
              height: 4,
              width: 80,
              decoration: BoxDecoration(
                color: NftComponentColor.of(context).appBarActionItem,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

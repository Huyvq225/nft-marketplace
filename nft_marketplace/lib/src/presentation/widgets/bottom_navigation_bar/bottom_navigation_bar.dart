import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft_marketplace/src/config/colors/nft_component_color.dart';
import 'package:nft_marketplace/src/config/icons/nft_icons.dart';
import 'package:nft_marketplace/src/config/localization/app_localization.dart';
import 'package:nft_marketplace/src/presentation/views/home/home_page.dart';
import 'package:nft_marketplace/src/presentation/views/more/more_page.dart';
import 'package:nft_marketplace/src/presentation/views/rank/ranking_page.dart';
import 'package:nft_marketplace/src/presentation/views/wallet/wallet_page.dart';
import 'package:nft_marketplace/src/presentation/widgets/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';

// ignore: must_be_immutable
class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key, required this.onChanged})
      : super(key: key);

  final BottomNavBarOnChanged onChanged;

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late BottomNavigationBarBloc _bloc;
  int _currentIndex = 0;

  @override
  void initState() {
    _bloc = BottomNavigationBarBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBottomNavigation(context);
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return BlocProvider<BottomNavigationBarBloc>(
      create: (_) {
        return _bloc;
      },
      child: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
        builder: (barContext, barState) {
          _currentIndex = barState.currentTabIndex;
          return BottomNavigationBar(
            items: _bottomNavBarItems(barContext),
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor:
                NftComponentColor.of(barContext).bottomNavigationSelected,
            unselectedItemColor:
                NftComponentColor.of(barContext).bottomNavigationDeselected,
            backgroundColor:
                NftComponentColor.of(barContext).bottomNavigationBackground,
            onTap: (tabIndex) {
              _currentIndex = tabIndex;
              _bloc.add(BottomNavOnChangedEvent(tabIndex));
              widget.onChanged(tabIndex);
            },
          );
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomNavBarItems(BuildContext context) {
    return BottomNavItemConfig.bottomNavItemList
        .map<BottomNavigationBarItem>(
            (tab) => _bottomNavBarItem(context, tabItem: tab))
        .toList();
  }

  BottomNavigationBarItem _bottomNavBarItem(BuildContext context,
      {required BottomNavItem tabItem}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        tabItem.icon,
        color: NftComponentColor.of(context).bottomNavigationDeselected,
      ),
      activeIcon: SvgPicture.asset(
        tabItem.icon,
        color: NftComponentColor.of(context).bottomNavigationSelected,
      ),
      // label: AppLocalizations.of(context)?.translate(tabItem.label),
      label: tabItem.label.tr(),
    );
  }
}

typedef BottomNavBarOnChanged = void Function(int);

enum BottomNavItem { home, rank, wallet, more }

class BottomNavItemConfig {
  static List<BottomNavItem> bottomNavItemList = [
    BottomNavItem.home,
    BottomNavItem.rank,
    BottomNavItem.wallet,
    BottomNavItem.more,
  ];

  static List<Widget> pages({dynamic arg}) {
    return const [
      HomePage(),
      RankingPage(),
      WalletPage(),
      MorePage(),
    ];
  }
}

extension BottomNavItemExtension on BottomNavItem {
  String get label {
    switch (this) {
      case BottomNavItem.home:
        return 'home_bottom_tab';
      case BottomNavItem.rank:
        return 'ranking_bottom_tab';
      case BottomNavItem.wallet:
        return 'wallet_bottom_tab';
      case BottomNavItem.more:
        return 'more_bottom_tab';
      default:
        return '';
    }
  }

  String get icon {
    switch (this) {
      case BottomNavItem.home:
        return NFTIcons().homeTab;
      case BottomNavItem.rank:
        return NFTIcons().rankingTab;
      case BottomNavItem.wallet:
        return NFTIcons().walletTab;
      case BottomNavItem.more:
        return NFTIcons().moreTab;
      default:
        return '';
    }
  }

  int get index {
    switch (this) {
      case BottomNavItem.home:
        return 0;
      case BottomNavItem.rank:
        return 1;
      case BottomNavItem.wallet:
        return 2;
      case BottomNavItem.more:
        return 3;
      default:
        return 0;
    }
  }
}

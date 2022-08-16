import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_marketplace/src/config/colors/nft_component_color.dart';
import 'package:nft_marketplace/src/config/text_styles/nft_text_styles.dart';
import 'package:nft_marketplace/src/core/bloc/lang/lang_bloc.dart';
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
        onTap: () {
          // BlocProvider.of<ThemeBloc>(context).add(
          //   ThemeChangedEvent(),
          // );

          BlocProvider.of<LangBloc>(context).add(
            const ChangeLocaleEvent(LanguageType.en),
          );
        },
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
            // _actionItem(title: 'Explore'),
            const InteractiveWidget(),
            const SizedBox(
              width: 20,
            ),
            _actionItem(title: 'Ranking'),
            // const InteractiveWidget(),
            const SizedBox(
              width: 20,
            ),
            _actionItem(title: 'Resources'),
            // const InteractiveWidget(),
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

class InteractiveWidget extends StatefulWidget {
  const InteractiveWidget({Key? key}) : super(key: key);

  @override
  State<InteractiveWidget> createState() => _InteractiveWidgetState();
}

class _InteractiveWidgetState extends State<InteractiveWidget> {
  bool _isHovering = false;
  bool _showDropDown = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        // _changeState(true);
        _showDropdown();
      },
      onExit: (event) {
        // _changeState(false);
        // Navigator.pop(context);
      },
      child: _actionItem(selected: _isHovering),
    );
  }

  final GlobalKey _keyTabItem = GlobalKey();

  Widget _actionItem({String title = 'Explore', bool selected = false}) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              key: _keyTabItem,
              alignment: Alignment.center,
              child: Text(
                title,
                style: NFTTypography.t14B.style(
                    fontColor: NftComponentColor.of(context).appBarTitle),
              ),
            ),
          ),
          Visibility(
            visible: selected,
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

  void _changeState(bool selected) {
    setState(() {
      _isHovering = selected;
    });
  }

  Offset? _targetCenter;
  OverlayEntry? _dropDownOverlay;

  void _showDropdown() {
    final _context = _keyTabItem.currentContext;
    final renderBox = _context?.findRenderObject() as RenderBox;
    final overlay =
        Overlay.of(_context!)?.context.findRenderObject() as RenderBox?;

    _targetCenter = renderBox.localToGlobal(renderBox.size.center(Offset.zero),
        ancestor: overlay);
    final Size size = renderBox.size; // or _widgetKey.currentContext?.size
    print('Size: ${renderBox.size.width}, ${renderBox.size.height}');
    print('Offset: ${_targetCenter?.dx}, ${_targetCenter?.dy}');
    print(
        'Position: ${(_targetCenter?.dx ?? 0 + size.width) / 2}, ${(_targetCenter?.dy ?? 0 + size.height) / 2}');

    _dropDownOverlay = OverlayEntry(
      builder: (context) => _AnimationWrapper(
        builder: (context, opacity) => AnimatedOpacity(
          duration: const Duration(
            milliseconds: 300,
          ),
          opacity: opacity,
          child: Center(
            child: _buildDropdown(0,0),
          ),
        ),
      ),
    );

    if (_dropDownOverlay != null) {
      print('Add overlay');
      Overlay.of(_context)?.insertAll([_dropDownOverlay!]);
    }
  }

  Widget _buildDropdown(double? left, double? top) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        color: Colors.cyan,
        width: 80,
        height: 300,
      ),
    );
  }
}

/////////////////////////////////////////////////////////
class _PopupDropdownLayoutDelegate extends SingleChildLayoutDelegate {
  _PopupDropdownLayoutDelegate(this.size);

  final ValueNotifier<Size> size;

  @override
  Size getSize(BoxConstraints constraints) {
    return size.value;
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    throw false;
  }
}

/////////////////////////////////////////////////////////
typedef FadeBuilder = Widget Function(BuildContext, double);

////////////////////////////////////////////////////////////////////////////////////////////////////

class _AnimationWrapper extends StatefulWidget {
  final FadeBuilder? builder;

  const _AnimationWrapper({this.builder});

  @override
  _AnimationWrapperState createState() => _AnimationWrapperState();
}

////////////////////////////////////////////////////////////////////////////////////////////////////

class _AnimationWrapperState extends State<_AnimationWrapper> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          opacity = 1.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder!(context, opacity);
  }
}

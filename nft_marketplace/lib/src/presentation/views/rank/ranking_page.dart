import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 300,
          ),
          _buildFilterItem()
        ],
      ),
    );
  }
}

class NFTFilterBox extends StatefulWidget {
  const NFTFilterBox({Key? key, this.items}) : super(key: key);

  final List<String>? items;

  @override
  State<NFTFilterBox> createState() => _NFTFilterBoxState();
}

class _NFTFilterBoxState extends State<NFTFilterBox> {
  @override
  Widget build(BuildContext context) {
    return kIsWeb ? _mobileFilter() : _webFilter();
  }

  Widget _mobileFilter() {
    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
        ),
      ),
      child: const Center(
        child: Text('Filter'),
      ),
    );
  }

  Widget _webFilter() {
    return DropdownButton(
      items: widget.items!
          .map(
            (e) => DropdownMenuItem<String>(
              child: Text(e),
            ),
          )
          .toList(),
      onChanged: (value) {
        print(value);
      },
    );
  }
}

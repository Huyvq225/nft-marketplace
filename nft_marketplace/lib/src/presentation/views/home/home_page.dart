import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_marketplace/src/config/colors/nft_component_color.dart';
import 'package:nft_marketplace/src/config/text_styles/nft_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(414, 896));
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 29),
          _topCollections(),
          const SizedBox(height: 29),
          _category(),
          const SizedBox(height: 29),
        ],
      ),
    );
  }

  Widget _category() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse by category',
            textAlign: TextAlign.left,
            style: NFTTypography.t14B
                .style(fontColor: NftComponentColor.of(context).text),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (_, index) {
                return _categoryItem();
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  width: 10,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryItem({String? title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 110,
          height: 110,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'E-sport',
            textAlign: TextAlign.left,
            style: NFTTypography.t12S
                .style(fontColor: NftComponentColor.of(context).text),
          ),
        ),
      ],
    );
  }

  Widget _topCollections() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Top collections over',
            textAlign: TextAlign.left,
            style: NFTTypography.t14B
                .style(fontColor: NftComponentColor.of(context).text),
          ),
          const SizedBox(height: 15),
          _topThreeCollection(),
          const SizedBox(height: 15),
          Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ListView.separated(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return _collectionItem(rankingNo: index);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 5,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _topThreeCollection() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Row(
        children: [
          _topThreeItem(rankingNo: 1),
          const SizedBox(
            width: 10,
          ),
          _topThreeItem(rankingNo: 2),
          const SizedBox(
            width: 10,
          ),
          _topThreeItem(rankingNo: 3),
        ],
      ),
    );
  }

  Widget _topThreeItem({int? rankingNo}) {
    Color _bgColor = Colors.red;
    if (rankingNo == 1) {
      _bgColor = Colors.green;
    } else if (rankingNo == 2) {
      _bgColor = Colors.blue;
    }
    return Expanded(
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Container(
          decoration: BoxDecoration(
              color: _bgColor, borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }

  Widget _collectionItem({int? rankingNo, String? name}) {
    return Row(
      children: [
        //ranking number
        Text(
          rankingNo?.toString() ?? '--',
          textAlign: TextAlign.left,
          style: NFTTypography.t12S
              .style(fontColor: NftComponentColor.of(context).text),
        ),

        //Avatar
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: const BoxDecoration(
            color: Colors.brown,
            shape: BoxShape.circle,
          ),
        ),

        //collectionInfo
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? 'unknown',
                textAlign: TextAlign.left,
                style: NFTTypography.t12S
                    .style(fontColor: NftComponentColor.of(context).text),
              ),
            ],
          ),
        ),

        //statistics
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Text(
                '+301.31%',
                textAlign: TextAlign.left,
                style: NFTTypography.t12R.style(
                    fontColor: NftComponentColor.of(context).positivePercent),
              ),
              Text(
                '153.123',
                textAlign: TextAlign.left,
                style: NFTTypography.t12S
                    .style(fontColor: NftComponentColor.of(context).price),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

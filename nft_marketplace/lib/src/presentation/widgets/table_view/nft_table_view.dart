import 'package:flutter/material.dart';

class NFTTableView extends StatefulWidget {
  const NFTTableView({Key? key}) : super(key: key);

  @override
  State<NFTTableView> createState() => _NFTTableViewState();
}

class _NFTTableViewState extends State<NFTTableView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NFTRowItem {
  const NFTRowItem({this.title, this.data});

  final String? title;
  final String? data;
}

class BaseWidget extends StatefulWidget {
  const BaseWidget({Key? key}) : super(key: key);

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    return buildMobile();
  }

  Widget buildMobile() {
    return Container();
  }

  Widget buildWeb() {
    return Container();
  }
}

class A extends BaseWidget {
  const A({Key? key}) : super(key: key);

  Widget buildMobile() {
    return Container();
  }
}

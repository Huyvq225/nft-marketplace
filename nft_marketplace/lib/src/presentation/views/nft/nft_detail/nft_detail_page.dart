import 'dart:io';

import 'package:flutter/material.dart';

int _time = 60;
bool _restart = false;

class NFTDetailPage extends StatefulWidget {
  const NFTDetailPage({Key? key}) : super(key: key);

  @override
  State<NFTDetailPage> createState() => _NFTDetailPageState();
}

class _NFTDetailPageState extends State<NFTDetailPage> {
  final testArray = ["1", "2", "3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100,),
            ElevatedButton(
              onPressed: () {
                // Sentry.captureMessage('A message with a print() Breadcrumb');
                // Sentry.addBreadcrumb(Breadcrumb(
                //     message: 'this is test custom Breadcrumb',
                //     category: 'delay_method',
                //     type: 'non_fatal',
                //     level: SentryLevel.warning));
                // throw StateError('Sentry should receive this error 2');
                // Future<void>.delayed(const Duration(seconds: 5)).then((value) {
                //
                // });
                _showToast(context, testArray[4]);
              },
              child: const Text('Breadcrumb'),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  while (true) {
                    sleep(const Duration(seconds: 8));
                    _time = _time - 1;
                  }
                });
              },
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _time.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context, String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO $text', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}

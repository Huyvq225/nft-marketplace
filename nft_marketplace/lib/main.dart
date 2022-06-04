import 'package:flutter/material.dart';

import 'src/config/routes/app_routes.dart';
import 'src/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nft marketplace',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

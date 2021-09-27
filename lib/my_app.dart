




import 'package:flutter/material.dart';
import 'package:hc_deeplink/component/route_handler.dart';

import 'component/routes.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final FluroRouterApp fluro;

  @override
  void initState() {
    super.initState();
    fluro = FluroRouterApp.create();
    fluro.defineRoute();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hcdeep',
      onGenerateRoute: fluro.onGenerated,
    );
  }
}


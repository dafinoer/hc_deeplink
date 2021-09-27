import 'package:flutter/material.dart';

import 'component/routes.dart';
import 'injector.dart';
import 'my_app.dart';

void main() {
  Injector.create();
  runApp(MyApp());
}

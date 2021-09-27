import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hc_deeplink/injector.dart';

import 'route_handler.dart';

class FluroRouterApp {
  final FluroRouter _fluro;
  final RouteHandler _rootHandler;

  FluroRouterApp._(this._fluro, this._rootHandler);

  factory FluroRouterApp.create() => FluroRouterApp._(
        injector.get(),
        injector.get(),
      );

  Route<dynamic>? onGenerated(RouteSettings settings) => _fluro.generator(settings);

  void defineRoute() {
    _fluro.define('/', handler: _rootHandler.rootPageRouteHandler());
    _fluro.define(
      'comment/:',
      handler: _rootHandler.commentPageRouteHandler(),
      transitionType: TransitionType.fadeIn,
    );
    // _fluro.notFoundHandler = _rootHandler.notFound();
  }
}

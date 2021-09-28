import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:get_it/get_it.dart';
import 'package:hc_deeplink/component/routes.dart';
import 'package:hc_deeplink/data/remote/item_service.dart';
import 'package:hc_deeplink/repository/story_repository.dart';

import 'component/route_handler.dart';
import 'data/remote/top_story_service.dart';
import 'utils/dio_setup.dart';
import 'utils/dynamic_link_app.dart';
import 'utils/interceptor_dio.dart';

final injector = GetIt.instance;

class Injector {

  static Future<void> create() async {
    final dependencyInjection = Injector();
    injector.registerSingleton<FluroRouter>(FluroRouter());
    injector.registerSingleton<RouteHandler>(RouteHandler());
    injector.registerSingleton<FluroRouterApp>(FluroRouterApp.create());
    injector.registerLazySingleton<DynamicLinkApp>(() => DynamicLinkApp());

    dependencyInjection.createCache();
    dependencyInjection.createServices();
    dependencyInjection.createRepository();
  }

  void createCache() {
    ///todo craeted DI here
  }

  void createServices() {
    injector.registerSingleton<DioSetup>(DioSetup.create());
    injector.registerLazySingleton<TopStoryService>(() => TopStoryService.create());
    injector.registerLazySingleton<ItemService>(() => ItemService.create());
  }

  void createRepository() {
    injector.registerLazySingleton<StoryRepository>(() => StoryRepository.create());
  }
}
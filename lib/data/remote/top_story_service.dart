import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:hc_deeplink/injector.dart';
import 'package:hc_deeplink/utils/dio_setup.dart';

class TopStoryService {
  final DioSetup _dioSetup;

  TopStoryService._(this._dioSetup);

  factory TopStoryService.create() => TopStoryService._(injector.get());

  Future<List<int>> getListOfIdTopStories() async {
    final result = await _dioSetup.dio.request(
      '/topstories.json',
      options: Options(method: 'GET'),
    );
    final toList = List<int>.from(result.data);
    return toList;
  }
}

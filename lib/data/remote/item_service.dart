import 'package:dio/dio.dart';
import 'package:hc_deeplink/injector.dart';
import 'package:hc_deeplink/model/news.dart';
import 'package:hc_deeplink/utils/dio_setup.dart';

class ItemService {
  final DioSetup _dioSetup;

  ItemService(this._dioSetup);

  factory ItemService.create() => ItemService(injector.get());

  Future<News> getItem(int id) async {
    final result = await _dioSetup.dio.request(
      '/item/${id}.json',
      options: Options(method: 'GET'),
    );

    return News.fromJson(result.data);
  }
}

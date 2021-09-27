import 'package:hc_deeplink/data/remote/item_service.dart';
import 'package:hc_deeplink/data/remote/top_story_service.dart';
import 'package:hc_deeplink/injector.dart';
import 'package:hc_deeplink/model/news.dart';

class StoryRepository {
  final TopStoryService _storyService;
  final ItemService _itemService;

  StoryRepository(this._storyService, this._itemService);

  factory StoryRepository.create() => StoryRepository(
        injector.get(),
        injector.get(),
      );

  Future<List<int>> getIdsTopStory() async {
    final result = await _storyService.getListOfIdTopStories();
    final limit5Item = result.getRange(0, 25).toList(growable: false);
    return limit5Item;
  }

  Future<News> getItemById(int id) async {
    final result = await _itemService.getItem(id);
    return result;
  }
}

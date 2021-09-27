import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hc_deeplink/injector.dart';
import 'package:hc_deeplink/model/news.dart';
import 'package:hc_deeplink/repository/story_repository.dart';
import 'package:meta/meta.dart';

part 'top_stories_state.dart';

class TopStoriesCubit extends Cubit<TopStoriesState> {
  TopStoriesCubit(this._storyRepository) : super(TopStoriesInitial());

  final StoryRepository _storyRepository;

  factory TopStoriesCubit.create() => TopStoriesCubit(injector.get())..getNewsTopStories();


  void getNewsTopStories() async {
    try {
      emit(const TopStoriesLoading());
      final itemsNews = <News>[];
      final result = await _storyRepository.getIdsTopStory();
      
      for (final id in result) {
        final news = await _storyRepository.getItemById(id);
        itemsNews.add(news);
      }
      
      emit(TopStoriesSuccess(UnmodifiableListView(itemsNews)));
    } catch (e, s){
      debugPrint(s.toString());
      emit(TopStoriesError(e.toString()));
    }
  }
}

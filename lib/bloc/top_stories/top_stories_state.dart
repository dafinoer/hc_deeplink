part of 'top_stories_cubit.dart';

@immutable
abstract class TopStoriesState extends Equatable {
  const TopStoriesState();
}

class TopStoriesInitial extends TopStoriesState {
  @override
  List<Object?> get props => [];
}

class TopStoriesLoading extends TopStoriesState {
  const TopStoriesLoading();
  @override
  List<Object?> get props => [];
}

class TopStoriesError extends TopStoriesState {
  final String messageError;

  const TopStoriesError(this.messageError);

  @override
  List<Object?> get props => [messageError];
}

class TopStoriesSuccess extends TopStoriesState {
  final UnmodifiableListView<News> itemNews;

  TopStoriesSuccess(this.itemNews);

  @override
  List<Object?> get props => [itemNews];
}

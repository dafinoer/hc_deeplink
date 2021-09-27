import 'package:equatable/equatable.dart';
import 'package:hc_deeplink/utils/exception_app.dart';

class News extends Equatable {
  final int id;
  final String title;
  final String type;
  final String url;

  const News(this.id, this.title, this.type, this.url);

  factory News.fromJson(Map<String, dynamic> json) {
    late final int id;
    late final String title;
    late final String type;
    late final String url;

    if (json.containsKey('id') && json['id'] != null) {
      id = json['id'];
    } else {
      throw MissingRequiredKeysException.keyError('Key id not found');
    }

    if (json.containsKey('title') && json['title'] != null) {
      title = json['title'];
    } else {
      throw MissingRequiredKeysException.keyError('Key title not found');
    }

    if (json.containsKey('type') && json['type'] != null) {
      type = json['type'];
    } else {
      throw MissingRequiredKeysException.keyError('Key type not found');
    }

    if (json.containsKey('url') && json['url'] != null) {
      url = json['url'];
    } else {
      throw MissingRequiredKeysException.keyError('Key url not found');
    }

    return News(id, title, type, url);
  }

  @override
  List<Object?> get props => [id, title, type, url];
}

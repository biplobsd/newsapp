import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_headlines.freezed.dart';
part 'top_headlines.g.dart';

@freezed
class TopHeadlines with _$TopHeadlines {
  const factory TopHeadlines(
      {required String status,
      int? totalResults,
      List<Article>? articles,
      String? code,
      String? message}) = _TopHeadlines;

  factory TopHeadlines.fromJson(Map<String, Object?> json) =>
      _$TopHeadlinesFromJson(json);
}

@freezed
class Article with _$Article {
  const factory Article({
    required Source source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required DateTime publishedAt,
    required String content,
  }) = _Article;

  factory Article.fromJson(Map<String, Object?> json) =>
      _$ArticleFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    required String id,
    required String name,
  }) = _Source;

  factory Source.fromJson(Map<String, Object?> json) => _$SourceFromJson(json);
}

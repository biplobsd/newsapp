import 'package:equatable/equatable.dart';

import '../../domain/entities/top_headlines.dart';

class GetTopHeadlinesState extends Equatable {
  final bool isLoading;
  final List<Article>? articles;
  final String? errorMessage;

  const GetTopHeadlinesState({
    this.isLoading = false,
    this.articles,
    this.errorMessage,
  });

  GetTopHeadlinesState copyWith({
    bool? isLoading,
    List<Article>? articles,
    String? errorMessage,
  }) {
    return GetTopHeadlinesState(
      isLoading: isLoading ?? this.isLoading,
      articles: articles ?? this.articles,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, articles, errorMessage];
}

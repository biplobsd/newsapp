import 'package:either_dart/either.dart';
import 'package:newsapp/core/error/failures.dart';
import 'package:newsapp/features/top_headlines/domain/entities/top_headlines.dart';

import '../repositories/get_top_headlines_repository.dart';

class GetTopHeadlinesUsecase {
  final GetTopHeadlinesRepository repository;

  GetTopHeadlinesUsecase(this.repository);

  Future<Either<ServerFailure, TopHeadlines>> call(String sources) {
    return repository.getTopHeadlines(sources);
  }
}

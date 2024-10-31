import 'package:either_dart/either.dart';
import 'package:newsapp/core/error/failures.dart';
import 'package:newsapp/features/top_headlines/domain/entities/top_headlines.dart';

abstract class GetTopHeadlinesRepository {
  Future<Either<ServerFailure, TopHeadlines>> getTopHeadlines(String sources);
}

import 'package:either_dart/either.dart';
import 'package:newsapp/core/error/failures.dart';
import 'package:newsapp/features/top_headlines/domain/entities/top_headlines.dart';

import '../../domain/repositories/get_top_headlines_repository.dart';
import '../data_sources/top_headlines_data_source.dart';

class GetTopHeadlinesRepositoryImpl implements GetTopHeadlinesRepository {
  final TopHeadlinesDataSource topHeadlinesDataSource;

  GetTopHeadlinesRepositoryImpl(this.topHeadlinesDataSource);

  @override
  Future<Either<ServerFailure, TopHeadlines>> getTopHeadlines(
      String sources) async {
    try {
      final topHeadlines =
          await topHeadlinesDataSource.getTopHeadlines(sources);

      if (topHeadlines.status == 'ok') {
        return Right(topHeadlines);
      } else {
        return Left(
          ServerFailure(
            topHeadlines.message!,
            topHeadlines.code!,
          ),
        );
      }
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

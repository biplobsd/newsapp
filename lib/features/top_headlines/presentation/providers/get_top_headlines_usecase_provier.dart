import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_sources/top_headlines_data_source.dart';
import '../../data/repositories/get_top_headlines_repository_impl.dart';
import '../../domain/usecases/get_top_headlines_usecase.dart';

final topHeadlinesDataSourceProvider = Provider(
  (ref) => TopHeadlinesDataSource(
    Dio(),
  ),
);

final getTopHeadlinesRepositoryImpl = Provider(
  (ref) => GetTopHeadlinesRepositoryImpl(
    ref.read(topHeadlinesDataSourceProvider),
  ),
);

final getTopHeadlinesUsecase = Provider(
  (ref) => GetTopHeadlinesUsecase(
    ref.read(getTopHeadlinesRepositoryImpl),
  ),
);

import 'package:dio/dio.dart';

import '../../domain/entities/top_headlines.dart';

const String baseUrl = 'https://newsapi.org/v2/top-headlines';
const String apiKey = 'e6fb7814efc44788ad86361632946e08';

class TopHeadlinesDataSource {
  final Dio _dio;

  TopHeadlinesDataSource(Dio dio) : _dio = dio;

  Future<TopHeadlines> getTopHeadlines(String sources) async {
    Map<String, dynamic> queryParams = {
      'sources': sources,
      'apiKey': apiKey,
    };

    try {
      Response response = await _dio.get(baseUrl, queryParameters: queryParams);

      if (response.statusCode == 200) {
        print(response.data);
        return TopHeadlines.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } on Exception catch (e) {
      throw Exception('Error: $e');
    }
  }
}

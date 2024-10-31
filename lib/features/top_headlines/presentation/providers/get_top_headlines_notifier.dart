import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/get_top_headlines_usecase.dart';
import 'get_top_headlines_state.dart';
import 'get_top_headlines_usecase_provier.dart';

class GetTopHeadlinesNotifier extends StateNotifier<GetTopHeadlinesState> {
  final GetTopHeadlinesUsecase _usecase;

  GetTopHeadlinesNotifier(this._usecase) : super(const GetTopHeadlinesState());

  Future<void> getTopHeadlines(String sources) async {
    state = state.copyWith(isLoading: true);

    try {
      final data = await _usecase(sources);
      print("Notify");
      print(data);

      if (data.isRight && data.right.articles != null) {
        state = state.copyWith(articles: data.right.articles, isLoading: false);
      } else {
        state =
            state.copyWith(errorMessage: data.left.message, isLoading: false);
      }
    } catch (e) {
      print(e);
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
    state = state.copyWith(isLoading: false);
  }
}

final getTopHeadlinesProvider =
    StateNotifierProvider<GetTopHeadlinesNotifier, GetTopHeadlinesState>((ref) {
  return GetTopHeadlinesNotifier(ref.read(getTopHeadlinesUsecase));
});

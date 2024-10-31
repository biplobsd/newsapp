import 'package:go_router/go_router.dart';
import 'package:newsapp/features/top_headlines/presentation/screens/top_headlines_screen.dart';

final goRouter = GoRouter(
  initialLocation: TopHeadlinesScreen.path,
  routes: [
    GoRoute(
      path: TopHeadlinesScreen.path,
      builder: (context, state) => const TopHeadlinesScreen(),
    ),
  ],
);

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/features/top_headlines/presentation/providers/get_top_headlines_notifier.dart';

import '../widgets/show_top_headlines.dart';

class TopHeadlinesScreen extends ConsumerStatefulWidget {
  static const path = '/topHeadlines';
  const TopHeadlinesScreen({super.key});

  @override
  ConsumerState<TopHeadlinesScreen> createState() => _TopHeadlinesScreenState();
}

class _TopHeadlinesScreenState extends ConsumerState<TopHeadlinesScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(getTopHeadlinesProvider.notifier).getTopHeadlines('techcrunch');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top headlines'),
      ),
      body: const ShowTopHeadlines(),
    );
  }
}

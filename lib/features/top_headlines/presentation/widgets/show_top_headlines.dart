import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/features/top_headlines/presentation/providers/get_top_headlines_notifier.dart';

class ShowTopHeadlines extends ConsumerWidget {
  const ShowTopHeadlines({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gthp = ref.watch(getTopHeadlinesProvider);

    if (gthp.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (gthp.errorMessage != null) {
      return Center(
        child: Text(gthp.errorMessage!),
      );
    }

    if (gthp.articles == null) {
      return const Center(
        child: Text("Please wait! no news yet!"),
      );
    }

    final articles = gthp.articles!;
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    articles[index].urlToImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      articles[index].title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 2),
                    SizedBox(
                      width: double.infinity,
                      child: RichText(
                        text: TextSpan(
                            text: '${articles[index].author} | ',
                            style: Theme.of(context).textTheme.labelSmall,
                            children: [
                              TextSpan(
                                  text: DateFormat('y/M/d h:m a')
                                      .format(articles[index].publishedAt))
                            ]),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      articles[index].description,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

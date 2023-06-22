// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:astha/app/data/models/news_model.dart';
import 'package:astha/app/modules/home/controllers/home_controller.dart';

final homeController =
    StateNotifierProvider.autoDispose<HomeController, List<Post>>((ref) {
  return HomeController();
});

class HomeView extends ConsumerStatefulWidget {
  final String newsType;

  const HomeView({super.key, required this.newsType});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    ref.read(homeController.notifier).getNews(newsType: widget.newsType);
    _scrollController = ScrollController()
      ..addListener(
        () {
          if (_scrollController.position.maxScrollExtent ==
                  _scrollController.position.pixels &&
              !ref.watch(homeController.notifier).isFetchingNextpage) {
            ref.read(homeController.notifier).getNews(
                page: ref.read(homeController.notifier).curentpage += 1);
          }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(homeController);
    final loading = ref.watch(homeController.notifier).isLoading;

    return Scaffold(
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: value
                    .map((e) => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e.shortDesc),
                          ),
                        ))
                    .toList(),
              ),
            ),
    );
  }
}

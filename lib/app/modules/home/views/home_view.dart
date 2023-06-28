// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:astha/app/modules/newsDetail/views/news_detail_view.dart';
import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:astha/app/data/models/news_model.dart';
import 'package:astha/app/modules/home/controllers/home_controller.dart';
import 'package:page_transition/page_transition.dart';

final homeController =
    StateNotifierProvider.autoDispose<HomeController, List<Post>>((ref) {
  return HomeController();
});

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  final String newsType;
  const HomeView({
    super.key,
    required this.newsType,
  });

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    ref.read(homeController.notifier).curentpage;
    ref.read(homeController.notifier).getNews(
          newsType: widget.newsType,
        );

    _scrollController = ScrollController()
      ..addListener(
        () {
          if (_scrollController.position.maxScrollExtent ==
              _scrollController.position.pixels) {
            ref.read(homeController.notifier).getNews(
                  page: ref.read(homeController.notifier).curentpage += 1,
                  newsType: widget.newsType,
                );
          }
        },
      );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    final value = ref.watch(homeController.notifier).newsList;
    value.clear();
    ref.watch(homeController.notifier).intialpageNumber();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(homeController); //rebuild widget
    final loading = ref.watch(homeController.notifier).isLoading;
    final postList = ref.watch(homeController.notifier).newsList;

    return Scaffold(
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              itemCount: postList.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              child: NewsDetailView(post: postList[index]),
                              type: PageTransitionType.fade,
                            ));
                      },
                      child: Column(
                        children: [
                          Hero(
                            tag: postList[index].id,
                            child: CachedNetworkImage(
                              imageUrl: postList[index].titlePhoto,
                            ),
                          ),
                          Text(postList[index].shortDesc),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
    );
  }
}

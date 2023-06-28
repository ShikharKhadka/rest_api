import 'package:astha/app/data/api/news_api.dart';
import 'package:astha/app/data/models/news_model.dart';
import 'package:astha/app/locator/locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends StateNotifier<List<Post>> {
  final NewsApi _newsApi = locator.get<NewsApi>();
  bool isLoading = false;
  HomeController() : super([]);
  int curentpage = 0;
  List<Post> newsList = [];
  bool isFetchingNextpage = false;


  Future getNews(
      {int page = 0,
      bool isFirstCall = true,
      String? newsType,
      Post? post}) async {
    isLoading = true;
    var result = await _newsApi.getNews(newsType: newsType, page: page);
    if (result != null) {
      newsList.addAll(result.posts);
      state = [...state, ...result.posts];
    }
    isLoading = false;
  }

  intialpageNumber() {
    curentpage = 0;
  }
}

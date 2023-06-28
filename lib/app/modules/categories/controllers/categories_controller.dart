import 'package:astha/app/data/api/category_api.dart';
import 'package:astha/app/data/models/category_model.dart';
import 'package:astha/app/locator/locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesController extends StateNotifier<List<Result>> {
  final CategoryApi _categoryApi = locator.get<CategoryApi>();
  CategoriesController() : super([]);
  List<Result> categoryList = [];
  bool isLoading = false;

  Future<void> getCategoryList() async {
    isLoading = true;
    final categoryResult = await _categoryApi.getCategory();
    if (categoryResult != null) {
      state = [...state, ...categoryResult.results];
    }
    isLoading = false;
  }
}

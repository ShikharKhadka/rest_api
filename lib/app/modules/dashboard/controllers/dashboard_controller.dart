import 'package:astha/app/data/models/category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class DashboardController extends StateNotifier<List<CategoryModel>> {
  DashboardController() : super([]);
  List<CategoryModel> categoryList = [];
}

import 'dart:convert';

import 'package:astha/app/data/api/api_endpoints/base_client/base_client.dart';
import 'package:astha/app/data/api/api_endpoints/endpoints.dart';
import 'package:astha/app/data/models/category_model.dart';
import 'package:astha/app/locator/locator.dart';

class CategoryApi {
  final BaseClient _baseClient = locator.get<BaseClient>();
  // CategoryApi({required BaseClient baseClient}) : _baseClient = baseClient;

  Future<CategoryModel?> getCategory() async {
    var response = await _baseClient.dio.get(ApiEndpoints.category);
    if (response.statusCode == 200) {
      // var decodedResponse =
      return CategoryModel.fromJson((response.data));
      // return decodedResponse;
    }
    return null;
  }
}

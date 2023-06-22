import 'package:astha/app/data/api/api_endpoints/base_client/base_client.dart';
import 'package:astha/app/data/api/api_endpoints/endpoints.dart';
import 'package:astha/app/data/models/news_model.dart';
import 'package:astha/app/modules/utils/enum.dart';

class NewsApi {
  final BaseClient _baseClient;
  NewsApi({required BaseClient baseClient}) : _baseClient = baseClient;

  Future<NewsModel?> getNews({int? page = 0,String? newsType}) async {
    var response = await _baseClient.dio.get(
      ApiEndpoints.news,
      queryParameters: {"page": '$page', "cat": newsType},
    );
    if (response.statusCode == 200) {
      return NewsModel.fromJson(response.data);
    }
    return null;
  }
}

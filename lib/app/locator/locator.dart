import 'package:astha/app/data/api/api_endpoints/base_client/base_client.dart';
import 'package:astha/app/data/api/category_api.dart';
import 'package:astha/app/data/api/news_api.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => BaseClient());
  locator.registerLazySingleton(() => NewsApi(baseClient: locator()));
  locator.registerLazySingleton(() => CategoryApi());
}

import 'package:astha/app/data/api/api_endpoints/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseClient {
  late final Dio _dio = _createDio();
  Dio get dio => _dio;

  Dio _createDio() {
    Dio dio = Dio();
    dio.options = BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      contentType: 'application/json',
    );
    dio.interceptors.addAll([PrettyDioLogger(requestBody: false)]);
    return dio;
  }
}

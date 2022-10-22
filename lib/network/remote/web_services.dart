import 'package:dio/dio.dart' hide Headers;
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/app_model.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: 'https://api.tvmaze.com/singlesearch/')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  static final options =
      buildCacheOptions(const Duration(days: 3), forceRefresh: true);

  static Dio createAndSetupDio() {
    Dio dio = Dio();
    dio.options.connectTimeout = 10 * 1000;
    dio.options.receiveTimeout = 10 * 1000;
    dio.interceptors.add(DioCacheManager(CacheConfig(
      baseUrl: "https://api.tvmaze.com/singlesearch/",
    )).interceptor);

    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: true,
        requestBody: true,
      ),
    );

    return dio;
  }

  @GET("https://api.tvmaze.com/singlesearch/shows")
  Future<Model> getInfo(
      @DioOptions() Options options, @Query('q', encoded: true) String s);

  @GET("https://api.tvmaze.com/singlesearch/shows")
  Future<Model> getSeriesDetails(@DioOptions() Options options,
      @Query('q', encoded: true) String q, @Query('embed') String embed);
}

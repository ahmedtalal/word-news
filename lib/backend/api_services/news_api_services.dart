import 'package:chopper/chopper.dart';
part 'news_api_services.chopper.dart';

@ChopperApi(baseUrl: "https://newsapi.org/v2")
abstract class NewsApiServices extends ChopperService {
  @Get(path: "/top-headlines")
  Future<Response> getTopHeadlinesNews(
    @Query('country') String country,
    @Query('apiKey') String apiKey,
  );

  @Get(path: "/top-headlines")
  Future<Response> getCategoryNews(
    @Query('country') String country,
    @Query('category') String category,
    @Query('apiKey') String apiKey,
  );

  static NewsApiServices createInstance() {
    final client = ChopperClient(
      baseUrl: "https://newsapi.org/v2",
      services: [_$NewsApiServices()],
      converter: JsonConverter(),
    );
    return _$NewsApiServices(client);
  }
}

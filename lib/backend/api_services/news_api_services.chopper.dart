// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$NewsApiServices extends NewsApiServices {
  _$NewsApiServices([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NewsApiServices;

  @override
  Future<Response<dynamic>> getTopHeadlinesNews(String country, String apiKey) {
    final $url = 'https://newsapi.org/v2/top-headlines';
    final $params = <String, dynamic>{'country': country, 'apiKey': apiKey};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCategoryNews(
      String country, String category, String apiKey) {
    final $url = 'https://newsapi.org/v2/top-headlines';
    final $params = <String, dynamic>{
      'country': country,
      'category': category,
      'apiKey': apiKey
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}

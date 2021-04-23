import 'package:chopper/chopper.dart';
import 'package:worldnews/backend/repositories/repository_model.dart';
import 'package:worldnews/backend/api_services/news_api_services.dart';

class NewsRepoImplement extends RepositoryModel {
  NewsApiServices _newsApiServices = NewsApiServices.createInstance();
  final String _apiKey = "5e32da73771b4565b18f8cb9560a45e2";

  @override
  deleteData(model) {
    throw UnimplementedError();
  }

  @override
  getAllData(model) {
    Future<Response> response = _newsApiServices.getTopHeadlinesNews(
      model,
      _apiKey,
    );
    return response;
  }

  @override
  getSpecialData(model) {
    Future<Response> response = _newsApiServices.getCategoryNews(
      model.country,
      model.category,
      _apiKey,
    );
    return response;
  }

  @override
  updateData(model) {
    throw UnimplementedError();
  }

  @override
  addData(model) {
    throw UnimplementedError();
  }
}

import 'package:flutter/material.dart';
import 'package:worldnews/backend/repositories/repository_model.dart';
import 'package:worldnews/models/api_parameter_model.dart';
import 'package:worldnews/providers/bloc_pattern/api_bloc/news_events.dart';
import 'package:worldnews/providers/bloc_pattern/api_bloc/news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {
  RepositoryModel repositoryModel;
  String model;
  ApiParameterModel categoryModel;
  NewsBloc({
    @required this.repositoryModel,
  }) : super(NewsInitialState());

  @override
  Stream<NewsState> mapEventToState(NewsEvents event) async* {
    if (event is FetchNewsEvent) {
      yield NewsLoadingState();
      try {
        print(model);
        final response = repositoryModel.getAllData(model);
        yield NewsLoadedState(response: response);
      } catch (e) {
        yield NewsErrorState();
      }
    } else if (event is FetchCategoryNewsEvent) {
      yield NewsLoadingState();
      try {
        final response = repositoryModel.getSpecialData(categoryModel);
        yield NewsLoadedState(response: response);
      } catch (e) {
        yield NewsErrorState();
      }
    }
  }
}

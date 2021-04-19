import 'package:flutter/material.dart';

@immutable
abstract class NewsState{}

class NewsInitialState extends NewsState{}

class NewsLoadingState extends NewsState{}

class NewsLoadedState extends NewsState{
  final dynamic response ;
  NewsLoadedState({@required this.response});
}

class NewsErrorState extends NewsState{}


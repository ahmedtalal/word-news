import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldnews/backend/repositories/firebase/firebase_repo_imp.dart';
import 'package:worldnews/backend/repositories/repository_model.dart';
import 'package:worldnews/models/user_model.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_events.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_states.dart';

class FirebaseBloc extends Bloc<FirebaseEvents, FirebaseStates> {
  UserModel userModel;
  var newsModel ;
  RepositoryModel repositoryModel;
  var response ;
  FirebaseBloc({
    @required this.repositoryModel,
  }) : super(InitialState());

  @override
  Stream<FirebaseStates> mapEventToState(FirebaseEvents event) async*{
    if(event is RegisterEvents){
      try{
        response = await (repositoryModel as FirebaseRepoImplement).register(userModel);
        yield AuthCheckedState();
      }catch(e){
        yield AuthErrorState();
      }
    }else if(event is LoginEvents){
      try{
        response = (repositoryModel as FirebaseRepoImplement).register(userModel);
        yield AuthCheckedState();
      }catch(e){
        yield AuthErrorState();
      }
    }else if(event is AddFavoriteEvent){
      try{
        response = repositoryModel.addData(newsModel);
        yield AuthCheckedState();
      }catch(e){
        yield AuthErrorState();
      }
    }else if(event is FetchFavoriteItem){
      yield LoadingState();
      try{
        final data = repositoryModel.getAllData(userModel);
        yield LoadedState(response: data);
      }catch(e){
        yield LoadingErrorState();
      }
    }else if(event is FetchUserData){
      yield LoadingState();
      try{
        final data = repositoryModel.getSpecialData(userModel);
        yield LoadedState(response: data);
      }catch(e){
        yield LoadingErrorState();
      }
    }else if(event is DeleteFavoriteItem){
      try{
        response = repositoryModel.deleteData(newsModel);
        yield AuthCheckedState();
      }catch(e){
        yield AuthErrorState();
      }
    }else if(event is SetItemView) {
      try{
        response = (repositoryModel as FirebaseRepoImplement).setNumOfViews(newsModel);
      }catch(e){
        yield AuthErrorState();
      }
    }else if(event is FetchItemViews){
      yield LoadingViewsState();
      try{
        final data = (repositoryModel as FirebaseRepoImplement).getItemViews(newsModel);
        yield LoadedViewsState(response: data);
      }catch(e){
        yield LoadingViewsErrorState();
      }
    }else if(event is UpdateItemViews){
      try{
        repositoryModel.updateData(newsModel);
      }catch(e){
        yield AuthErrorState();
      }
    }
  }
}

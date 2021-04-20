import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldnews/backend/repositories/firebase/firebase_repo_imp.dart';
import 'package:worldnews/backend/repositories/repository_model.dart';
import 'package:worldnews/models/user_model.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_events.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_states.dart';

class FirebaseBloc extends Bloc<FirebaseEvents, FirebaseStates> {
  UserModel userModel;
  RepositoryModel repositoryModel;
  var response ;
  FirebaseBloc({
    @required this.repositoryModel,
  }) : super(InitialState());

  @override
  Stream<FirebaseStates> mapEventToState(FirebaseEvents event) async*{
    if(event is RegisterEvents){
      try{
        response = (repositoryModel as FirebaseRepoImplement).register(userModel);
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
        response = repositoryModel.addData(userModel);
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
    }
  }
}

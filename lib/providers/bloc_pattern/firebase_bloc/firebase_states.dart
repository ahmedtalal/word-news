import 'package:flutter/material.dart';

@immutable
abstract class FirebaseStates {
  
}

class InitialState extends FirebaseStates{
  
}

class AuthCheckedState extends FirebaseStates{
}

class AuthErrorState extends FirebaseStates{}

class LoadingState extends FirebaseStates{}

class LoadingErrorState extends FirebaseStates{}

class LoadedState extends FirebaseStates{
  final dynamic response ;
  LoadedState({@required this.response});
}




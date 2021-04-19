import 'package:flutter/material.dart';

class UserModel {
  String name, email, id, password;
  UserModel({
    @required this.name,
    @required this.email,
    @required this.id,
    @required this.password,
  });
  UserModel.loginModel({
    @required this.email,
    @required this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.email = json["email"];
  }

  static Map<String, dynamic> toJson(UserModel model) => {
        "id": model.id,
        "name": model.name,
        "email": model.email,
      };
}

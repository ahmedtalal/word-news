import 'package:flutter/material.dart';

class NewsModel {
  String id ,title, description, articleUrl, imageUrl, publishTime, name;
  NewsModel({
    @required this.id,
    @required this.name,
    @required this.title,
    @required this.description,
    @required this.articleUrl,
    @required this.imageUrl,
    @required this.publishTime,
  });

  NewsModel.fromJson(Map<String,dynamic> json){
    this.id = json["id"];
    this.name = json["name"];
    this.title = json["title"];
    this.description = json["description"];
    this.articleUrl = json["url"];
    this.imageUrl = json["urlToImage"];
    this.publishTime = json["publishTime"];
  }

  static Map<String,dynamic> toJson(NewsModel model)=>{
    "id":model.id,
    "name":model.name,
    "title":model.title,
    "description":model.description,
    "url":model.articleUrl,
    "urlToImage":model.imageUrl,
    "publishTime":model.publishTime,
  };
}

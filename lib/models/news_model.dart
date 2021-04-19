import 'package:flutter/material.dart';

class NewsModel {
  String title, description, articleUrl, imageUrl, publishTime, name;
  NewsModel({
    @required this.name,
    @required this.title,
    @required this.description,
    @required this.articleUrl,
    @required this.imageUrl,
    @required this.publishTime,
  });

  NewsModel.fromJson(Map<String,dynamic> json){
    this.name = json["name"];
    this.title = json["title"];
    this.description = json["description"];
    this.articleUrl = json["url"];
    this.imageUrl = json["urlToImage"];
    this.publishTime = json["publishTime"];
  }

  static Map<String,dynamic> toJson(NewsModel model)=>{
    "name":model.name,
    "title":model.title,
    "description":model.description,
    "url":model.articleUrl,
    "urlToImage":model.imageUrl,
    "publishTime":model.publishTime,
  };
}

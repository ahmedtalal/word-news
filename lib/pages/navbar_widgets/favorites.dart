import 'package:flutter/material.dart';
import 'package:worldnews/components/connection_error.dart';
import 'package:worldnews/components/header_widget.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.08,
              ),
              HeaderWidget(title: "Favorites"),
              connectionError(
                "No favorite items at this time",
                height,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

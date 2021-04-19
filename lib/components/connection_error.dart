import 'package:flutter/material.dart';
import 'package:worldnews/constants.dart';

Widget connectionError(String message, double height) {
  return Center(
    child: Container(
      height: height * 0.4,
      child: Column(
        children: [
          Image(
            image: AssetImage(
              Constants.empty,
            ),
            height: height * 0.27,
          ),
          Text(
            message,
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: Constants.appFont2,
            ),
          ),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:worldnews/constants.dart';

// ignore: must_be_immutable
class NewsCategory extends StatelessWidget {
  String image, title;
  Function onClick;
  NewsCategory({
    @required this.title,
    @required this.image,
    @required this.onClick,
  });
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onClick,
      child: Container(
        height: height * 0.22,
        width: width * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: height*0.045,
            width: width*0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.red,
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: Constants.appFont2,
                  fontSize: 13.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

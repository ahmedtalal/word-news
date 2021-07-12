import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:worldnews/constants.dart';

// ignore: must_be_immutable
class NewsView extends StatelessWidget {
  Function onClick;
  Map<String, dynamic> newsList;
  NewsView({@required this.onClick, @required this.newsList});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Card(
        elevation: 3.0,
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90.0,
                width: 90.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: newsList["urlToImage"],
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Image(
                    image: AssetImage(
                      Constants.empty,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        newsList["title"],
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: Constants.appFont2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

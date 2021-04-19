import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:worldnews/components/action_widget.dart';
import 'package:worldnews/constants.dart';
import 'package:worldnews/pages/authentication/register.dart';

// ignore: must_be_immutable
class NewsDetails extends StatefulWidget {
  String newsType;
  Map<String, dynamic> newsModel;
  NewsDetails({@required this.newsType, @required this.newsModel});
  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.056,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActionWidget(
                    onClick: () {
                      Navigator.of(context).pop(context);
                    },
                    icon: Icons.arrow_back_ios_rounded,
                  ),
                  Row(
                    children: [
                      ActionWidget(
                        onClick: () {},
                        icon: Icons.share,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      ActionWidget(
                        onClick: () {
                          if (FirebaseAuth.instance.currentUser != null) {
                            // your favorite code here
                            print("true");
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Authentication Error"),
                                  content: Text(
                                    "you must register before add favorite item",
                                    style: TextStyle(
                                      fontFamily: Constants.appFont2,
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                          fontFamily: Constants.appFont2,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ElevatedButton(
                                      child: Text(
                                        "Register",
                                        style: TextStyle(
                                          fontFamily: Constants.appFont2,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (C) => Register(),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        icon: Icons.favorite_border,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.033,
              ),
              Container(
                height: height * 0.24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: widget.newsModel["urlToImage"] != null
                        ? NetworkImage(
                            widget.newsModel["urlToImage"],
                          )
                        : AssetImage(
                            Constants.empty,
                          ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.newsModel["source"]["name"],
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontFamily: Constants.appFont2,
                          ),
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.visibility,
                                  color: Colors.red[300],
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Text(
                                  "41.5K",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Constants.appFont2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 9.0,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red[300],
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Text(
                                  "700",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Constants.appFont2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        widget.newsModel["title"],
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: Constants.appFont2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.028,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.newsModel["publishedAt"]
                              .toString()
                              .substring(0, 15),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontFamily: Constants.appFont2,
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        InkWell(
                          onTap: () {
                            String url = widget.newsModel["url"].toString();
                            Constants.launchUrl(url);
                          },
                          child: Text(
                            "Source",
                            style: TextStyle(
                                fontSize: 17.0,
                                fontFamily: Constants.appFont2,
                                color: Colors.red,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        widget.newsModel["description"] == null
                            ? "No description"
                            : widget.newsModel["description"],
                        style: TextStyle(
                          fontFamily: Constants.appFont2,
                          color: Colors.grey[800],
                          fontSize: 17.0,
                        ),
                      ),
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

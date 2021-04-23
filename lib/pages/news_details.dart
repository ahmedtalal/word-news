import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:worldnews/components/action_widget.dart';
import 'package:worldnews/constants.dart';
import 'package:worldnews/models/news_model.dart';
import 'package:worldnews/pages/authentication/register.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_bloc.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_events.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_states.dart';

// ignore: must_be_immutable
class NewsDetails extends StatefulWidget {
  String newsType;
  Map<String, dynamic> newsModel;
  NewsDetails({@required this.newsType, @required this.newsModel});
  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  int numOfFavorites = 0;
  String itemId;
  bool result = false;
  int itemViews;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var provider = BlocProvider.of<FirebaseBloc>(context);
    provider.add(FetchFavoriteItem());
    provider.newsModel = itemId;
    provider.add(FetchItemViews());

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
                      _validateFavorite(provider),
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
                                BlocBuilder<FirebaseBloc, FirebaseStates>(
                                  builder: (context, state) {
                                    var response;
                                    if (state is LoadingState) {
                                      result = false;
                                    } else if (state is LoadedState) {
                                      result = true;
                                      response = state.response;
                                    } else if (state is LoadingErrorState) {
                                      result = false;
                                    }
                                    return StreamBuilder<DocumentSnapshot>(
                                      stream: response,
                                      builder: (context, snapshot) {
                                        if (result == false) {
                                          return Text(
                                            "0",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: Constants.appFont2,
                                            ),
                                          );
                                        }
                                        if (!snapshot.hasData) {
                                          result = false;
                                          return Text(
                                            "0",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: Constants.appFont2,
                                            ),
                                          );
                                        } else {
                                          itemViews = snapshot.data["num"];
                                          return Text(
                                            "$itemViews",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: Constants.appFont2,
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
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
                                  "$numOfFavorites",
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
                            if (result == false) {
                              setState(() {
                                provider.newsModel = itemId;
                                provider.add(SetItemView());
                              });
                            } else {
                              setState(() {
                                provider.newsModel = {
                                  "num": itemViews,
                                  "id": itemId,
                                };
                                provider.add(UpdateItemViews());
                              });
                            }
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

  Widget _validateFavorite(FirebaseBloc provider) {
    return BlocBuilder<FirebaseBloc, FirebaseStates>(
      builder: (context, state) {
        bool result;
        var response;
        if (state is LoadingErrorState) {
          result = false;
        } else if (state is LoadedState) {
          result = true;
          response = state.response;
        }
        return StreamBuilder<QuerySnapshot>(
          stream: response,
          builder: (context, snapshot) {
            bool res = false;
            if (result == false) {
              res = false;
            } else {
              numOfFavorites = snapshot.data.size;
              snapshot.data.docs.forEach((element) {
                if (element.data()["title"] == widget.newsModel["title"]) {
                  itemId = element.data()["id"];
                  res = true;
                  return;
                }
              });
            }
            return ActionWidget(
              onClick: () {
                if (FirebaseAuth.instance.currentUser != null) {
                  // your favorite code here
                  if (res == true) {
                    provider.newsModel = itemId;
                    provider.add(DeleteFavoriteItem());
                  } else {
                    var uId = Uuid();
                    String id = uId.v1();
                    NewsModel model = NewsModel(
                      id: id,
                      name: widget.newsModel["name"],
                      title: widget.newsModel["title"],
                      description: widget.newsModel["description"],
                      articleUrl: widget.newsModel["articleUrl"],
                      imageUrl: widget.newsModel["imageUrl"],
                      publishTime: widget.newsModel["publishTime"],
                    );
                    provider.newsModel = model;
                    provider.add(AddFavoriteEvent());
                  }
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
              icon: res == false ? Icons.favorite_border : Icons.favorite,
            );
          },
        );
      },
    );
  }
}

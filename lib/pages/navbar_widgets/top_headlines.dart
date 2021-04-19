import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:worldnews/components/connection_error.dart';
import 'package:worldnews/components/news_view.dart';
import 'package:worldnews/pages/news_details.dart';
import 'package:worldnews/providers/bloc_pattern/api_bloc/news_events.dart';
import 'package:worldnews/providers/bloc_pattern/api_bloc/news_state.dart';
import 'package:worldnews/providers/bloc_pattern/api_bloc/news_bloc.dart';
import 'package:worldnews/components/header_widget.dart';
import 'package:worldnews/constants.dart';
import 'package:worldnews/providers/provider/Country_provider.dart';

class TopHeadLines extends StatefulWidget {
  @override
  _TopHeadLinesState createState() => _TopHeadLinesState();
}

class _TopHeadLinesState extends State<TopHeadLines> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var provider = Provider.of<CountryProvider>(context);
    // ignore: close_sinks
    NewsBloc _newsBloc = BlocProvider.of<NewsBloc>(context);
    _newsBloc.add(FetchNewsEvent());
    _newsBloc.model = Constants.getPrefCountry(provider.country);

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
              HeaderWidget(title: "Top Headlines"),
              Expanded(
                child: BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if (state is NewsLoadingState) {
                      print("loading");
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is NewsLoadedState) {
                      print("loaded");
                      return FutureBuilder<Response>(
                        future: state.response,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (!snapshot.hasData) {
                            return connectionError(
                              "the connection with server was lost",
                              height,
                            );
                          } else {
                            Map<String, dynamic> news =
                                json.decode(snapshot.data.bodyString);
                            print(news);
                            print(news["totalResults"]);
                            List newsList = news["articles"];
                            return ListView.builder(
                              itemCount: newsList.length,
                              itemBuilder: (context, index) {
                                return NewsView(
                                  onClick: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (c) => NewsDetails(
                                          newsType: "topHeadlines",
                                          newsModel: newsList[index],
                                        ),
                                      ),
                                    );
                                  },
                                  newsList: newsList[index],
                                );
                              },
                            );
                          }
                        },
                      );
                    } else if (state is NewsErrorState) {
                      return connectionError(
                        "the connection with server was lost",
                        height,
                      );
                    } else {
                      print("df");
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

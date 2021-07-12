import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:worldnews/components/action_widget.dart';
import 'package:worldnews/components/connection_error.dart';
import 'package:worldnews/components/news_view.dart';
import 'package:worldnews/constants.dart';
import 'package:worldnews/models/api_parameter_model.dart';
import 'package:worldnews/pages/news_details.dart';
import 'package:worldnews/providers/bloc_pattern/api_bloc/news_bloc.dart';
import 'package:worldnews/providers/bloc_pattern/api_bloc/news_events.dart';
import 'package:worldnews/providers/bloc_pattern/api_bloc/news_state.dart';
import 'package:worldnews/providers/provider/Country_provider.dart';

// ignore: must_be_immutable
class NewsCategoryDetails extends StatefulWidget {
  String category;
  NewsCategoryDetails({
    @required this.category,
  });
  @override
  _NewsCategoryDetailsState createState() => _NewsCategoryDetailsState();
}

class _NewsCategoryDetailsState extends State<NewsCategoryDetails> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var provider = Provider.of<CountryProvider>(context);
    String countryFormat = Constants.getPrefCountry(provider.country);
    ApiParameterModel parameterModel = ApiParameterModel(
      country: countryFormat,
      category: widget.category.toLowerCase(),
    );
    // ignore: close_sinks
    var categoryProvider = BlocProvider.of<NewsBloc>(context);
    categoryProvider.add(FetchCategoryNewsEvent());
    categoryProvider.categoryModel= parameterModel;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            bottom: 15.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.09,
              ),
              Row(
                children: [
                  ActionWidget(
                    onClick: () {
                      Navigator.of(context).pop(context);
                    },
                    icon: Icons.arrow_back_ios_rounded,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    widget.category,
                    style: TextStyle(
                      fontFamily: Constants.appFont2,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
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

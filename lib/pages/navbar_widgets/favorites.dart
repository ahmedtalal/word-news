import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldnews/components/connection_error.dart';
import 'package:worldnews/components/header_widget.dart';
import 'package:worldnews/components/news_view.dart';
import 'package:worldnews/pages/news_details.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_bloc.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_events.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_states.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var blocProvider = BlocProvider.of<FirebaseBloc>(context);
    blocProvider.add(FetchFavoriteItem());

    return Scaffold(
      backgroundColor: Colors.white,
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
              BlocBuilder<FirebaseBloc, FirebaseStates>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoadedState) {
                    return StreamBuilder<QuerySnapshot>(
                      stream: state.response,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              return NewsView(
                                onClick: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (c) => NewsDetails(
                                        newsType: "topHeadlines",
                                        newsModel:
                                            snapshot.data.docs.cast()[index],
                                      ),
                                    ),
                                  );
                                },
                                newsList: snapshot.data.docs.cast()[index],
                              );
                            },
                          );
                        }
                      },
                    );
                  } else if (state is LoadingErrorState) {
                    return connectionError(
                      "No favorites item at this time",
                      height,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

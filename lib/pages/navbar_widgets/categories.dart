import 'package:flutter/material.dart';
import 'package:worldnews/components/header_widget.dart';
import 'package:worldnews/components/news_category.dart';
import 'package:worldnews/constants.dart';
import 'package:worldnews/pages/news_category_details.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
              HeaderWidget(title: "Categories"),
              SizedBox(
                height: height * 0.03,
              ),
              Expanded(
                  child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NewsCategory(
                        title: "Business",
                        image: Constants.business,
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => NewsCategoryDetails(
                                category: "Business",
                              ),
                            ),
                          );
                        },
                      ),
                      NewsCategory(
                        title: "Entertainment",
                        image: Constants.entertainment,
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => NewsCategoryDetails(
                                category: "Entertainment",
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NewsCategory(
                        title: "Health",
                        image: Constants.health,
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => NewsCategoryDetails(
                                category: "Health",
                              ),
                            ),
                          );
                        },
                      ),
                      NewsCategory(
                        title: "Science",
                        image: Constants.science,
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => NewsCategoryDetails(
                                category: "Science",
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NewsCategory(
                        title: "Sports",
                        image: Constants.sports,
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => NewsCategoryDetails(
                                category: "Sports",
                              ),
                            ),
                          );
                        },
                      ),
                      NewsCategory(
                        title: "Technology",
                        image: Constants.technology,
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => NewsCategoryDetails(
                                category: "Technology",
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

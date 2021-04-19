import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:worldnews/constants.dart';
import 'package:worldnews/pages/navbar_widgets/categories.dart';
import 'package:worldnews/pages/navbar_widgets/favorites.dart';
import 'package:worldnews/pages/navbar_widgets/settings.dart';
import 'package:worldnews/pages/navbar_widgets/top_headlines.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> pages = [
    TopHeadLines(),
    Categories(),
    Favorites(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        opacity: 0.3,
        currentIndex: currentIndex,
        onTap: changePage,
        elevation: 8.0,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
        items: [
          // home page
          BubbleBottomBarItem(
            title: Text(
              "Home",
              style: TextStyle(
                fontFamily: Constants.appFont2,
                fontSize: 12.0,
              ),
            ),
            backgroundColor: Colors.red[300],
            icon: Image.asset(
              Constants.homePage,
              height: 18.0,
              color: Colors.blueGrey[600],
            ),
            activeIcon: Image.asset(
              Constants.homePage,
              height: 18.0,
              color: Colors.red,
            ),
          ),
          // categories page
          BubbleBottomBarItem(
            title: Text(
              "Categories",
              style: TextStyle(
                fontFamily: Constants.appFont2,
                fontSize: 12.0,
              ),
            ),
            backgroundColor: Colors.deepPurple[300],
            icon: Image.asset(
              Constants.categoriesPage,
              height: 18.0,
              color: Colors.blueGrey[600],
            ),
            activeIcon: Image.asset(
              Constants.categoriesPage,
              height: 18.0,
              color: Colors.deepPurple,
            ),
          ),
          // favorites
          BubbleBottomBarItem(
            title: Text(
              "Favorites",
              style: TextStyle(
                fontFamily: Constants.appFont2,
                fontSize: 12.0,
              ),
            ),
            backgroundColor: Colors.indigo[300],
            icon: Image.asset(
              Constants.favoritesPage,
              height: 18.0,
              color: Colors.blueGrey[600],
            ),
            activeIcon: Image.asset(
              Constants.favoritesPage,
              height: 18.0,
              color: Colors.indigo,
            ),
          ),
          // settings
          BubbleBottomBarItem(
            title: Text(
              "Settings",
              style: TextStyle(
                fontFamily: Constants.appFont2,
                fontSize: 12.0,
              ),
            ),
            backgroundColor: Colors.purple[300],
            icon: Image.asset(
              Constants.settingPage,
              height: 18.0,
              color: Colors.blueGrey[600],
            ),
            activeIcon: Image.asset(
              Constants.settingPage,
              height: 18.0,
              color: Colors.purple,
            ),
          ),
        ],
      ),
      body: pages.elementAt(currentIndex),
    );
  }
}

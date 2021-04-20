import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Constants {
  static final String splashScreenImage = "assets/images/newssplashscreen.jpg";
  static final String locationImage = "assets/images/location.png";
  static final String appFont = "B612";
  static final String appFont2 = "JosefinSans";

  static final String argentina = "assets/images/argentina.png";
  static final String australia = "assets/images/australia.png";
  static final String brazil = "assets/images/brazil.png";
  static final String canada = "assets/images/canada.png";
  static final String china = "assets/images/china.png";
  static final String egypt = "assets/images/egypt.png";
  static final String france = "assets/images/france.png";
  static final String germany = "assets/images/germany.png";
  static final String india = "assets/images/india.png";
  static final String italy = "assets/images/italy.png";
  static final String japan = "assets/images/japan.png";
  static final String morocco = "assets/images/morocco.png";
  static final String russia = "assets/images/russia.png";
  static final String saudiarabia = "assets/images/saudiarabia.png";
  static final String southafrica = "assets/images/southafrica.png";
  static final String southkorea = "assets/images/southkorea.png";
  static final String turkey = "assets/images/turkey.png";
  static final String unitedstates = "assets/images/unitedstates.png";

  static final String homePage = "assets/images/home.png";
  static final String categoriesPage = "assets/images/categories.png";
  static final String favoritesPage = "assets/images/favorites.png";
  static final String settingPage = "assets/images/settings.png";

  static final String health = "assets/images/health.jpg";
  static final String business = "assets/images/business.jpg";
  static final String science = "assets/images/science.jpg";
  static final String sports = "assets/images/sports.jpg";
  static final String technology = "assets/images/technology.jpeg";
  static final String entertainment = "assets/images/entertainment.jpg";

  static final String empty = "assets/images/emptysearch.png";
  static final String registerImage = "assets/images/register.png";
  static final String userImage = "assets/images/user.png";

  static String getPrefCountry(String countryName) {
    String country;
    switch (countryName) {
      case "Egypt":
        country = "eg";
        break;
      case "Australia":
        country = "au";
        break;
      case "Brazil":
        country = "br";
        break;
      case "Canada":
        country = "ca";
        break;
      case "China":
        country = "cn";
        break;
      case "Argentina":
        country = "ar";
        break;
      case "France":
        country = "fr";
        break;
      case "India":
        country = "in";
        break;
      case "Germany":
        country = "eg";
        break;
      case "Italy":
        country = "it";
        break;
      case "Japan":
        country = "jp";
        break;
      case "Morocco":
        country = "ma";
        break;
      case "Russia":
        country = "ru";
        break;
      case "Saudi Arabia":
        country = "sa";
        break;
      case "South Korea":
        country = "kr";
        break;
      case "South Africa":
        country = "za";
        break;
      case "Turkey":
        country = "tr";
        break;
      case "United States":
        country = "us";
        break;
    }
    return country;
  }

  static void shared(String url, String message, BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(
      "${message + url}",
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

  static launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "could not launch $url";
    }
  }
}

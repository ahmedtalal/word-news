import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worldnews/constants.dart';
import 'package:worldnews/pages/choose_country.dart';
import 'package:worldnews/pages/home.dart';
import 'package:worldnews/providers/provider/Country_provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<CountryProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            Image(
              height: height * 0.5,
              image: AssetImage(Constants.splashScreenImage),
            ),
            Container(
              width: width * 0.62,
              child: Center(
                child: Text(
                  "Nice to see you in our World News App",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: Constants.appFont2,
                      color: Colors.grey[700],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  print(provider.country);
                  if(provider.country == "null"){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (C) => ChooseCountry(),
                      ),
                    );
                  }else {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (C) => Home(),
                      ),
                    );
                  }

                },
                child: Container(
                  width: width * 0.62,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontFamily: Constants.appFont2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

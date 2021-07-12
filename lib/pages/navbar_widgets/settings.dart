import 'package:flutter/material.dart';
import 'package:worldnews/components/header_widget.dart';
import 'package:worldnews/components/setting_view.dart';
import 'package:worldnews/constants.dart';
import 'package:worldnews/pages/authentication/register.dart';
import 'package:worldnews/pages/choose_country.dart';
import 'package:worldnews/pages/contact_us.dart';
import 'package:worldnews/pages/my_profile.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String url =
      "https://play.google.com/store/apps/details?id=ahmed.codedev.worldnews&referrer=utm_source%3Dgoogle";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
              HeaderWidget(title: "Settings"),
              SizedBox(
                height: height * 0.05,
              ),
              Expanded(
                child: ListView(
                  children: [
                    // SettingView(
                    //   title: "MyProfile",
                    //   onClick: () {
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (c) => MyProfile(),
                    //       ),
                    //     );
                    //   },
                    // ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    SettingView(
                      title: "ShareApp",
                      onClick: () {
                        String message = "World news app : ";
                        Constants.shared(url, message, context);
                      },
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    SettingView(
                      title: "Rate Us",
                      onClick: () {
                        Constants.launchUrl(url);
                      },
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    SettingView(
                      title: "Contact Us",
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (C) => ContactUs(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    SettingView(
                      title: "Change Country",
                      onClick: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (C) => ChooseCountry(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    // SettingView(
                    //   title: "Sign Up",
                    //   onClick: () {
                    //     Navigator.of(context).pushReplacement(
                    //       MaterialPageRoute(
                    //         builder: (C) => Register(),
                    //       ),
                    //     );
                    //   },
                    // ),
                    SizedBox(
                      height: height * 0.03,
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

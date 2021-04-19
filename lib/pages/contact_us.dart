import 'package:flutter/material.dart';
import 'package:worldnews/components/action_widget.dart';
import 'package:worldnews/constants.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
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
                    "Contact Us",
                    style: TextStyle(
                      fontFamily: Constants.appFont2,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.05,),
              Text(
                "You can follow us from these links",
                style: TextStyle(
                  fontFamily: Constants.appFont2,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              // facebook card ???????????????????????
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text(
                          "Facebook",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: Constants.appFont2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_right_rounded,
                          size: 30.0,
                        ),
                        onTap: () {
                          String url = "https://www.facebook.com/ahmd.talal.5";
                          Constants.launchUrl(url);
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    // instgram card ??????????????????????
                    Card(
                      child: ListTile(
                        title: Text(
                          "Instgram",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: Constants.appFont2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_right_rounded,
                          size: 30.0,
                        ),
                        onTap: () {
                          String url =
                              "https://www.instagram.com/ahmedtalal98/";
                          Constants.launchUrl(url);
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "LinkedIn",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: Constants.appFont2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_right_rounded,
                          size: 30.0,
                        ),
                        onTap: () {
                          String url =
                              "https://www.linkedin.com/in/ahmed-talal-211a47179/";
                          Constants.launchUrl(url);
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Github",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: Constants.appFont2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_right_rounded,
                          size: 30.0,
                        ),
                        onTap: () {
                          String url =
                              "https://github.com/ahmedtalal?tab=repositories";
                          Constants.launchUrl(url);
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "gmail",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: Constants.appFont2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_right_rounded,
                          size: 30.0,
                        ),
                        onTap: () {
                          const String url =
                              "https://mail.google.com/mail/u/0/#inbox";
                          Constants.launchUrl(url);
                        },
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

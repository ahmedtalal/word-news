import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worldnews/constants.dart';
import 'package:worldnews/pages/home.dart';
import 'package:worldnews/providers/provider/Country_provider.dart';

// ignore: must_be_immutable
class ChooseCountry extends StatelessWidget {
  String _country;
  final List<String> countries = [
    "Egypt",
    "Australia",
    "Brazil",
    "Canada",
    "China",
    "Argentina",
    "France",
    "India",
    "Germany",
    "Italy",
    "Japan",
    "Morocco",
    "Russia",
    "Saudi Arabia",
    "South Korea",
    "South Africa",
    "Turkey",
    "United States",
  ];
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
              height: height * 0.12,
            ),
            Container(
              width: width * 0.82,
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: Center(
                child: Text(
                  "Please you should identify any country that you need",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: Constants.appFont2,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Center(
              child: Image(
                height: height * 0.3,
                image: AssetImage(Constants.locationImage),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Center(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.082,
                      right: width * 0.082,
                      top: 12.0,
                    ),
                    child: Container(
                      height: height * 0.07,
                      padding: EdgeInsets.only(
                        left: 12.0,
                        right: 12.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: DropdownButton(
                        hint: Text(
                          "Select country",
                          style: TextStyle(
                            fontSize: 13.0,
                            fontFamily: Constants.appFont2,
                          ),
                        ),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 25,
                        isExpanded: true,
                        underline: SizedBox(),
                        value: _country,
                        items: countries.map((country) {
                          return DropdownMenuItem(
                            child: Text(
                              country,
                              style: TextStyle(
                                fontFamily: Constants.appFont2,
                                fontSize: 13.0,
                              ),
                            ),
                            value: country,
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _country = value;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.07,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  if (_country == null) {
                    _country = countries[0];
                  }
                  print(_country);
                  provider.country = _country;
                  provider.setCountry();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (C) => Home(),
                    ),
                  );
                },
                child: Container(
                  width: width * 0.72,
                  height: height * 0.064,
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
                        fontSize: 16.0,
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

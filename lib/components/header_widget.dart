import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worldnews/constants.dart';
import 'package:worldnews/providers/provider/Country_provider.dart';

// ignore: must_be_immutable
class HeaderWidget extends StatelessWidget {
  String title, _countryImage, _countryName;
  HeaderWidget({
    @required this.title,
  });
  setCountry(String country) {
    switch (country) {
      case "Egypt":
        _countryImage = Constants.egypt;
        _countryName = "Egypt";
        break;
      case "Australia":
        _countryImage = Constants.australia;
        _countryName = "Australia";
        break;
      case "Brazil":
        _countryImage = Constants.brazil;
        _countryName = "Brazil";
        break;
      case "Canada":
        _countryImage = Constants.canada;
        _countryName = "Canada";
        break;
      case "China":
        _countryImage = Constants.china;
        _countryName = "China";
        break;
      case "Argentina":
        _countryImage = Constants.argentina;
        _countryName = "Argentina";
        break;
      case "France":
        _countryImage = Constants.france;
        _countryName = "France";
        break;
      case "India":
        _countryImage = Constants.india;
        _countryName = "India";
        break;
      case "Germany":
        _countryImage = Constants.germany;
        _countryName = "Germany";
        break;
      case "Italy":
        _countryImage = Constants.italy;
        _countryName = "Italy";
        break;
      case "Japan":
        _countryImage = Constants.japan;
        _countryName = "Japan";
        break;
      case "Morocco":
        _countryImage = Constants.morocco;
        _countryName = "Morocco";
        break;
      case "Russia":
        _countryImage = Constants.russia;
        _countryName = "Russia";
        break;
      case "Saudi Arabia":
        _countryImage = Constants.saudiarabia;
        _countryName = "Saudi Arabia";
        break;
      case "South Korea":
        _countryImage = Constants.southkorea;
        _countryName = "South Korea";
        break;
      case "South Africa":
        _countryImage = Constants.southafrica;
        _countryName = "South Africa";
        break;
      case "Turkey":
        _countryImage = Constants.turkey;
        _countryName = "Turkey";
        break;
      case "United States":
        _countryImage = Constants.unitedstates;
        _countryName = "United States";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CountryProvider>(context);
    setCountry(provider.country);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: Constants.appFont2,
          ),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 12.0,
              backgroundColor: Colors.white,
              child: Image(
                image: AssetImage(
                  _countryImage,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                _countryName,
                style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: Constants.appFont2,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

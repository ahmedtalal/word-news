import 'package:flutter/material.dart';
import 'package:worldnews/constants.dart';

// ignore: must_be_immutable
class SettingView extends StatelessWidget {
  Function onClick;
  String title;
  SettingView({
    @required this.title,
    @required this.onClick,
  });
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontFamily: Constants.appFont2,
              fontSize: 13.0,
              color: title.toLowerCase() == "sign up"
                  ? Colors.red[300]
                  : Colors.black,
            ),
          ),
          trailing: Icon(
            Icons.arrow_right_rounded,
            size: 29.0,
            color: Colors.black,
          ),
          onTap: onClick,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActionWidget extends StatelessWidget {
  Function onClick;
  IconData icon;
  ActionWidget({
    @required this.onClick,
    @required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 29.0,
        width: 29.0,
        padding: EdgeInsets.only(left: 3.0,right: 3.0,),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 15.0,
          color: Colors.black,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/utils/theme.dart';

Widget loadingTextWidget(double bottomPosition) => Positioned(
    left: 0,
    right: 0,
    bottom: bottomPosition,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Loading",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontSize: 18,
          ),
        ),
        SizedBox(width: 10),
        CircularProgressIndicator(
          color: Colors.white,
        )
      ],
    )
);
Widget headingTextWidget(String title) => Container(
  width: 360,
  height: 50,
  padding: EdgeInsets.all(2),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Color.fromRGBO(81, 18, 127, 0.0),
  ),
  child: Row(
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Lato',
          fontSize: 18
        ),
      ),
    ],
  )
);
Widget noDateToShowWidget() => Container(
  width: 320,
  height: 200,
  padding: EdgeInsets.all(2),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: widgetBackgroundColour,
  ),
  child: Container(
    alignment: Alignment(0.0, 0.0),
    child: Text(
      'No Data To Show',
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Lato',
        fontSize: 18
      ),
    ),
  )
);
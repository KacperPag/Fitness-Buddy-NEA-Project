import 'package:flutter/material.dart';

Widget optionWidget(String title, IconData iconType) => Container(
  width: 360,
  height: 50,
  padding: EdgeInsets.all(2),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Color.fromRGBO(81, 18, 127, 0.0),
  ),
  child: Row(
    children: [
      Icon(iconType, color: Colors.white),
      SizedBox(width: 10),
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
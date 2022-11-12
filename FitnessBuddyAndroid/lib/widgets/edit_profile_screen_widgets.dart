import 'package:flutter/material.dart';

Widget changeProfilePicture(String title, NetworkImage userProfileImage) => Container(
    width: 360,
    height: 50,
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color.fromRGBO(81, 18, 127, 0.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontSize: 18
          ),
        ),
        CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.white,
          backgroundImage: userProfileImage,
        ),
      ],
    )
);
Widget changeUserProfileData(String title, String userData, BuildContext context) => Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color.fromRGBO(81, 18, 127, 0.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontSize: 18
          ),
        ),
        Text(
          userData,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontSize: 18
          ),
        ),
      ],
    )
);
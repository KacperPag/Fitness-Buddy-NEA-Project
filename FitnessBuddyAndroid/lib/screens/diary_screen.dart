import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({Key? key}) : super(key: key);
  @override
  DiaryScreenState createState() => DiaryScreenState();
}
class DiaryScreenState extends State<DiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                topColour,
                bottomColour
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: Stack(
            children: [

            ],
          ),
        )
    );
  }
}
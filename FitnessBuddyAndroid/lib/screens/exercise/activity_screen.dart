import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/utils/activity_data.dart';

class ActivityScreen extends StatefulWidget {
  final String activityId;

  const ActivityScreen({Key? key, required this.activityId}) : super(key: key);
  @override
  ActivityScreenState createState() => ActivityScreenState();
}
class ActivityScreenState extends State<ActivityScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      backgroundColor: topColour,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(activity?.activityName ?? "Unable to load"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
            size: 20,
            color: Colors.white
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
        child: ListView(
          children: [
            Text(
              activity?.activityDescription ?? "Unable to load",
              style: TextStyle(
                fontFamily: 'Lato',
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Recommended: x${activity?.activitySets}",
              style: TextStyle(
                fontFamily: 'Lato',
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/ 3),
            MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () async {

              },
              color: mainButtonColour,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                "Start Now!",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontSize: 18
                ),
              ),
            )
          ],
        )
      )
    );
  }
}
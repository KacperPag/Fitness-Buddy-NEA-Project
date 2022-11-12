import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/screens/exercise/activities_screen.dart';
import 'package:fitnessbuddyandroid/widgets/basic_widgets.dart';
import 'package:fitnessbuddyandroid/widgets/exercise_screen_widgets.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({Key? key}) : super(key: key);
  @override
  ExerciseScreenState createState() => ExerciseScreenState();
}
class ExerciseScreenState extends State<ExerciseScreen> {
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
            headingTextWidget('Recent'),
            Container(
              alignment: Alignment(0.0, -0.8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ExerciseScreen()));
                      },
                      child: noDateToShowWidget()
                    ),
                  ],
                ),
              )
            ),
            Container(
              alignment: Alignment(0.0, -0.15),
              child: headingTextWidget('Recommended'),
            ),
            Container(
                alignment: Alignment(0.0, 0.35),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ExerciseScreen()));
                          },
                          child: noDateToShowWidget()
                      ),
                    ],
                  ),
                )
            ),
            Container(
              alignment: Alignment(0.0, 0.8),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ActivitiesScreen()));
                },
                color: mainButtonColour,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  "Record Exercise",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 18
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment(0.0, 1.05),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ActivitiesScreen()));
                },
                color: mainButtonColour,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  "View All Activities",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 18
                  ),
                ),
              ),
            )
          ],
        )
      )
    );
  }
  Future getAllActivities() async {
    var data = await FirebaseFirestore.instance.collection('Activities').orderBy('activityName', descending: true).get();

    setState(() {
      activityList = List.from(data.docs.map((doc) => Activity.fromSnapshot(doc)));
    });
  }
}
List<Object> activityList = [];
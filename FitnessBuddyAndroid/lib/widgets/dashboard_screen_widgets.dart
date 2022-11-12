import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/utils/graph_generator.dart';

Widget dashboardCaloriesCard(String totalCaloriesRemaining, String baseGoal, String totalFoodCalories, String totalCaloriesBurnt) => Container(
  width: 320,
  height: 160,
  padding: EdgeInsets.all(5),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: widgetBackgroundColour,
  ),
  child: Stack(
    children: [
      Positioned(
        top: 0,
        left: 0,
        child: Text(
          "Calories",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontSize: 18
          ),
        ),
      ),
      Positioned(
        top: 27,
        left: 0,
        child: Text(
          "Remaining = Goal - Food + Exercise",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontSize: 12
          ),
        ),
      ),
      Positioned(
        top: 50,
        left: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Base Goal",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontSize: 12
              ),
            ),
            Text(
              baseGoal,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontSize: 12
              ),
            ),
            Text(
              "Food Calories",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontSize: 12
              ),
            ),
            Text(
              totalFoodCalories,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontSize: 12
              ),
            ),
            Text(
              "Calories Burnt",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontSize: 12
              ),
            ),
            Text(
              totalCaloriesBurnt,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontSize: 12
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 60,
        right: 40,
        child: Column(
          children: [
            Text(
              totalCaloriesRemaining,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontSize: 22
              ),
            ),
            Text(
              "Remaining",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontSize: 16
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget dashboardProgressCard(BuildContext context, String title, String subtitle) => Container(
  width: 320,
  height: 200,
  padding: EdgeInsets.all(2),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: widgetBackgroundColour,
  ),
  child: Stack(
    children: [
      Positioned(
        left: 5,
        top: 2.5,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontSize: 18
          ),
        ),
      ),
      Positioned(
        left: 5,
        top: 27,
        child: Text(
          subtitle,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontSize: 12
          ),
        ),
      ),
    ],
  ),
);


Widget dashboardStepsCounter(BuildContext context, String stepCountToday, String stepCountYesterday, String stepCountAverage) => Container(
  width: 150,
  height: 100,
  padding: EdgeInsets.all(2),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: widgetBackgroundColour,
  ),
  child: Stack(
    children: [
      Positioned(
        left: 5,
        top: 2.5,
        child: Text(
          "Steps",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontSize: 18
          ),
        ),
      ),
      Positioned(
        left: 5,
        top: 27,
        child: Text(
          stepCountToday,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontSize: 12
          ),
        ),
      ),
      Positioned(
        left: 5,
        top: 42,
        child: Text(
          stepCountYesterday,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontSize: 12
          ),
        ),
      ),
      Positioned(
        left: 5,
        top: 57,
        child: Text(
          stepCountAverage,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontSize: 12
          ),
        ),
      ),
    ],
  ),
);

Widget dashboardExerciseCounter(BuildContext context) => Container(
  width: 150,
  height: 100,
  padding: EdgeInsets.all(2),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: widgetBackgroundColour,
  ),
  child: Stack(
    children: const [
      Positioned(
        left: 5,
        top: 2.5,
        child: Text(
          "Exercise",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontSize: 18
          ),
        ),
      ),
      Positioned(
        left: 5,
        top: 27,
        child: Text(
          "",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontSize: 12
          ),
        ),
      ),
    ],
  ),
);
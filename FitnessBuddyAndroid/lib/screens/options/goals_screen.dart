import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/widgets/goals_screen_widgets.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({Key? key}) : super(key: key);
  @override
  GoalScreenState createState() => GoalScreenState();
}
class GoalScreenState extends State<GoalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: false,
        backgroundColor: topColour,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text("My Goals"),
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
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
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
              goalTitle('My Weight Goals'),
              editGoal('Starting Weight', '', Icons.monitor_weight_outlined),
              editGoal('Current Weight', '', Icons.monitor_weight_outlined),
              editGoal('Goal Weight', '', Icons.monitor_weight_outlined),
              editGoal('Weekly Goal', '', Icons.monitor_weight_outlined),
              editGoal('Activity Level', '', Icons.monitor_weight_outlined),
            ],
          )
        )
    );
  }
}
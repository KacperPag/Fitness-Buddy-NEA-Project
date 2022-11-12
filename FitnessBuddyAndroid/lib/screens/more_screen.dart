import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/main.dart';
import 'package:fitnessbuddyandroid/screens/nutrition_screen.dart';
import 'package:fitnessbuddyandroid/screens/options/apps_devices_screen.dart';
import 'package:fitnessbuddyandroid/screens/options/edit_profile_screen.dart';
import 'package:fitnessbuddyandroid/screens/options/friends_screen.dart';
import 'package:fitnessbuddyandroid/screens/options/goals_screen.dart';
import 'package:fitnessbuddyandroid/screens/options/settings_screen.dart';
import 'package:fitnessbuddyandroid/screens/privacy_center_screen.dart';
import 'package:fitnessbuddyandroid/utils/user_data.dart';
import 'package:fitnessbuddyandroid/widgets/more_screen_widgets.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);
  @override
  MoreScreenState createState() => MoreScreenState();
}
class MoreScreenState extends State<MoreScreen> {
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
              Positioned(
                left: 0,
                top: 26,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                  },
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    backgroundImage: userProfileImage,
                  ),
                ),
              ),
              Positioned(
                left: 80,
                top: 32,
                child: Text(
                  userData.username,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 22
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 120,
                child: Scrollbar(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: optionWidget("My Apps & Devices", Icons.apps_outlined),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AppDeviceScreen()));
                        },
                      ),
                      GestureDetector(
                        child: optionWidget("My Friends", Icons.people_alt_outlined),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> FriendsScreen()));
                        },
                      ),
                      GestureDetector(
                        child: optionWidget("My Goals", Icons.adjust_outlined),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> GoalScreen()));
                        },
                      ),
                      GestureDetector(
                        child: optionWidget("My Nutrition", Icons.pie_chart_outline_outlined),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> NutritionScreen()));
                        },
                      ),
                      GestureDetector(
                        child: optionWidget("My Progress", Icons.leaderboard_outlined),
                        onTap: () {

                        },
                      ),
                      GestureDetector(
                        child: optionWidget("My Reminders", Icons.alarm_outlined),
                        onTap: () {

                        },
                      ),
                      GestureDetector(
                        child: optionWidget("Privacy Center", Icons.privacy_tip_outlined),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> PrivacyCenterScreen()));
                        },
                      ),
                      GestureDetector(
                        child: optionWidget("Settings", Icons.settings_outlined),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsScreen()));
                        },
                      ),
                      GestureDetector(
                        child: optionWidget("Help", Icons.help_outline),
                        onTap: () {

                        },
                      ),
                      SizedBox(height: 10),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WelcomeScreen()));
                        },
                        color: mainButtonColour,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Lato',
                              fontSize: 18
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        )
    );
  }
}
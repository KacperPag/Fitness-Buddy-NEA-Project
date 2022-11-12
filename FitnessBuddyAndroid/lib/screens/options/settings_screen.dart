import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/main.dart';
import 'package:fitnessbuddyandroid/screens/options/edit_profile_screen.dart';
import 'package:fitnessbuddyandroid/widgets/basic_widgets.dart';
import 'package:fitnessbuddyandroid/widgets/settings_screen_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  SettingsScreenState createState() => SettingsScreenState();
}
class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: false,
        backgroundColor: topColour,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text("Settings"),
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
              headingTextWidget('General'),
              GestureDetector(
                child: settingsOptionWidget('Appearance', Icons.notifications_outlined),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                },
              ),
              GestureDetector(
                child: settingsOptionWidget('Community Settings', Icons.notifications_outlined),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                },
              ),
              GestureDetector(
                child: settingsOptionWidget('Push Notifications', Icons.notifications_outlined),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                },
              ),
              headingTextWidget('My Account'),
              GestureDetector(
                child: settingsOptionWidget('Edit My Profile', Icons.edit_outlined),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                },
              ),
              GestureDetector(
                child: settingsOptionWidget('Change Password', Icons.edit_outlined),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                },
              ),
              GestureDetector(
                child: settingsOptionWidget('Delete Account', Icons.delete_outline),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                },
              ),
              GestureDetector(
                child: settingsOptionWidget('Log Out', Icons.logout_outlined),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WelcomeScreen()));
                },
              ),
              headingTextWidget('Help'),
              GestureDetector(
                child: settingsOptionWidget('About Us', Icons.edit_outlined),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                },
              ),
              GestureDetector(
                child: settingsOptionWidget('Contact Support', Icons.contact_support_outlined),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                },
              ),
              GestureDetector(
                child: settingsOptionWidget('FAQs/Feedback', Icons.feedback_outlined),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                },
              ),
              GestureDetector(
                child: settingsOptionWidget('Troubleshooting', Icons.troubleshoot_outlined),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                },
              ),
              GestureDetector(
                child: settingsOptionWidget('Debug Logs', Icons.note_outlined),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                },
              ),
            ],
          )
        )
    );
  }
}
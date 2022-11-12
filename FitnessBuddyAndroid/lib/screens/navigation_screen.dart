import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/screens/community_screen.dart';
import 'package:fitnessbuddyandroid/screens/dashboard_screen.dart';
import 'package:fitnessbuddyandroid/screens/diary_screen.dart';
import 'package:fitnessbuddyandroid/screens/more_screen.dart';
import 'package:fitnessbuddyandroid/screens/exercise_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  MainScreenState createState() => MainScreenState();
}
class MainScreenState extends State<MainScreen> {
  List<Widget> pageList = <Widget>[
    DashboardScreen(),
    DiaryScreen(),
    CommunityScreen(),
    ExerciseScreen(),
    MoreScreen()
  ];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: navigationBarColour,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: accentTextColour),
        selectedItemColor: accentTextColour,
        selectedLabelStyle: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold, fontSize: 14),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.normal, fontSize: 14),
        currentIndex: currentIndex,
        onTap: (index) { setState(() { currentIndex = index; });},
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library_outlined),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum_outlined),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_outlined),
            label: 'Exercise',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined),
            label: 'More',
          ),
        ],
        ),
      body: pageList[currentIndex],
    );
  }
}
import 'package:cloud_functions/cloud_functions.dart';
import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/screens/exercise_screen.dart';
import 'package:fitnessbuddyandroid/screens/fitness_tracker/maps.dart';
import 'package:fitnessbuddyandroid/screens/fitness_tracker/steps_screen.dart';
import 'package:fitnessbuddyandroid/screens/notifications_screen.dart';
import 'package:fitnessbuddyandroid/screens/nutrition_screen.dart';
import 'package:fitnessbuddyandroid/screens/options/edit_profile_screen.dart';
import 'package:fitnessbuddyandroid/screens/progress_screen.dart';
import 'package:fitnessbuddyandroid/utils/user_data.dart';
import 'package:fitnessbuddyandroid/utils/graph_generator.dart';
import 'package:fitnessbuddyandroid/widgets/dashboard_screen_widgets.dart';
import 'package:fitnessbuddyandroid/test.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

List items = [
  {
    "header": "Learn",
    "description": "",
    "image": "assets/images/educatchlogo.png"
  },
  {
    "header": "",
    "description": "",
    "image": "assets/images/educatchlogo.png"
  },
  {
    "header": "",
    "description": "",
    "image": "assets/images/educatchlogo.png"
  }
];


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  DashboardScreenState createState() => DashboardScreenState();
}
class dad extends State<DashboardScreen> {
  List<Widget> slides = items.map((item) => Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Image.asset(
              item['image'],
              fit: BoxFit.fitWidth,
              width: 320.0,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: <Widget>[
                  Text(item['header'],
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 2.0)),
                  Text(
                    item['description'],
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.2,
                        fontSize: 16.0,
                        height: 1.3),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ))).toList();

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
          (index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 3.0),
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
            color: currentPage.round() == index ? Colors.white : Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.0)),
      )
  );

  double currentPage = 0.0;
  final _pageViewController = new PageController();
  bool isSignIn = true;

  Widget buildMain() => PageView.builder(
    controller: _pageViewController,
    itemCount: slides.length,
    itemBuilder: (BuildContext context, int index) {
      _pageViewController.addListener(() {
        setState(() {
          currentPage = _pageViewController.page!;
        });
      });
      return slides[index];
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: buildMain()
      )
    );
  }
}
class DashboardScreenState extends State<DashboardScreen> {
  String welcomeText = "Good Morning";
  @override
  void initState() {
    super.initState();
    initPlatformState();
    //getDataFromList();
  }
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
              Container(
                alignment: Alignment.topCenter,
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
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
/*                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        '$welcomeText,\n${userData.givenName} ${userData.familyName}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lato',
                            fontSize: 18
                        ),
                      ),
                    ),*/
                    Container(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationsScreen()));
                        },
                        child: Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                            size: 30
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment(0.0, -0.55),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            test();
/*                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MapScreen()));*/
                          },
                          child: dashboardCaloriesCard("2,400", "", "", ""),
                        )
                      ],
                    ),
                  )
              ),
              Container(
                alignment: Alignment(0.0, 0.1),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> StepsScreen()));
                          },
                          child: dashboardStepsCounter(context, _steps, "", "")
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ExerciseScreen()));
                        },
                        child: dashboardExerciseCounter(context),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment(-0.9, 0.35),
                child: Text(
                  "My Progress",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 22
                  ),
                ),
              ),
              Container(
                  alignment: Alignment(0.0, 1.05),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ProgressScreen()));
                          },
                          child: dashboardProgressCard(context, "My Weight", "Last 30 days"),
                        )
                      ],
                    ),
                  )
              )
            ],
          )
      )
    );
  }
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = 'No data available.', _steps = 'No data available.';
  void onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    setState(() {
      _status = 'Pedestrian Status not available';
    });
  }

  void onStepCountError(error) {
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  Future<void> initPlatformState() async {
    PermissionStatus activityStatus = await Permission.activityRecognition.request();
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream.listen(onPedestrianStatusChanged).onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }



  final functions = FirebaseFunctions.instance;
  var myData = {
    "username": "testaccou22nt",
  };
  Future<void> test() async {
    try {
      final result = await FirebaseFunctions.instance.httpsCallable('createUserAccount').call(myData);
      print("Line 315 " + result.data.toString());
    } on FirebaseFunctionsException catch (error) {
      print(error.code);
      print(error.details);
      print(error.message);
    }
  }
}
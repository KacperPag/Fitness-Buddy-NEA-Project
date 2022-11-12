import 'package:firebase_core/firebase_core.dart';
import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/screens/get_started/about_user_screen.dart';
import 'package:fitnessbuddyandroid/screens/get_started/login_screen.dart';
import 'package:fitnessbuddyandroid/utils/user_data.dart';
import 'package:fitnessbuddyandroid/widgets/basic_widgets.dart';
import 'package:quick_actions/quick_actions.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoadingScreen(),
  ));
}
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  LoadingScreenState createState() => LoadingScreenState();
}
class LoadingScreenState extends State<LoadingScreen> {
  final quickActions = QuickActions();
  @override
  void initState() {
    super.initState();
/*    quickActions.setShortcutItems([
      ShortcutItem(type: 'search', localizedTitle: 'Search')
    ]
    );
    quickActions.initialize((type) {
      if (type == 'search') {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MoreScreen()));
      }
    });*/
    onLoad(context);
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
          children: <Widget>[
            Container(
              alignment: Alignment(0.0, -0.9),
              child: Text(
                "Fitness Buddy",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontSize: 46
                ),
              ),
            ),
            loadingTextWidget(100)
          ],
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}
class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
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
          children: <Widget>[
            Container(
              alignment: Alignment(0.0, -0.9),
              child: const Text(
                "Fitness Buddy",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontSize: 46
                ),
              ),
            ),
            Container(
              alignment: Alignment(0.0, 0.7),
              child: MaterialButton(
                minWidth: 300,
                height: 60,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                color: mainButtonColour,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontSize: 20
                  ),
                ),
              ),
            ),
            Container(
                alignment: Alignment(0.0, 0.95),
                child: MaterialButton(
                  minWidth: 300,
                  height: 60,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutYouScreen()));
                  },
                  color: mainButtonColour,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 20
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
void onLoad(BuildContext context) async {
  await Firebase.initializeApp();
  checkUserAuthState(context);
}

//https://sharmadhiraj.medium.com/build-an-app-under-maintenance-feature-with-the-control-panel-using-the-firebase-real-time-f0815ef38c20
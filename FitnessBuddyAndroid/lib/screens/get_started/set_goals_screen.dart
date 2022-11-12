import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fitnessbuddyandroid/screens/get_started/register_screen.dart';


class SetGoalsScreen extends StatefulWidget {
  const SetGoalsScreen({Key? key}) : super(key: key);

  @override
  SetGoalsScreenState createState() => SetGoalsScreenState();
}
class SetGoalsScreenState extends State<SetGoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      backgroundColor: Color.fromRGBO(81, 18, 127, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromRGBO(81, 18, 127, 1),
              Color.fromRGBO(215, 10, 132, 1),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment(0.0, 0.0),
              child: Text("Goals",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  String errorMessage = "";
}
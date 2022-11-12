import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';


class NutritionScreen extends StatefulWidget {
  const NutritionScreen({Key? key}) : super(key: key);
  @override
  NutritionScreenState createState() => NutritionScreenState();
}
class NutritionScreenState extends State<NutritionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: topColour,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text("My Nutrition"),
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

            ],
          ),
        )
    );
  }
}
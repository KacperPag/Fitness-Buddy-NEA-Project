import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);
  @override
  CommunityScreenState createState() => CommunityScreenState();
}
class CommunityScreenState extends State<CommunityScreen> {
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
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 200,
                      color: Colors.purple[600],
                      child: const Center(child: Text('Item 1', style: TextStyle(fontSize: 18, color: Colors.white),)),
                    ),
                    Container(
                      width: 200,
                      color: Colors.purple[500],
                      child: const Center(child: Text('Item 2', style: TextStyle(fontSize: 18, color: Colors.white),)),
                    ),
                    Container(
                      width: 200,
                      color: Colors.purple[400],
                      child: const Center(child: Text('Item 3', style: TextStyle(fontSize: 18, color: Colors.white),)),
                    ),
                    Container(
                      width: 200,
                      color: Colors.purple[300],
                      child: const Center(child: Text('Item 4', style: TextStyle(fontSize: 18, color: Colors.white),)),
                    ),
                  ],
                ),
              ),
            ]
          )
        )
    );
  }
}
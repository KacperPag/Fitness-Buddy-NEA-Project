import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);
  @override
  FriendsScreenState createState() => FriendsScreenState();
}
class FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          backgroundColor: topColour,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text("My Friends"),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, size: 20, color: Colors.white),
            ),
            bottom: TabBar(
              tabs: const [
                Tab(text: 'Friends'),
                Tab(text: 'Pending'),
                Tab(text: 'Requested'),
              ],
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
            child: TabBarView(
              children: const [
                Center(child: Text('')),
                Center(child: Text('')),
                Center(child: Text('')),
              ]
            )
          )
      ),
    );
  }
}

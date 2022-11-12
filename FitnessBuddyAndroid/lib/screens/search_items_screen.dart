import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';

class SearchItemScreen extends StatefulWidget {
  const SearchItemScreen({Key? key}) : super(key: key);
  @override
  SearchItemScreenState createState() => SearchItemScreenState();
}
class SearchItemScreenState extends State<SearchItemScreen> {
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
                Tab(text: 'All'),
                Tab(text: 'My Meals'),
                Tab(text: 'My Foods'),
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

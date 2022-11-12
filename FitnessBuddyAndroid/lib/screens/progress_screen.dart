import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/record/laughing_data.dart';
import 'package:fitnessbuddyandroid/test.dart';
import 'package:fitnessbuddyandroid/utils/graph_generator.dart';
import 'package:fitnessbuddyandroid/utils/user_data.dart';
import 'package:intl/intl.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({Key? key}) : super(key: key);
  @override
  ProgressScreenState createState() => ProgressScreenState();
}
class ProgressScreenState extends State<ProgressScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: false,
          backgroundColor: topColour,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text("My Progress"),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back,
                size: 20,
                color: Colors.white
              ),
            ),
            bottom: TabBar(
              tabs: const [
                Tab(text: 'Weight'),
                Tab(text: 'Height'),
              ],
              labelColor: accentTextColour,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              labelStyle: TextStyle(color: Colors.white, fontFamily: 'Lato', fontSize: 18),
              unselectedLabelColor: Colors.white,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: widgetBackgroundColour,
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
            child: TabBarView(
              children: const [
                ProgressWeightScreen(),
                Center(child: Text(''))
              ]
            )
          )
      ),
    );
  }
}
class ProgressWeightScreen extends StatefulWidget {
  const ProgressWeightScreen({Key? key}) : super(key: key);
  @override
  ProgressWeightScreenState createState() => ProgressWeightScreenState();
}
class ProgressWeightScreenState extends State<ProgressWeightScreen> {
  @override
  void initState() {
    super.initState();
    setState(() { chartData = normalizeData(weeksData[0]); });
  }
  @override
  Widget build(BuildContext context) {
      return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(top: 10),
          sliver: SliverToBoxAdapter(
              child: lineChart(320, MediaQuery.of(context).size.width - 60)
          ),
        ),
/*        SliverPadding(
          padding: EdgeInsets.only(top: 10),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Time Period",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 18
                  ),
                ),
                Text(
                  "Unit Type",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 18
                  ),
                ),
              ],
            ),
          ),
        ),*/
        SliverPadding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              "Data",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontSize: 22
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int i) {
            return userWeightDataWidget(DateFormat('dd MMMM yyyy').format(userWeightData[i].date.toDate()), userWeightData[i].weight, userWeightData[i].unitType, userWeightData[i].image);
          }, childCount: userWeightData.length)
        ),
      ],
    );
  }
}

Widget userWeightDataWidget(String date, String data, String dataType, String imageUrl) => Container(
  height: 80,
  padding: EdgeInsets.all(2),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: widgetBackgroundColour,
  ),
  child: Stack(
    children: [
      Positioned(
        left: 5,
        top: 2.5,
        child: Text(
          date,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontSize: 18
          ),
        ),
      ),
      Positioned(
        left: 5,
        top: 27,
        child: Text(
          "$data $dataType",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontSize: 12
          ),
        ),
      ),
      Positioned(
        right: 5,
        child: Image(
          image: NetworkImage(imageUrl),
          height: 80,
        ),
      ),
    ],
  ),
);
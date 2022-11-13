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
                ProgressHeightScreen()
              ]
            )
          )
      ),
    );
  }
}

const List<String> heightUnitsList = <String>['cm'];
const List<String> weightUnitsList = <String>['kg'];
String userHeightUnits = heightUnitsList.first;
String userWeightUnits = weightUnitsList.first;
final userDataInputController = TextEditingController();


String dataType = "Weight";
int dataPoint = 0;
class ProgressDetailScreen extends StatefulWidget {
  const ProgressDetailScreen({Key? key}) : super(key: key);
  @override
  ProgressDetailScreenState createState() => ProgressDetailScreenState();
}
class ProgressDetailScreenState extends State<ProgressDetailScreen> {
  @override
  void initState() {
    loadProgressData();
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
            title: const Text("Progress Detail"),
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
            child: Stack(
              children: [
                Container(
                  alignment: Alignment(-1.0, -0.9),
                  width: 260,
                  child: TextField(
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white
                          ),
                        ),
                        labelText: dataType,
                        labelStyle: TextStyle(color: Colors.white, fontFamily: 'Lato', fontSize: 20),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        constraints: BoxConstraints(maxHeight: 50,maxWidth: 260,),
                      ),
                      controller: userDataInputController
                  ),
                ),
                Container(
                  alignment: Alignment(1.0, -0.9),
                  child: DropdownButton<String>(
                    value: userHeightUnits,
                    icon: const Icon(Icons.arrow_downward_outlined, color: Colors.white),
                    elevation: 16,
                    dropdownColor: Color.fromRGBO(81, 18, 127, 1),
                    onChanged: (String? value) {
                      setState(() {
                        userHeightUnits = value!;
                      });
                    },
                    items: heightUnitsList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Lato',
                              fontSize: 18
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  top: 100,
                  child: Text(
                    "Date: " + DateFormat('dd MMMM yyyy').format(userWeightData[dataPoint].date.toDate()),
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 18
                    ),
                  ),
                ),
                Positioned(
                  top: 140,
                  child: Text(
                    "Image: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 18
                    ),
                  ),
                ),
/*                Positioned(
                  top: 180,
                  child: Image(
                    image: NetworkImage(""),
                  ),
                ),*/
                Container(
                  alignment: Alignment(0.0, 0.6),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {
                      await saveChanges();
                    },
                    color: mainButtonColour,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                      "Save Changes",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontSize: 18
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment(0.0, 0.85),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {

                    },
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                      "Delete",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontSize: 18
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
  Future<void> saveChanges() async {
    await userWeightDataCollection.doc(userWeightData[dataPoint].id).update(
      {
        'weight': userDataInputController.text
      }
    ).then((value) => print('Updated successfully')).catchError((error) => print(error));
  }
  void loadProgressData() {
    setState(() {
      userDataInputController.text = userWeightData[dataPoint].weight;
    });
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
            return GestureDetector(
              child: userDataWidget(DateFormat('dd MMMM yyyy').format(userWeightData[i].date.toDate()), userWeightData[i].weight, userWeightData[i].unitType, userWeightData[i].image),
              onTap: () {
                dataPoint = i;
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProgressDetailScreen()));
              },
            );
          }, childCount: userWeightData.length)
        ),
      ],
    );
  }
}

class ProgressHeightScreen extends StatefulWidget {
  const ProgressHeightScreen({Key? key}) : super(key: key);
  @override
  ProgressHeightScreenState createState() => ProgressHeightScreenState();
}
class ProgressHeightScreenState extends State<ProgressHeightScreen> {
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
              return GestureDetector(
                child: userDataWidget(DateFormat('dd MMMM yyyy').format(userHeightData[i].date.toDate()), userHeightData[i].height, userHeightData[i].unitType, userHeightData[i].image),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ProgressDetailScreen()));
                },
              );
            }, childCount: userHeightData.length)
        ),
      ],
    );
  }
}

Widget userDataWidget(String date, String data, String dataType, String imageUrl) => Container(
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
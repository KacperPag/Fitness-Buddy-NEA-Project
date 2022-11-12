import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/screens/exercise/activity_screen.dart';
import 'package:fitnessbuddyandroid/utils/activity_data.dart';


class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);
  @override
  ActivitiesScreenState createState() => ActivitiesScreenState();
}
class ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  void initState() {
    super.initState();
    getAllActivities();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      backgroundColor: topColour,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Activities"),
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
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
        child: CustomScrollView(
          semanticChildCount: 2,
          slivers: <Widget>[
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return activityCard(context, activityList[index] as Activities);
                },
                childCount: activityList.length,
              ),
            ),
          ],
        )
      )
    );
  }
  Future getAllActivities() async {
    var data = await FirebaseFirestore.instance.collection('activities').orderBy('name', descending: true).get();
    setState(() {
      activityList = List.from(data.docs.map((doc) => Activities.fromSnapshot(doc)));
    });
  }
}
List<Object> activityList = [];
class Activities {
  String activityId;
  String activityName;
  String activityDescription;
  num activitySets;
  String activityImage;
  String activityVideo;

  Activities.fromSnapshot(snapshot):
    activityId = snapshot.id,
    activityName = snapshot.data()['name'],
    activityDescription = snapshot.data()['description'],
    activitySets = snapshot.data()['sets'],
    activityImage = snapshot.data()['image'],
    activityVideo = snapshot.data()['video'];
}
Widget activityCard(context, Activities _activity) {
  Future<DocumentSnapshot?> getActivity() async  {
    final activitySnapshot = await FirebaseFirestore.instance.collection('activities').doc(_activity.activityId).get();
    if (activitySnapshot.exists) {
      activity = Activity.fromJson(activitySnapshot.data() as Map<String, dynamic>);
    }
  }
  return GestureDetector(
    onTap: () async {
      await getActivity().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=> ActivityScreen(activityId: _activity.activityId))));
    },
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6.0,
          ),
        ],
        color: Colors.grey.shade100,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              _activity.activityImage,
              height: 80,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _activity.activityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(top: 4),
              color: Color.fromRGBO(81, 18, 127, 1),
              child: Text(
                "x ${_activity.activitySets}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
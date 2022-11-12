import 'package:flutter/material.dart';


class Activity {
  String? activityName;
  String? activityDescription;
  num? activityNumberOfSets;

  Activity();

  Map<String, dynamic> toJson() => { 'activityName': activityName, 'activityDescription': activityDescription, 'activityNumberOfSets': activityNumberOfSets };

  Activity.fromSnapshot(snapshot)
      : activityName = snapshot.data()['activityName'],
        activityDescription = snapshot.data()['activityDescription'],
        activityNumberOfSets = snapshot.data()['activityNumberOfSets'];
}
Widget exerciseCard(context, Activity exercise) {
  return GestureDetector(
    onTap: () {

    },
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
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
/*       e     Image.asset(
              exercise.activityName,
              height: 80,
            ),*/
            SizedBox(
              height: 5,
            ),
            Text(
              exercise.activityName!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(top: 4),
              color: Color(0xFF92DCE5),
              child: Text(
                "x " + exercise.activityNumberOfSets!.toString(),
                style: TextStyle(
                  color: Colors.black,
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
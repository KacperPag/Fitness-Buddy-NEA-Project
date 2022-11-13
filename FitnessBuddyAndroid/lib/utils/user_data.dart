import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/main.dart';
import 'package:fitnessbuddyandroid/screens/navigation_screen.dart';


String userUid = FirebaseAuth.instance.currentUser!.uid;
CollectionReference userAccountDataCollection = FirebaseFirestore.instance.collection('userAccountData');
CollectionReference userWeightDataCollection = FirebaseFirestore.instance.collection('userAccountData/${userUid}/weight');
late UserAccountData userData;
List<UserNotificationData> userNotificationData = [];
List<UserHeightData> userHeightData = [];
List<UserWeightData> userWeightData = [];
late NetworkImage userProfileImage;

void checkUserAuthState(BuildContext context) async {
  if(FirebaseAuth.instance.currentUser?.uid == null){
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }
  else {
    await GetUserData().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen())));
  }
}

Future<DocumentSnapshot?> GetUserData() async {
  final userDataSnapshot = await userAccountDataCollection.doc(FirebaseAuth.instance.currentUser!.uid).get();

  if (userDataSnapshot.exists) {
    userData = UserAccountData.fromJson(userDataSnapshot.data() as Map<String, dynamic>);
    userProfileImage = NetworkImage(userData.profilePicture);
/*    QuerySnapshot userNotificationSnapshot = await FirebaseFirestore.instance.collection('userAccountData/${FirebaseAuth.instance.currentUser!.uid}/notifications').get();
    for (int i = 0; i < userNotificationSnapshot.docs.length; i++) {
      userNotificationData.add(UserNotificationData.fromJson(userNotificationSnapshot.docs[i].data() as Map<String, dynamic>));
    }*/
/*    QuerySnapshot userHeightSnapshot = await FirebaseFirestore.instance.collection('userAccountData/${FirebaseAuth.instance.currentUser!.uid}/height').get();*/
    QuerySnapshot userWeightSnapshot = await FirebaseFirestore.instance.collection('userAccountData/${FirebaseAuth.instance.currentUser!.uid}/weight').orderBy('date', descending: true).get();
/*    for (int i = 0; i < userHeightSnapshot.docs.length; i++) {
      userHeightData.add(UserHeightData.fromJson(userHeightSnapshot.docs[i].data() as Map<String, dynamic>));
    }*/
    for (int i = 0; i < userWeightSnapshot.docs.length; i++) {
      userWeightData.add(UserWeightData.fromJson(userWeightSnapshot.docs[i].id, userWeightSnapshot.docs[i].data() as Map<String, dynamic>));
    }
  }
  return null;
}

class UserAccountData {
  final String about;
  final String birthdate;
  final String email;
  final String familyName;
  final String gender;
  final String givenName;
  final String profilePicture;
  final String timeZone;
  final String username;
  late bool privateAccount;

  UserAccountData({
    required this.about,
    required this.birthdate,
    required this.email,
    required this.familyName,
    required this.gender,
    required this.givenName,
    required this.profilePicture,
    required this.timeZone,
    required this.username,
    required this.privateAccount
  });

  Map<String, dynamic> toJson() => {
    'about': about,
    'birthdate': birthdate,
    'email': email,
    'familyName': familyName,
    'gender': gender,
    'givenName': givenName,
    'profilePicture': profilePicture,
    'timeZone': timeZone,
    'username': username,
    'privateAccount': privateAccount
  };
  static UserAccountData fromJson(Map<String, dynamic> data) => UserAccountData(
      about: data['about'],
      birthdate: data['birthdate'],
      email: data['email'],
      familyName: data['familyName'],
      gender: data['gender'],
      givenName: data['givenName'],
      profilePicture: data['profilePicture'],
      timeZone: data['timeZone'],
      username: data['username'],
      privateAccount: data['privateAccount']
  );
}
class UserNotificationData {
  final String title;
  final String message;
  final String image;
  final Timestamp date;

  UserNotificationData({
    required this.title,
    required this.message,
    required this.image,
    required this.date
  });

  static UserNotificationData fromJson(Map<String, dynamic> data) =>
      UserNotificationData(
          title: data['title'],
          message: data['message'],
          image: data['image'],
          date: data['date']
      );
}
class UserHeightData {
  final Timestamp date;
  final String image;
  final String height;
  final String unitType;

  UserHeightData({
    required this.date,
    required this.image,
    required this.height,
    required this.unitType
  });
  static UserHeightData fromJson(Map<String, dynamic> data) => UserHeightData(
      date: data['date'],
      image: data['image'],
      height: data['height'],
      unitType: data['unitType']
  );
}
class UserWeightData {
  final String id;
  final Timestamp date;
  final String image;
  final String weight;
  final String unitType;

  UserWeightData({
    required this.id,
    required this.date,
    required this.image,
    required this.weight,
    required this.unitType
  });
  static UserWeightData fromJson(String id, Map<String, dynamic> data) => UserWeightData(
      id: id,
      date: data['date'],
      image: data['image'],
      weight: data['weight'],
      unitType: data['unitType']
  );
}


class UserGoalData {
  final String startingWeight;
  final int goalWeight;
  final String weeklyGoal;

  UserGoalData({
    required this.startingWeight,
    required this.goalWeight,
    required this.weeklyGoal
  });

  static UserGoalData fromJson(Map<String, dynamic> data) => UserGoalData(
    startingWeight: data['startingWeight'],
    goalWeight: data['goalWeight'],
    weeklyGoal: data['weeklyGoal']
  );
}
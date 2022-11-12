const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();
const firestore = admin.firestore();

const userAccountDataCollection = firestore.collection("userAccountData");

exports.createUserAccount = functions.https.onCall(async (data, context) => {
  const checkForUsername =
  await userAccountDataCollection.where("username", "==", data.username).get();
  if (checkForUsername.empty) {
    userAccountDataCollection.doc("test").set(
        {
          "about": "",
          "birthdate": "data.birthdate",
          "email": context.auth.token.email,
          "familyName": "data.familyName",
          "gender": "data.gender",
          "givenName": "data.givenName",
          "privateAccount": true,
          "profilePicture": "",
          "timeZone": "data.timeZone",
          "username": data.username,
        }
    );
    const userHeightDataCollection = userAccountDataCollection.doc("test").collection("height");
    const userWeightDataCollection = userAccountDataCollection.doc("test").collection("weight");
    var userNotificationsCollection = userAccountDataCollection.doc("test").collection("notifications");
    userHeightDataCollection.doc().set(
      {
        "date": "",
        "image": "",
        "unitType": "kg",
        "height": "100"
      }
    );
    userWeightDataCollection.doc().set(
      {
        "date": "",
        "image": "",
        "unitType": "kg",
        "weight": "100"
      }
    );
    userNotificationsCollection.doc().set(
      {
        "date": "",
        "image": "",
        "message": "Thank you for sign up to Fitness Buddy!",
        "title": "Welcome To Fitness Buddy!"
      }
    );
    return { success: true };
  } else {
    return { success: false };
  }
});

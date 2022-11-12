import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:fitnessbuddyandroid/screens/get_started/about_user_screen.dart';
import 'package:fitnessbuddyandroid/utils/user_data.dart';

final usernameInputController = TextEditingController();
final firstNameInputController = TextEditingController();
final lastNameInputController = TextEditingController();
final emailInputController = TextEditingController();
final passwordInputController = TextEditingController();
String username = "";
String firstName = "";
String lastName = "";
String email = "";
String password = "";
String reenterPassword = "";

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}
class SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: false,
      backgroundColor: topColour,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
          children: <Widget>[
            Container(
              alignment: Alignment(0.0, -1.0),
              child: Text("Register",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              alignment: Alignment(0.0, -0.85),
              child: Text("Create a Fitness Buddy Account",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              alignment: Alignment(0.0, -0.6),
              child: TextField(
                  obscureText: false,
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
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.white, fontFamily: 'Lato', fontSize: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      )
                  ),
                  inputFormatters: [ FilteringTextInputFormatter.allow(RegExp('[a-z0-9]')) ],
                  controller: usernameInputController,
                  onChanged: (usernameInput) { username = usernameInput; }
              ),
            ),
            Container(
              alignment: Alignment(0.0, -0.4),
              child: TextField(
                  obscureText: false,
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
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.white, fontFamily: 'Lato', fontSize: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      )
                  ),
                  controller: firstNameInputController,
                  onChanged: (firstNameInput) { firstName = firstNameInput; }
              ),
            ),
            Container(
              alignment: Alignment(0.0, -0.2),
              child: TextField(
                  obscureText: false,
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
                      labelText: 'Last Name',
                      labelStyle: TextStyle(color: Colors.white, fontFamily: 'Lato', fontSize: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      )
                  ),
                  controller: lastNameInputController,
                  onChanged: (lastNameInput) { lastName = lastNameInput; }
              ),
            ),
            Container(
              alignment: Alignment(0.0, 0.0),
              child: TextField(
                  obscureText: false,
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
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white, fontFamily: 'Lato', fontSize: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      )
                  ),
                  controller: emailInputController,
                  onChanged: (emailInput) { email = emailInput; }
              ),
            ),
            Container(
              alignment: Alignment(0.0, 0.2),
              child: TextField(
                  obscureText: true,
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
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white, fontFamily: 'Lato', fontSize: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      )
                  ),
                  controller: passwordInputController,
                  onChanged: (passwordInput) { password = passwordInput; }
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 150,
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              alignment: Alignment(0.0, 0.8),
              child: MaterialButton(
                minWidth: 300,
                height: 60,
                onPressed: () {
                  registerUser(context);
                },
                color: mainButtonColour,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 18
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  String errorMessage = "";
  void registerUser(BuildContext context) async {
    try {
      if (await checkUsername(username)){
        UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailInputController.text.trim(),
          password: passwordInputController.text.trim(),
        );
        if (credential.user != null) {
          createUserData(usernameInputController.text.trim(), credential.user?.uid, credential);
        }
      }
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() { errorMessage = "Enter a stronger password!"; });
      }
      else if (e.code == 'email-already-in-use') {
        setState(() { errorMessage = "This email is already in use"; });
      }
    }
    catch (e) {
      setState(() { errorMessage = "Something went wrong..."; });
    }
  }
  Future<bool> checkUsername(String username) async {
    final checkForUsername = await FirebaseFirestore.instance.collection('userAccountData').where('username', isEqualTo: username).get();
    if (checkForUsername.docs.isEmpty) {
      return true;
    }
    else {
      setState(() {
        errorMessage = "Username is taken";
      });
      return false;
    }
  }
  void createUserData(String username, String? userId, UserCredential credential) async {
    DocumentReference userDoc = FirebaseFirestore.instance.collection('userAccountData').doc(userId);
    userDoc.set(
        {
          'about': '',
          'birthdate': userDateOfBirth,
          'email': emailInputController.text.trim(),
          'familyName': lastNameInputController.text.trim(),
          'gender': userGender,
          'givenName': firstNameInputController.text.trim(),
          'profilePicture': '',
          'timeZone': 'UTC+0',
          'username': username
        }
    );
    final DateTime now = DateTime. now();
    final DateFormat dateFormatter = DateFormat('dd-MM-yyyy');
    final String currentDate = dateFormatter.format(now);
    DocumentReference userWeightDoc = FirebaseFirestore.instance.collection('userAccountData').doc(userId).collection('weight').doc(currentDate);
    userWeightDoc.set(
        {
          'unitType': userWeightUnits,
          'weight': userWeight
        }
    );
    DocumentReference userHeightDoc = FirebaseFirestore.instance.collection('userAccountData').doc(userId).collection('height').doc(currentDate);
    userHeightDoc.set(
        {
          'unitType': userHeightUnits,
          'height': userHeight
        }
    );
    checkUserAuthState(context);
  }
}
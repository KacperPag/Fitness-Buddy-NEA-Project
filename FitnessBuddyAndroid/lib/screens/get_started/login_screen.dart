import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:fitnessbuddyandroid/utils/user_data.dart';
import 'package:fitnessbuddyandroid/widgets/basic_widgets.dart';

final emailInputController = TextEditingController();
final passwordInputController = TextEditingController();
String email = "";
String password = "";
bool isLoading = false;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}
class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              child: Text("Login",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              alignment: Alignment(0.0, -0.85),
              child: Text("Login with your Fitness Buddy Account",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                ),
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
              alignment: Alignment(0.0, 0.0),
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
                  onChanged: (passwordInput) { email = passwordInput; }
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
            Visibility(
              visible: isLoading,
              child: loadingTextWidget(150)
            ),
            Container(
              alignment: Alignment(0.0, 0.8),
                child: MaterialButton(
                    minWidth: 300,
                    height: 60,
                    onPressed: () {
                      loginUser(context);
                    },
                    color: mainButtonColour,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                      "Login",
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
  void loginUser(BuildContext context) async {
    try {
      setState(() {
        isLoading = true;
      });
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailInputController.text.trim(),
          password: passwordInputController.text.trim()
      );
      checkUserAuthState(context);
    }
    on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        setState(() { errorMessage = "Account not found!"; });
      }
      else if (e.code == 'wrong-password') {
        setState(() { errorMessage = "Wrong password"; });
      }
      else {
        setState(() { errorMessage = "Something went wrong..."; });
      }
    }
  }
}

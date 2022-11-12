import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fitnessbuddyandroid/screens/get_started/register_screen.dart';

final List<bool> selectedGender = <bool>[false, false];
const List<Widget> genderList = <Widget>[Text('Male'), Text('Female')];
const List<String> heightUnitsList = <String>['cm'];
const List<String> weightUnitsList = <String>['kg'];

String userGender = "";
String userDateOfBirth = "";
String userHeight = "";
String userHeightUnits = heightUnitsList.first;
String userWeight = "";
String userWeightUnits = weightUnitsList.first;

final dateOfBirth = TextEditingController();
final userHeightInputController = TextEditingController();
final userWeightInputController = TextEditingController();

class AboutYouScreen extends StatefulWidget {
  const AboutYouScreen({Key? key}) : super(key: key);
  @override
  AboutYouScreenState createState() => AboutYouScreenState();
}
class AboutYouScreenState extends State<AboutYouScreen> {
  @override
  void initState() {
    super.initState();
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
              child: Text(
                "About You",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              alignment: Alignment(-1.0, -0.85),
              child: Text(
                "Gender",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              alignment: Alignment(-1.0, -0.75),
              child: ToggleButtons(
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < selectedGender.length; i++) {
                      selectedGender[i] = i == index;
                    }
                    if (selectedGender[0] == true) {
                      userGender = "Male";
                    }
                    else {
                      userGender = "Female";
                    }
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                selectedBorderColor: mainButtonColour,
                selectedColor: Colors.white,
                fillColor: mainButtonColour,
                color: Colors.white,
                textStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Lato',
                  color: Colors.white,
                ),
                constraints: BoxConstraints(
                  minHeight: 40.0,
                  minWidth: (MediaQuery.of(context).size.width - 64) / 2,
                ),
                isSelected: selectedGender,
                children: genderList,
              ),
            ),
            Container(
              alignment: Alignment(-1.0, -0.55),
              child: Text("Date of birth",
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              alignment: Alignment(0.0, -0.45),
              child: TextField(
                controller: dateOfBirth,
                decoration: InputDecoration(icon: Icon(Icons.calendar_today, color: Colors.white)),
                style: TextStyle(color: Colors.white),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));
                  if (pickedDate != null) {
                    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                    setState(() { userDateOfBirth = formattedDate; });
                    dateOfBirth.text = userDateOfBirth;
                  }
                },
              ),
            ),
            Container(
              alignment: Alignment(-1.0, -0.2),
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
                      labelText: 'Height',
                      labelStyle: TextStyle(color: Colors.white, fontFamily: 'Lato', fontSize: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                    constraints: BoxConstraints(maxHeight: 50,maxWidth: 260,),
                  ),
                  controller: userHeightInputController,
                  onChanged: (userHeightInput) { userHeight = userHeightInput; }
              ),
            ),
            Container(
              alignment: Alignment(1.0, -0.2),
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
            Container(
              alignment: Alignment(-1.0, 0.0),
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
                      labelText: 'Weight',
                      labelStyle: TextStyle(color: Colors.white, fontFamily: 'Lato', fontSize: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                    constraints: BoxConstraints(maxHeight: 50,maxWidth: 260,),
                  ),
                  controller: userWeightInputController,
                  onChanged: (userWeightInput) { userWeight = userWeightInput; }
              ),
            ),
            Container(
              alignment: Alignment(1.0, 0.0),
              child: DropdownButton<String>(
                value: userWeightUnits,
                icon: const Icon(Icons.arrow_downward_outlined, color: Colors.white),
                elevation: 16,
                dropdownColor: Color.fromRGBO(81, 18, 127, 1),
                onChanged: (String? value) {
                  setState(() {
                    userWeightUnits = value!;
                  });
                },
                items: weightUnitsList.map<DropdownMenuItem<String>>((String value) {
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
              left: 0,
              right: 0,
              bottom: 150,
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontSize: 18
                ),
              ),
            ),
            Container(
              alignment: Alignment(0.0, 0.8),
              child: MaterialButton(
                minWidth: 300,
                height: 60,
                onPressed: () {
                  if (userGender.isEmpty) {
                    setState(() { errorMessage = "Please select your gender"; });
                  }
                  else {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                  }
                },
                color: mainButtonColour,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  "Next",
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
}
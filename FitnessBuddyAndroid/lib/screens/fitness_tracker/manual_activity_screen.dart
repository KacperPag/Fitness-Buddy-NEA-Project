import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/widgets/basic_widgets.dart';

class ManualActivityScreen extends StatefulWidget {
  const ManualActivityScreen({Key? key}) : super(key: key);
  @override
  ManualActivityScreenState createState() => ManualActivityScreenState();
}
class ManualActivityScreenState extends State<ManualActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      backgroundColor: Color.fromRGBO(81, 18, 127, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Manual Activity"),
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromRGBO(81, 18, 127, 1),
              Color.fromRGBO(215, 10, 132, 1),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: ListView(
          children: [
            headingTextWidget('Activity'),
            headingTextWidget('Activity Stats'),
            headingTextWidget('Details'),
            headingTextWidget('Visibility'),
          ],
        ),
      )
    );
  }
}
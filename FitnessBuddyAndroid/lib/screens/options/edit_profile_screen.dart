import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fitnessbuddyandroid/utils/user_data.dart';
import 'package:fitnessbuddyandroid/widgets/edit_profile_screen_widgets.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}
class EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: false,
        backgroundColor: topColour,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text("Edit My Profile"),
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
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showChangeProfilePictureDialog();
                },
                child: changeProfilePicture('Profile Picture', userProfileImage)
              ),
              GestureDetector(
                  onTap: () {

                  },
                  child: changeUserProfileData('Username', userData.username, context)
              ),
              GestureDetector(
                  onTap: () {

                  },
                  child: changeUserProfileData('Email', userData.email, context)
              ),
              GestureDetector(
                  onTap: () {

                  },
                  child: changeUserProfileData('Date Of Birth', userData.birthdate, context)
              ),
              GestureDetector(
                  onTap: () {

                  },
                  child: changeUserProfileData('Gender', userData.gender, context)
              ),
              GestureDetector(
                  onTap: () {

                  },
                  child: changeUserProfileData('Time Zone', userData.timeZone, context)
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(81, 18, 127, 0.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Private Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lato',
                            fontSize: 18
                        ),
                      ),
                      Switch(
                        value: userData.privateAccount,
                        onChanged: (value) {
                          setState(() {
                            userData.privateAccount = value;
                          });
                        },
                        activeTrackColor: mainButtonColour,
                        activeColor: mainButtonColour,
                      ),
                    ],
                  )
              ),
            ],
          ),
        )
    );
  }
  void showChangeProfilePictureDialog() {
    showDialog(
      context: context,
      builder: (context)
        {
          return AlertDialog(
            title: Text('Profile Picture', style: TextStyle(color: Colors.white)),
            backgroundColor: widgetBackgroundColour,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: ()
                  {
                    getPhotoFromCamera();
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.camera_alt_outlined, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Take Photo",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lato',
                            fontSize: 18
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: ()
                  {
                    getPhotoFromGallery();
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.photo_library_outlined, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Choose Existing Photo",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lato',
                            fontSize: 18
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: ()
                  {
                    removeProfilePicture();
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.photo_library_outlined, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Remove Photo",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lato',
                            fontSize: 18
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
  File? photoFile;
  void getPhotoFromCamera() async {
    XFile? selectedPhoto = await ImagePicker().pickImage(source: ImageSource.camera, maxHeight: 400, maxWidth: 400);
    photoFile = File(selectedPhoto!.path);
    final ref = FirebaseStorage.instance.ref().child('userAccountData/${userUid}/profilePicture');
    await ref.putFile(photoFile!);
    await FirebaseFirestore.instance.collection('userAccountData').doc(userUid).update({'profilePicture': await ref.getDownloadURL()});
    Navigator.pop(context);
  }
  void getPhotoFromGallery() async {
    XFile? selectedPhoto = await ImagePicker().pickImage(source: ImageSource.gallery, maxHeight: 400, maxWidth: 400);
    photoFile = File(selectedPhoto!.path);
    final ref = FirebaseStorage.instance.ref().child('userAccountData/${userUid}/profilePicture');
    await ref.putFile(photoFile!);
    await FirebaseFirestore.instance.collection('userAccountData').doc(userUid).update({'profilePicture': await ref.getDownloadURL()});
    Navigator.pop(context);
  }
  void removeProfilePicture() async {
    final ref = FirebaseStorage.instance.ref().child('userAccountData/${userUid}/profilePicture');
    await ref.delete();
    await FirebaseFirestore.instance.collection('userAccountData').doc(userUid).update({'profilePicture': ''});
    await GetUserData();
    setState(() {
      userProfileImage = userProfileImage;
    });
    Navigator.pop(context);
  }
}
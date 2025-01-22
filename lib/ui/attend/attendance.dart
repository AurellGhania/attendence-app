import 'dart:io';

import 'package:attendance_app/ui/attend/camera_screen.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AttendancScreen extends StatefulWidget {
  final XFile image;
  const AttendancScreen({super.key, required this.image});

  @override
  State<AttendancScreen> createState() => _AttendancScreenState(this.image);
}

class _AttendancScreenState extends State<AttendancScreen> {
  _AttendancScreenState(this.image);

  XFile? image;
  String strAddress = "", date = "", time = "", status = "Attend";
  bool isLoading = false;
  double lat = 0.0, long = 0.0;
  int dateHours = 0, minute = 0;
  final controlleer = TextEditingController();
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

  @override
  void initState() {
    handleLocationPermission();
    setDataTime();
    setAttendStatus();

    if (img != null) {
      isLoading = true;
      getgeoLocationPosittion();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Attendance Report",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
          ),
      ),

      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),

                  ),
                  color: Colors.blueAccent,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 12,),
                    Icon(Icons.face_retouching_natural_outlined)
                    SizedBox(width: 12,),
                    Text(
                      "Please Scan your face!"
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
                child: Text(
                  "Capture image",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const CameraScreen())
                  );
                },

                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                  width: size.width,
                  height: 150,
                  child: DottedBorder(
                    radius: Radius.circular(10),
                    borderType: BorderType.RRect,
                    color: Colors.blueAccent,
                    strokeWidth: 1,
                    dashPattern: [5, 5],
                    child: SizedBox.expand(
                      child: FittedBox(
                        child: image != null
                        ? Image.file(File(image!.path), fit: BoxFit.cover)
                        :Icon(Icons.camera_enhance_outlined)

                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
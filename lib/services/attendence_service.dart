
import 'package:attendance_app/ui/home_screeen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//an entry point for submitting the attendence report
final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendence');

Future<void> submitAttendenceReport(
  BuildContext context, 
  String name, 
  String adress, 
  String attendenceStatus,
  String timeStamp
  ) async {
    showLoaderDialog(context);

    dataCollection.add(
      {
        'name': name,
        'adress': adress,
        'attendenceStatus': attendenceStatus,
        'timeStamp': timeStamp,
      }
      ).then((value) {
        Navigator.of(context).pop();
        try {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle_outline, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'Attendence report submitted successfully',
                  style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              backgroundColor: Colors.orangeAccent,
              shape: StadiumBorder(),
              behavior: SnackBarBehavior.floating
              
            ));
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const HomeScreeen())

            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.white),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Ups! $e",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ));
            }
      });
}

void showLoaderDialog (BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          //utk animasi loading indicator
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text("Please wait..."),
        ),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
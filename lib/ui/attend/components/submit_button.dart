import 'package:attendance_app/services/attendence_service.dart';
import 'package:attendance_app/ui/attend/components/header.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Container buildSubmitButton(BuildContext context, Size size, XFile? image, TextEditingController controlleName, String addres, String status, String timeStamp) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.all(10),
    child: Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          color:  Colors.blueAccent,
          child: InkWell(
            splashColor: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              if (image == null || controlleName.text.isEmpty) {
                showSnackBar(context, "Please fill all the form!");
              } else {
                submitAttendenceReport(context, addres, controlleName.text.toString(), status, timeStamp);
              }
            },
            child: Text(
              "Submit Now!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children: [
        Icon(Icons.info_outline,  color: (Colors.white)),
        SizedBox(width: 10,),
        Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16
            ),
        )
      ],
    ),
    backgroundColor: Colors.blueAccent,
    shape: StadiumBorder(),
    behavior: SnackBarBehavior.floating,
  ));
  
}
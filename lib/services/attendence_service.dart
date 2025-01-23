
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendence');


Future<void> submitReport(
  BuildContext context, 
  String adress, 
  String name, 
  String timeStamp, 
  String status
  ) async {

    //showLoaderDialog(context);
}
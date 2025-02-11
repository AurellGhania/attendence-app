import 'dart:math';

import 'package:attendance_app/ui/history/components/delete_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceHistoryCard extends StatelessWidget {
  //k itu key, v  itu vlaue
  final Map<String, dynamic> data;
  final VoidCallback onDelete;

  const AttendanceHistoryCard({super.key, required this.onDelete, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DeleteDialog(
          documentId: data["id"],
          dataCollection: FirebaseFirestore.instance.collection("attendence"),
          

        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  borderRadius: BorderRadius.all(Radius.circular(50))
                ),

                child: Center(
                  child: Text(
                    //maksudnya sudah mengambil data dari map,
                    //map terdiri dari kry value
                    //
                    data['name'][0].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),
               Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Name: ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14
                            ),
                          ),
                        ),

                        Expanded(
                          child: Text(
                            data['name'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14
                            )
                          ),
                        )
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          "Attendance Status",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14
                          )
                        ),
                        Text(
                        data['description'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14
                        )
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
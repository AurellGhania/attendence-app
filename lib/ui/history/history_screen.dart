import 'package:attendance_app/services/data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  State<AttendanceHistoryScreen> createState() => _AttendanceHistoryScreenState();
}


class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen> {
  //
  final DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance History'),
      ),
      body: StreamBuilder(
        //untuk membungkus widget widget kita menjadi satu kesatuan
        //diganakn utk widget kita menjadi ter manage well
        //untuk menjaga ui kita tetap termanage dengan baik
        stream: dataService.dataCollection.snapshots(),
        //snap shot untuk menghandel/memberitahukan data2 yg kita ambil
        //untuk memberitahukan kepada ui bahwa sudah bisa dipake/diconsume
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //ini artinya kalo snapshot gapunya data
          //karna ada ! di awalnya
          if (!snapshot.hasData) {
            return const Center(
              child: Text("There is no data"),
            );
          }
          //docs adalah sebuah list dari document
          //document adalah representasi dari semua data yg adi di firebase firestore
          final data = snapshot.data!.docs;
          //disuruh nambahin return kalo misalnya dia null
          return ListView.builder(
            //item count adalah jumlah datanya
            itemCount: data.length,
            itemBuilder: (context, index) {
              //ini adalah fungsi untuk membuat item
              //item adalah sebuah widget
              
              //todo : buat attendence card ui disini
            },
          );
        },
      )
    );
  }
}
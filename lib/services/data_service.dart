import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

//get data adalah pengambilan data dari internet
//ini adalh method get, dia mengambil dulu
  Future<QuerySnapshot> getData(){
    return dataCollection.get();
  }

//ini kita lagi buat crud
//ini sekarang lagi buat methode delete
  Future<void> deleteData(String docId) {
    return dataCollection.doc(docId).delete();
  }
}
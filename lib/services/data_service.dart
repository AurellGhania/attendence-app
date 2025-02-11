import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

//get data adalah pengambilan data dari internet
//ini adalh method get, dia mengambil dulu
//get untuk mendapatkan/membaca data dari database
  Future<QuerySnapshot> getData(){
    return dataCollection.get();
  }

//ini kita lagi buat crud
//ini sekarang lagi buat methode delete
  Future<void> deleteData(String docId) {
    //untuk menghapus data dari database
    return dataCollection.doc(docId).delete();
  }
}
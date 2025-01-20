import 'package:attendance_app/ui/home_screeen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //ini jadi nya kita memperkanalkan si firebase nya dulu aja
  //ini itu initialize app
  //kalo kita mau manggil layanan2 lain dari firebase, kita harus memanggil ini dulu
  //si initialize app nya dulu
  //ini setup dulu
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      //data data ini diambil dari file google-services.json
      apiKey: 'AIzaSyAhZxrQdPuvN83BtcosdEwcYIbJqZpukis',  //current key, ambilnya di googlr-services.json
      appId: '1:959813128067:android:11ea531ec052e2517d70b6', // ambilnya dari mobilesdk_app_id
      messagingSenderId: '95981312806', //ambil dari project number
      projectId: 'attendance-app-5939d' , //ambil dari project id
      
      )

  );

  runApp(const AttendenceApp());

}

class AttendenceApp extends StatelessWidget {
  const AttendenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardTheme: const CardTheme(surfaceTintColor: Colors.white,),
        dialogTheme: const DialogTheme(surfaceTintColor: Colors.white, backgroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const HomeScreeen(),
    );
  }
}
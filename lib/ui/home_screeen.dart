import 'package:attendance_app/ui/attend/attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreeen extends StatelessWidget {
  const HomeScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    //maksure kembali apa kaga takutnya ada data yg blm kesimpen
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        _onWillPop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //jadi cara bikin method extraction itu, pertama kita buat dulu kan container nya, nah terus kita bisa langsung ctrl + .  terus tinggal kasih namanya aja deh
                _buildMenuItem(
                  context, 
                  imagePath: "/assets/images/attend.png", 
                  label: "Attendence Report", 
                  destination: const AttendancScreen()
                  ),
                  const SizedBox(height: 40,),
                _buildMenuItem(
                  context, 
                  imagePath: "/assets/images/ic_permission.png", 
                  label: "Permission Report", 
                  destination: const AttendancScreen()
                  ),
                  const SizedBox(height: 40,),
                _buildMenuItem(
                  context, 
                  imagePath: "/assets/images/attendence_history.png", 
                  label: "Attendence History", 
                  destination: const AttendancScreen()
                  ),
                  const SizedBox(height: 40,),

              ],
            ),
          ),
        ),
      )
    );
  }

  Widget _buildMenuItem(//mendefinisikan parameter wajib
    BuildContext context, {
      required String imagePath,
      required String label,
      required Widget destination,
    }) {
    return Container(
                margin: const EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:  (context) => destination )); //ini kita pake parameter destinantion
                    },

                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(imagePath),//diganti ke parameternya
                          height: 100,
                          width: 100,
                        ),

                        SizedBox(height: 10),
                        Text(
                          label,//diganti ke parameternya
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
  }

  Future<bool>_onWillPop(BuildContext context) async {
    return (await showDialog(
      //buat kalo ngetap ga ilang
      //ini kita bikin option nya
      barrierDismissible: false,
      context: context, 
      builder: (context) =>
       AlertDialog(
        title: Text(
          "Information",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
            ),
        ),

        content: Text(
          "Are you sure you want to exit?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),

        actions: [
          TextButton(
            //ini false gara2 ya kita itu false,
            onPressed: () => Navigator.of(context).pop(false), 
            child: Text(
              "No",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            )
          ),

          TextButton(
            //ini untuk keluar dari aplikasi
            onPressed: () => SystemNavigator.pop(), 
            child: Text(
              "Yes",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            )
          )
        ],
      )
      )
      //ini adalah default value ketika semua code yg ada di
      //blok alert dialog tidak terasekusi karna beberapa hal
    ) ??
    false;
  }
}
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
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Expanded(
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:  (context) => const AttendanceApp() ));
                      },

                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('/assets/images/attend.png'),
                            height: 100,
                            width: 100,
                          ),

                          SizedBox(height: 10),
                          Text(
                            "Attendence Report",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40,),

              ],
            ),
          ),
        ),
      )
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
    );
  }
}
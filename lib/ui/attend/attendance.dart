import 'package:attendance_app/services/location_services.dart';
import 'package:attendance_app/services/timestamp_service.dart';
import 'package:attendance_app/ui/attend/components/app_bar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  final XFile? image;

  const AttendanceScreen({super.key, this.image});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState(this.image);
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  _AttendanceScreenState(this.image);

  XFile? image;
  String addres = '', datePlaceholder = '', timePlaceholder = '', timeStampPlaceholder= '', statusPlaceholder = 'Attendt';
  bool isLoading = false;
  final contollerName = TextEditingController();

  @override
    void initState() {
      super.initState();
      handleLocationPermisssion(context);
      setDataTime((date, time, timeStamp){
        setState(() {
          datePlaceholder = date;
          timePlaceholder = time;
          timeStampPlaceholder = timeStamp;
          
        });
      });
      setAttendStatus((statusPlaceholder){
        setState(() {
          statusPlaceholder = statusPlaceholder;
        });
      });



      if (image != null) {
        isLoading = true;
        getGeoLocatorPosition(context, (position) {
          setState(() {
            isLoading = false;
            getAdressFromLongLat(position, (addres) {
              setState(() {
                this.addres = addres;
              });
            });
          });
        });
        
      }

    }
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context)
    );
  }
}
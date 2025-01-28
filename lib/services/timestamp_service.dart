import 'package:intl/intl.dart';

void setDataTime(Function(String, String, String) onDataTimeSet) {
  var dateNow = DateTime.now();
  var dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  var dateTime = DateFormat('hh:mm:ss');


  String date = dateFormat.format(dateNow);
  String time = dateTime.format(dateNow);
  String currentDate = '$date | $time';

  onDataTimeSet(date, time, currentDate);
  
}

void setAttendStatus(Function(String) onStateSet) {
  var dateNow = DateTime.now();
  //parse buat mengubah menjadi string
  var hour = int.parse(DateFormat('hh').format(dateNow));
  var minute = int.parse(DateFormat('mm').format(dateNow));
  
  //kalo kurang dari jam 7, terus masuknya jam 7 pas itu artinya attend
  String attendanceStatus;
  if (hour < 7 || (hour == 7 && minute < 0) ) {
    attendanceStatus = "Attend";
  } else if (hour > 7 || (hour == 7 && minute >= 01)) {
      attendanceStatus = "Late";
  } else {
    attendanceStatus = "Absent";
  }

  onStateSet(attendanceStatus);

}
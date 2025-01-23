import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<void> getGeoLocatorPosition(BuildContext context, Function(Position) onPositionReceived) async {
  // ignore: deprecated_member_use
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  onPositionReceived(position);
}

//longlat titik kordinat
//latitude vertical
//longitude horizontal
Future<void> getAdressFromLongLat(Position position, Function(String) onAddressReceived) async {
  List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
  Placemark place = placemark[0];
  String address = "${place..street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}, ";
  onAddressReceived(address);
}


Future<bool> handleLocationPermisssion(BuildContext context) async{
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.location_off, 
            color: Colors.white
          ),
          SizedBox(width: 10),
          Text(
            "location services are disable, pliss enable the services",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      backgroundColor: Colors.blueGrey,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      ));

      //ini biar kita ngeblokir dianya
      return false;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.location_off,
                color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "location permition denied",  
                  style: TextStyle(color: Colors.white),
                  )
            ]
          ),
          backgroundColor: Colors.blueGrey,
          shape: StadiumBorder(),
          behavior: SnackBarBehavior.floating,
        
        ));
          //ini biar kita ngeblokir dianya

        return false;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.location_off,
              color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                "location permition denied forever, we cannot acces forver",
                style: TextStyle(color: Colors.white),
                )
              ]
            ),
          backgroundColor: Colors.blueGrey,
          shape: StadiumBorder(),
          behavior: SnackBarBehavior.floating,
      ));
      //ini biar kita ngeblokir dianya
    return false;
  }
  //user bisa melakukan aktifitasnya, karena sudah mendapatkan permission
  return true;
}

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraControllerComponent {
  List<CameraDescription>? cameras;
  CameraController? controller;
  bool isBusy = false;
  
  Future<void> loadCamera() async{
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      //[0] itu rear camera
      //[1] itu front camera
      controller = CameraController(cameras![0], ResolutionPreset.high);
      await controller!.initialize();
      
    }
  }

  Widget buildCameraPreview(){
    //kalo bang didepan itu not, kalo bang di akhir itu tidak null
    if (controller == null || !controller!.value.isInitialized) {
      //aksi apabila kondisi bernilai negatif
      return const Center(
        child: CircularProgressIndicator(),
      );
    } 
    //aksi apabila kondisi bernilai positif
    return CameraPreview(controller!);
  }
}
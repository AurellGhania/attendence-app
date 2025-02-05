import 'dart:math';
import 'dart:ui';

import 'package:attendance_app/utils/google_ml_kit.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectorComponent {
  final FaceDetector faceDetector = GoogleMlKit.vision.faceDetector(FaceDetectorOptions(
    enableContours: true,
    enableClassification: true,
    enableTracking: true,
    enableLandmarks: true,
  ));

  Future<void> detectFace(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final faces = await faceDetector.processImage(inputImage);

    // kalo misalkan face nya udah terdeteksi
    //kalo misalkan wajahnya/gambarnya terdeteksi
    for (Face face in faces) {
      final Rect boundingBox = face.boundingBox;
      //untuk menghandle posisi wajah secara vertical
      final double? verticalPosition = face.headEulerAngleY;
      //untuk menghandle posisi wajah secara horizontal
      final double? horizontalPosistion = face.headEulerAngleZ;

      //perkondisian apabila face landmark sudah aktif, ditandai oleh mulut, mata, pipi, hidung
      //ini kita pake nullable, karna kalo dia bisa ada, bisa kaga
      final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
      if (leftEar != null) {
        final Point<int> leftEarPoint = leftEar.position;
        //jika kuping nya terdeteksi, dia return posisi tersebut
        print('Left Ear Position: $leftEarPoint');

      }

      //perkondisian apabila wajahnya terdeteksi(ditandi dengan bibir senyum)
      if (face.smilingProbability != null) {
        final double? smilingProbability = face.smilingProbability;
        print("Smile Probability: $smilingProbability");

      }

      //perkondisian apabila fitur tracting wajah sudah aktif
      if (face.trackingId != null) {
        final int? trackingId = face.trackingId;
        print('Tracking ID: $trackingId');
      }
    }
    
  }
}
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class Vision {
  //ini untuk membuat contrukter kita enjadi private, biar ga sembarang an dipake
  //kaerna ini dibuat untuk deteksi wajah, dan wajah itu sangat private
  //ini adalahh cara untuk membuta dia tidak publik
  Vision._();

  //ini adalahh cara untuk membuat contrukter kita menjadi private
  //ini adalah cara membuat class kita itu safe
  static final Vision instance = Vision._();

  FaceDetector faceDetector([FaceDetectorOptions? option]) {
    return FaceDetector(options: option ?? FaceDetectorOptions());
  }
}
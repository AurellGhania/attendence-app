import 'package:flutter/material.dart';

class SnackBarComponent {
  //static model --> unutk mempertahankan value dari function yang dipanggil
  static void showSnackBar(BuildContext context, String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(
            isError ? Icons.error : Icons.check_circle_outline,
            color:  Colors.white,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 16, 
                color: Colors.white
              ),
            ),
          )
        ],
      )
    ));
  }
}
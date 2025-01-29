import 'package:flutter/material.dart';

Padding buildLocationSection(bool isLoading, String addres) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Location",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        isLoading
        ? Center(
          child: CircularProgressIndicator(
            color: Colors.blueAccent,
          ),
        )
        : Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            //untuk mengatur tinggi dari textfield
            height: 5 * 24,
            child: TextField(
              enabled: false,
              maxLength: 5,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: addres.isNotEmpty ? addres : "Your Location",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.redAccent,
                ),
                fillColor: Colors.transparent,
                filled: true
              ),
            )
          ),
        )
      ]
    ),
  );
}
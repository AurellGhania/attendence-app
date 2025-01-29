import 'package:flutter/material.dart';

Padding buildNameInputField(TextEditingController controlleName) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: TextField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      controller: controlleName,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        labelText: 'Your Name',
        labelStyle: TextStyle(
          fontSize: 14,
          color: Colors.blueAccent
        ),
        hintText: "Please enter your name",
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueAccent),
        )

      )
    )
  );
}
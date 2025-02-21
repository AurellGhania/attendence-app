//buat popup notification

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final String documentId;
  final CollectionReference dataCollection;

  const DeleteDialog({super.key, required this.documentId, required this.dataCollection, Null Function()? onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Delete Data",
        style: TextStyle(
          fontSize: 18,
          color: Colors.black
        ),
      ),
      content: Text(
        "Are you sure you want to delete this data?",
        style: TextStyle(
          fontSize: 14,
          color: Colors.black
        ),
      ),

      actions: [
        TextButton(
          child: Text(
            "Yes",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black
            ),
          ),
          onPressed: () {
            //untuk berkomonikasi dengan database untuk melakukan penghapusan dari db
            dataCollection.doc(documentId).delete();
            Navigator.pop(context);
          },
        ),

        TextButton(
          child: Text(
            "Cancel",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),


      ],
    );
  }
}
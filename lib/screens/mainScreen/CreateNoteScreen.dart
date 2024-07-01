import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/utils/color_utils.dart';

import '../../reusableWidgets/reusableWidgets.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  bool isDisabled = false;
  String email = FirebaseAuth.instance.currentUser!.email ?? "";
  TextEditingController _notesTitle = TextEditingController();
  TextEditingController _notes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("5DA3FA"),
          hexStringToColor("12B0E8"),
          hexStringToColor("CAD5E2")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                      width: 80,
                    ),
                    TextFormField(
                      controller: _notesTitle,
                    ),
                    TextFormField(
                      controller: _notes,
                    ),
                    const SizedBox(
                      height: 30,
                      width: 80,
                    ),
                    ElevatedButton(
                      onPressed: (() async {
                        await FirebaseFirestore.instance
                            .collection('notes')
                            .doc(email)
                            .collection('userNotes')
                            .doc()
                            .set({
                          'Notes Title': _notesTitle.text,
                          'Notes': _notes.text,
                        });

                        Navigator.of(context).pop();
                      }), // button pressed
                      child: const Text("Save"),
                    ),
                  ],
                ))),
      ),
    );
  }
}

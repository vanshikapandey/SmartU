import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/reusableWidgets/reusableWidgets.dart';
import 'package:helloworld/screens/mainScreen/NotesScreen.dart';
import 'package:helloworld/screens/mainScreen/ViewNotesScreen.dart';
import 'package:helloworld/utils/color_utils.dart';

class EditNotesScreen extends StatefulWidget {
  final id;
  const EditNotesScreen({required this.id});

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  bool isEditable = false;
  String email = FirebaseAuth.instance.currentUser!.email ?? "";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('notes')
            .doc(email)
            .collection('userNotes')
            .doc(widget.id)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            TextEditingController _notesTitle =
                TextEditingController(text: snapshot.data!['Notes Title']);
            TextEditingController _notes =
                TextEditingController(text: snapshot.data!['Notes']);

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
                                    .doc(widget.id)
                                    .set({
                                  'Notes Title': _notesTitle.text,
                                  'Notes': _notes.text,
                                });

                                const snackBar = SnackBar(
                                  content: Text('Your Changes are saved.'),
                                  duration: Duration(seconds: 2),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);

                                Future.delayed(Duration(seconds: 2), () {
                                  var nav = Navigator.of(context);
                                  nav.pop();
                                  nav.pop();
                                });

                                // Navigator.of(context).pop();
                                // print("${_notesTitle.text} after");
                              }), // button pressed

                              child: const Text("Save"),
                            ),
                          ],
                        ))),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class GallerySreen extends StatefulWidget {
  const GallerySreen({super.key});

  @override
  State<GallerySreen> createState() => _GallerySreenState();
}

class _GallerySreenState extends State<GallerySreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('photos').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              QuerySnapshot? querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot<Object?>>? documents =
                  querySnapshot?.docs;

              List<Map>? items =
                  documents?.map((e) => e.data() as Map).toList();

              return Padding(
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                        crossAxisCount: 2,
                      ),
                      itemCount: items!.length,
                      itemBuilder: (context, index) {
                        Map currItem = items[index];

                        return Container(
                          width: 0.8,
                          height: 5, // button width and height
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Material(
                            color: Color.fromARGB(255, 201, 226, 249),
                            // button color
                            child: InkWell(
                              splashColor: Colors.greenAccent, // splash color
                              onTap: (() async {
                                try {
                                  String url = currItem['drive link'];
                                  final uri = Uri.parse(url);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri,
                                        mode: LaunchMode.inAppWebView);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                } catch (e) {
                                  print('errorrrrrr,${e}');
                                  return;
                                }
                              }), // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // icon
                                  Text('${currItem['folder name']}',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 4, 9, 91))), // text
                                ],
                              ),
                            ),
                          ),
                        );
                      }));
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/screens/mainScreen/CircularsView.dart';
import 'package:helloworld/utils/color_utils.dart';

class InformationCornerScreen extends StatefulWidget {
  const InformationCornerScreen({super.key});

  @override
  State<InformationCornerScreen> createState() =>
      _InformationCornerScreenState();
}

class _InformationCornerScreenState extends State<InformationCornerScreen> {
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
                padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
                child: Column(
                  children: <Widget>[
                    Text("Latest News"),
                    SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height /
                              8, // button width and height

                          child: const CircularsView(
                              path: "informationcorner/latestnews")),
                    ),
                    Text("Media Coverage"),
                    SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height /
                              8, // button width and height

                          child: const CircularsView(
                              path: "informationcorner/latestnews")),
                    ),
                    Text("Student Corner"),
                    SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height /
                              8, // button width and height

                          child: const CircularsView(
                              path: "informationcorner/latestnews")),
                    ),
                    Text("Quick Links"),
                    SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height /
                              8, // button width and height

                          child: const CircularsView(
                              path: "informationcorner/latestnews")),
                    ),
                    Text("Forms"),
                    SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height /
                              8, // button width and height

                          child: const CircularsView(
                              path: "informationcorner/latestnews")),
                    )
                  ],
                ))),
      ),
    );
  }
}

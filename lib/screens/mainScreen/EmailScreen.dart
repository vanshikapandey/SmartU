import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/color_utils.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select the Mail type'),
      ),
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
                      ElevatedButton(
                        onPressed: () async {
                          String email =
                              Uri.encodeComponent("director@iiitu.ac.in");
                          String subject =
                              Uri.encodeComponent("Leave Application");
                          String body = Uri.encodeComponent(
                              "I'm Student Faculty at IIIT Una");
                          print(subject); //output: Hello%20Flutter
                          Uri mail = Uri.parse(
                              "mailto:$email?subject=$subject&body=$body");
                          if (await launchUrl(mail)) {
                            //email app opened
                          } else {
                            //email app is not opened
                          }
                        },
                        child: const Text("Leave Application"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          String email =
                              Uri.encodeComponent("director@iiitu.ac.in");
                          String subject =
                              Uri.encodeComponent("Event Proposal");
                          String body = Uri.encodeComponent(
                              "I'm Student Faculty at IIIT Una");
                          print(subject); //output: Hello%20Flutter
                          Uri mail = Uri.parse(
                              "mailto:$email?subject=$subject&body=$body");
                          if (await launchUrl(mail)) {
                            //email app opened
                          } else {
                            //email app is not opened
                          }
                        },
                        child: const Text("Event Proposal"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          String email =
                              Uri.encodeComponent("director@iiitu.ac.in");
                          String subject =
                              Uri.encodeComponent("Request for Components");
                          String body = Uri.encodeComponent(
                              "I'm Student Faculty at IIIT Una");
                          print(subject); //output: Hello%20Flutter
                          Uri mail = Uri.parse(
                              "mailto:$email?subject=$subject&body=$body");
                          if (await launchUrl(mail)) {
                            //email app opened
                          } else {
                            //email app is not opened
                          }
                        },
                        child: const Text("Request for Components"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          String email =
                              Uri.encodeComponent("director@iiitu.ac.in");
                          String subject = Uri.encodeComponent("Reimbursement");
                          String body = Uri.encodeComponent(
                              "I'm Student Faculty at IIIT Una");
                          print(subject); //output: Hello%20Flutter
                          Uri mail = Uri.parse(
                              "mailto:$email?subject=$subject&body=$body");
                          if (await launchUrl(mail)) {
                            //email app opened
                          } else {
                            //email app is not opened
                          }
                        },
                        child: const Text("Reimbursement"),
                      ),
                    ],
                  )))),
    );
  }
}

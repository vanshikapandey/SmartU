import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/screens/mainScreen/CircularsView.dart';
import 'package:helloworld/utils/color_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class AcademicBlockScreen extends StatefulWidget {
  const AcademicBlockScreen({super.key});

  @override
  State<AcademicBlockScreen> createState() => _AcademicBlockScreenState();
}

class _AcademicBlockScreenState extends State<AcademicBlockScreen> {
  late String imageUrl;

  final storage = FirebaseStorage.instance;
  @override
  void initState() {
    super.initState();
    // Set the initial value of imageUrl to an empty string
    imageUrl = '';

    //Retrieve the imge grom Firebase Storage
    getImageUrl();
  }

  Future<void> getImageUrl() async {
    // Get the feference to the image file in Firebase Storage
    final ref = storage.ref().child('academicblockmap/BlockDiagram.jpg');

    // Get teh inageUrl to download URL
    final url = await ref.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }

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
                    ElevatedButton(
                      // splash color
                      onPressed: (() async {
                        try {
                          String url = 'https://iiitu.ac.in/about/campus/';
                          final uri = Uri.parse(url);
                          if (await canLaunchUrl(uri)) {
                            print(imageUrl);
                            await launchUrl(uri, mode: LaunchMode.inAppWebView);
                          } else {
                            throw 'Could not launch $url';
                          }
                        } catch (e) {
                          print('errorrrrrr,${e}');
                          return;
                        }
                      }), // button pressed
                      child: const Text("Campus Gallery"),
                    ),
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Hero(
                          tag: 'imageHero',
                          child: Image.network(
                            '${imageUrl}',
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    // SizedBox(
                    //     height: 300,
                    //     child: Image(
                    //       image: NetworkImage(imageUrl),
                    //       fit: BoxFit.cover,
                    //     )),
                  ],
                ))),
      ),
    );
  }
}

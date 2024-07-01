import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/screens/mainScreen/UploadPdf.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:helloworld/screens/mainScreen/PDFViewer.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class CircularScreen extends StatefulWidget {
  const CircularScreen({super.key});

  @override
  State<CircularScreen> createState() => _CircularScreenState();
}

class _CircularScreenState extends State<CircularScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('notes').snapshots(),
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

                return ListView.builder(
                    itemCount: items!.length,
                    itemBuilder: (context, index) {
                      Map currItem = items[index];
                      return ListTile(
                        title: Text('${currItem['name']}'),
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PdfViewerPage(
                                        url: currItem['image'],
                                      )));
                        }),
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            }),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UploadPdf(),
                ));
          },
          label: const Text('Upload'),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.blue,
        ));
  }
}

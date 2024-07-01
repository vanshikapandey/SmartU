import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/screens/mainScreen/UploadPdf.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:helloworld/screens/mainScreen/PDFViewer.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../reusableWidgets/FirebaseFile.dart';
import 'Circulars.dart';

class CircularsView extends StatefulWidget {
  final String path;
  const CircularsView({required this.path});

  @override
  State<CircularsView> createState() => _CircularsViewState();
}

class _CircularsViewState extends State<CircularsView> {
  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseApi.listAll('${widget.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<FirebaseFile>>(
          future: futureFiles,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              final files = snapshot.data!;

              return ListView.builder(
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    final currItem = files[index];
                    return ListTile(
                      title: Text('${currItem.name}'),
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PdfViewerPage(
                                      url: currItem.url,
                                    )));
                      }),
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          }),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => UploadPdf(),
      //         ));
      //   },
      //   label: const Text('Upload'),
      //   icon: const Icon(Icons.add),
      //   backgroundColor: Colors.blue,
      // )
    );
  }
}

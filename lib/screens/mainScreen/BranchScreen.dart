import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/screens/mainScreen/CircularsView.dart';

import '../../utils/color_utils.dart';

class BranchScreen extends StatefulWidget {
  final String year;
  const BranchScreen({required this.year});

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CircularsView(path: "${widget.year}/cse"),
                              ));
                        },
                        child: const Text("CSE"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CircularsView(path: "${widget.year}/ece"),
                              ));
                        },
                        child: const Text("ECE"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CircularsView(path: "${widget.year}/it"),
                              ));
                        },
                        child: const Text("IT"),
                      ),
                    ],
                  )))),
    );
  }
}

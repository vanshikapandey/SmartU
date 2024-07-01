import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/screens/mainScreen/InformationCornerScreen.dart';
import 'package:helloworld/screens/mainScreen/NotesScreen.dart';
import 'package:helloworld/screens/mainScreen/mainScreen.dart';
import 'package:helloworld/screens/profile/profile_screen.dart';
import 'package:helloworld/screens/signInScreen.dart';
import 'package:helloworld/utils/color_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final widgetOptions = [
    new MainScreen(),
    new NotesScreen(),
    new InformationCornerScreen(),
    new ProfileScreen(),
    // new NotesScreen(),
    // new InfoCornerScreen(),
  ];

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
          child: widgetOptions.elementAt(_currentIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.notes_outlined),
              label: 'Notes',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_agenda),
              label: 'Information Corner',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Me',
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: ElevatedButton(
//       child: Text("Logout"),
//       onPressed: () {
//         FirebaseAuth.instance.signOut().then((value) {
//           print("Signed out!!!!!!!!!!!");
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => SignInScreen()));
//         });
//       },
//     )));
//   }
// }

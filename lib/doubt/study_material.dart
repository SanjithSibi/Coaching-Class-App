// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:tcda_app/login.dart';

// class Materials extends StatefulWidget {
//   const Materials({super.key});
//   @override
//   State<Materials> createState() => _MaterialsState();
// }

// class _MaterialsState extends State<Materials> {
//   // Function to show the logout confirmation dialog
//   Future<void> _showLogoutConfirmationDialog() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible:
//           false, // Prevents closing the dialog by tapping outside
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Logout'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text('Are you sure you want to log out?'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Closes the dialog
//               },
//             ),
//             TextButton(
//               child: Text('Logout'),
//               onPressed: () {
//                 FirebaseAuth.instance.signOut().then((value) {
//                   print("Signed out");
//                   Navigator.pushReplacement(
//                     // Replace the current route
//                     context,
//                     MaterialPageRoute(builder: (context) => LoginPage()),
//                   );
//                 });
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 253, 249, 249),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         automaticallyImplyLeading: false,
//         title: Text('Study Materials'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               _showLogoutConfirmationDialog(); // Show the logout confirmation dialog
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:tcda_app/Users/existing_users_icon_page.dart';

// import '../reusable_widgets/reusable_widgets.dart';
// import '../utils/color_utils.dart';

// class AddNewUser extends StatefulWidget {
//   const AddNewUser({super.key});

//   @override
//   State<AddNewUser> createState() => _AddNewUserState();
// }

// class _AddNewUserState extends State<AddNewUser> {
//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();
//   TextEditingController _userNameTextController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           "Add New User",
//           style: TextStyle(
//               fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//           hexStringToColor("FF7817"),
//           hexStringToColor("122C6C"),
//           // hexStringToColor("FF7817")
//         ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(
//                 20, MediaQuery.of(context).size.height * 0.2, 20, 0),
//             child: Column(children: <Widget>[
//               SizedBox(
//                 height: 20,
//               ),
//               reusableTextField("Enter UserName", Icons.person_outline, false,
//                   _userNameTextController),
//               const SizedBox(
//                 height: 20,
//               ),
//               reusableTextField("Enter Email Id", Icons.person_outline, false,
//                   _emailTextController),
//               const SizedBox(
//                 height: 20,
//               ),
//               reusableTextField("Enter Password", Icons.lock_outlined, true,
//                   _passwordTextController),
//               const SizedBox(
//                 height: 20,
//               ),
//               signInSignUpButton(context, false, () {
//                 FirebaseAuth.instance
//                     .createUserWithEmailAndPassword(
//                         email: _emailTextController.text,
//                         password: _passwordTextController.text)
//                     .then((value) {
//                   print("Created New Account");
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => HomeScreen()));
//                 }).onError((error, stackTrace) {
//                   print("Error ${error.toString()}");
//                 });
//               })
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }

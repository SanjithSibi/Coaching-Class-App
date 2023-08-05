// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:tcda_app/Users/existing_users_icon_page.dart';
// import 'package:tcda_app/Users/new_user_signup.dart';
// import 'package:tcda_app/utils/color_utils.dart';

// import '../Admin/Admin_login_screen.dart';
// import '../reusable_widgets/reusable_widgets.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//               logoWidget("assets/logo.png"),
//               SizedBox(
//                 height: 30,
//               ),
//               reusableTextField("Enter user Email", Icons.person_2_outlined,
//                   false, _emailTextController),
//               SizedBox(
//                 height: 20,
//               ),
//               reusableTextField("Enter Password", Icons.lock_outline, true,
//                   _passwordTextController),
//               SizedBox(
//                 height: 20,
//               ),
//               signInSignUpButton(context, true, () {
//                 FirebaseAuth.instance
//                     .signInWithEmailAndPassword(
//                         email: _emailTextController.text,
//                         password: _passwordTextController.text)
//                     .then((value) {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => HomeScreen()));
//                 }).onError((error, stackTrace) {
                  
//                   print("Error ${error.toString()}");
//                 });
//               }),
//               signUpOption(),
//               AdminOption()
//             ]),
//           ),
//         ),
//       ),
//     );
//   }

//   Row signUpOption() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         const Text(
//           "New User ?",
//           style: TextStyle(color: Colors.white70),
//         ),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => NewUser()));
//           },
//           child: const Text(
//             " Sign Up",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }

//   Row AdminOption() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         SizedBox(
//           height: 50,
//         ),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => AdminLoginScreen()));
//           },
//           child: const Text(
//             "Admin ?",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tcda_app/Admin/dashboard.dart';
import 'package:tcda_app/Users/Redirect_to_google_meet.dart';
import 'package:tcda_app/Users/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:tcda_app/Admin/dashboard.dart';
// import 'package:tcda_app/Users/signin_screen.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("SideBar Tutorial"),
//           backgroundColor: Colors.lightBlue,
//           centerTitle: true,
//         ),
//         drawer: DashBoard(),
//       ),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tcda_app/Admin/Student%20Management/add_new_user.dart';
import 'package:tcda_app/Admin/dashboard.dart';
import 'package:tcda_app/Admin/new_enquries.dart';

import 'package:tcda_app/login.dart';
import 'package:tcda_app/reusable_widgets/notifications/db/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DBHelper.initDb();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'TCDA App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: Register());
    //  MaterialApp(
    //     title: 'TCDA App',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     debugShowCheckedModeBanner: false,
    //     home: LoginPage());
  }
}

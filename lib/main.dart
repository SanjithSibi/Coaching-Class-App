import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tcda_app/Admin/update_sample_question_papers.dart';
import 'package:tcda_app/New%20User/intro.dart';
import 'package:tcda_app/doubt/viw_pdf.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCDA App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const NewUserIntro(),
    );
  }
}

// leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             // Navigate to the previous page
//             Navigator.of(context).pop();
//           },
//         ),

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class MyApp extends StatelessWidget {
//   final databaseReference = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Firebase Demo'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: () {
//                   // Show Date Picker Dialog
//                   showDatePickerDialog(context);
//                 },
//                 child: Text('Select Date'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void showDatePickerDialog(BuildContext context) async {
//     DateTime? selectedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2030),
//     );

//     if (selectedDate != null) {
//       // Convert the selected date to Timestamp
//       Timestamp timestamp = Timestamp.fromDate(selectedDate);

//       // Store the timestamp in Firebase
//       await databaseReference.collection('dates').add({
//         'date': timestamp,
//       });

//       print('Date added to Firebase');
//     }
//   }
// }

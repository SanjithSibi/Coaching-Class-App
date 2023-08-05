// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';

// class PDFListView extends StatefulWidget {
//   @override
//   // ignore: library_private_types_in_public_api
//   _PDFListViewState createState() => _PDFListViewState();
// }

// class _PDFListViewState extends State<PDFListView> {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   List<Map<String, dynamic>> pdfData = [];

//   get index => null;

//   Future<String?> uploadPdf(String fileName, File file) async {
//     // ignore: unused_local_variable
//     final reference =
//         FirebaseStorage.instance.ref().child("pdfs/$fileName.pdf");

//     // ignore: non_constant_identifier_names
//     final UploadTask = reference.putFile(file);

//     await UploadTask.whenComplete(() {});

//     final downloadLink = await reference.getDownloadURL();

//     return downloadLink;
//   }

//   void pickFile() async {
//     final pickedFile = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );

//     if (pickedFile != null) {
//       String fileName = pickedFile.files[0].name;

//       File file = File(pickedFile.files[0].path!);

//       final downloadLink = await uploadPdf(fileName, file);

//       await _firebaseFirestore.collection("pdf").add({
//         "name": fileName,
//         "link": downloadLink,
//       });
//       print("Pdf uploaded Successfully");
//     }
//   }

//   void getAllPdf() async {
//     final results = await _firebaseFirestore.collection("pdf").get();
//     pdfData = results.docs.map((e) => e.data()).toList();

//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     getAllPdf();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//             toolbarHeight: 32,
//             backgroundColor: Color.fromARGB(255, 238, 39, 39),
//             centerTitle: true,
//             title: const Text("PDFs")),

//         body: GridView.builder(
//             itemCount: pdfData.length,
//             gridDelegate:
//                 SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                           builder: (context) => PDFViewerScreen(
//                                 pdfUrl: pdfData[index]['link'],
//                               )),
//                     );
//                   },
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Container(
//                           // decoration: BoxDecoration(
//                           //   border: Border.all(),
//                           // ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Stack(
//                                 alignment: AlignmentDirectional.topEnd,
//                                 clipBehavior: Clip.none,
//                                 children: [
//                                   const Card(
//                                     child: Padding(
//                                         padding:
//                                             EdgeInsets.fromLTRB(24, 30, 24, 30),
//                                         child: Image(
//                                             image: NetworkImage(
//                                                 'https://th.bing.com/th/id/OIP.cDOmdRU6A04DRQkvZx62eAAAAA?w=162&h=199&c=7&r=0&o=5&pid=1.7',
//                                                 scale: 4))),
//                                   ),
//                                   Positioned(
//                                       top: -30,
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           print('dbadn');
//                                         },
//                                         child: Container(
//                                           // ignore: sort_child_properties_last
//                                           child: const Icon(Icons.delete_sharp,
//                                               color: Color.fromARGB(
//                                                   255, 221, 17, 3),
//                                               size: 18),
//                                           padding: const EdgeInsets.all(18),
//                                           decoration: const BoxDecoration(
//                                             color: Color.fromARGB(
//                                                 255, 245, 232, 232),
//                                             shape: BoxShape.circle,
//                                           ),
//                                         ),
//                                       )),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Center(
//                           child: Text(
//                             pdfData[index]['name'],
//                             style: TextStyle(
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.upload_file),
//           onPressed: pickFile,
//         ),
//         // ListView.builder(
//         //     itemCount: 13,
//         //     // ignore: non_constant_identifier_names
//         //     itemBuilder: (context, int PDFs) {
//         //       return ListTile(
//         //           leading: const Image(
//         //               image: NetworkImage(
//         //                   "https://yebu.com/wp-content/uploads/2020/06/PDF-2-1000x1000.jpg")),
//         //           trailing: IconButton(
//         //             icon: const Icon(Icons.arrow_circle_right_outlined),
//         //             color: const Color.fromARGB(255, 248, 63, 63),
//         //             onPressed: () {},
//         //           ),
//         //           title: Text("student $PDFs "));
//         //     }),
//       ),
//     );
//   }
// }

// class PDFViewerScreen extends StatefulWidget {
//   final String pdfUrl;

//   PDFViewerScreen({super.key, required this.pdfUrl});

//   @override
//   State<PDFViewerScreen> createState() => _PDFViewerScreenState();
// }

// class _PDFViewerScreenState extends State<PDFViewerScreen> {
//   PDFDocument? document;
//   void initialisePdf() async {
//     document = await PDFDocument.fromURL(widget.pdfUrl);
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     initialisePdf();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: document != null
//             ? PDFViewer(
//                 document: document!,
//               )
//             : Center(
//                 child: CircularProgressIndicator(),
//               ));
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tcda_app/login.dart';

class PDFListViews extends StatefulWidget {
  @override
  _PDFListViewsState createState() => _PDFListViewsState();
}

class _PDFListViewsState extends State<PDFListViews> {
  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                });
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> pdfData = [];

  Future<String?> uploadPdf(String fileName, File file) async {
    final reference =
        FirebaseStorage.instance.ref().child("pdfs/$fileName.pdf");

    final uploadTask = reference.putFile(file);

    await uploadTask.whenComplete(() {});

    final downloadLink = await reference.getDownloadURL();

    return downloadLink;
  }

  void getAllPdf() async {
    final results = await _firebaseFirestore.collection("pdf").get();
    pdfData = results.docs
        .map((e) => {
              'id': e.id,
              'name': e.data()['name'],
              'link': e.data()['link'],
            })
        .toList();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllPdf();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          automaticallyImplyLeading: false,
          title: Text(
            'Study Materials',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back, // Use the back icon
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Pop the current screen to go back
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: () {
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
        body: GridView.builder(
          itemCount: pdfData.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PDFViewerScreen(
                        pdfUrl: pdfData[index]['link'],
                      ),
                    ),
                  );
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.topEnd,
                              clipBehavior: Clip.none,
                              children: [
                                const Card(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(24, 30, 24, 30),
                                    child: Image(
                                      image: NetworkImage(
                                        'https://th.bing.com/th/id/OIP.cDOmdRU6A04DRQkvZx62eAAAAA?w=162&h=199&c=7&r=0&o=5&pid=1.7',
                                        scale: 4,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          pdfData[index]['name'],
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PDFViewerScreen extends StatefulWidget {
  final String pdfUrl;

  PDFViewerScreen({required this.pdfUrl});

  @override
  State<PDFViewerScreen> createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  PDFDocument? document;

  void initialisePdf() async {
    document = await PDFDocument.fromURL(widget.pdfUrl);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initialisePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context); // Pop the current screen to go back
          },
        ),
      ),
      body: document != null
          ? PDFViewer(document: document!)
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

// class PDFViewerScreen extends StatefulWidget {
//   final String pdfUrl;

//   PDFViewerScreen({required this.pdfUrl});

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
//       body: document != null
//           ? PDFViewer(document: document!)
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
// }

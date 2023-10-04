import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class updateQuestionPapers extends StatefulWidget {
  @override
  _updateQuestionPapersState createState() => _updateQuestionPapersState();
}

class _updateQuestionPapersState extends State<updateQuestionPapers> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> pdfData = [];

  Future<String?> uploadPdf(String fileName, File file) async {
    final reference =
        FirebaseStorage.instance.ref().child("questionpaper/$fileName.pdf");

    final uploadTask = reference.putFile(file);

    await uploadTask.whenComplete(() {});

    final downloadLink = await reference.getDownloadURL();

    return downloadLink;
  }

  Future<void> deletePdf(String pdfId, String fileName) async {
    await _firebaseFirestore.collection("questionpapers").doc(pdfId).delete();

    final reference =
        FirebaseStorage.instance.ref().child("questionpaper/$fileName.pdf");

    await reference.delete();

    setState(() {
      pdfData.removeWhere((item) => item['id'] == pdfId);
    });
  }

  void pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pickedFile != null) {
      String fileName = pickedFile.files[0].name;

      File file = File(pickedFile.files[0].path!);

      final downloadLink = await uploadPdf(fileName, file);

      await _firebaseFirestore.collection("questionpapers").add({
        "name": fileName,
        "link": downloadLink,
      });

      print("PDF uploaded successfully");
      getAllPdf();
    }
  }

  void getAllPdf() async {
    final results = await _firebaseFirestore.collection("questionpapers").get();
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
          toolbarHeight: 32,
          backgroundColor: Color.fromARGB(255, 238, 39, 39),
          centerTitle: true,
          title: const Text("PDFs"),
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
                                Positioned(
                                  top: -30,
                                  child: GestureDetector(
                                    onTap: () {
                                      String pdfId = pdfData[index]['id'];
                                      String fileName = pdfData[index]['name'];
                                      deletePdf(pdfId, fileName);
                                    },
                                    child: Container(
                                      child: const Icon(
                                        Icons.delete_sharp,
                                        color: Color.fromARGB(255, 221, 17, 3),
                                        size: 28,
                                      ),
                                      padding: const EdgeInsets.all(18),
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 245, 232, 232),
                                        shape: BoxShape.circle,
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.upload_file),
          onPressed: pickFile,
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
            Navigator.pop(context); 
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

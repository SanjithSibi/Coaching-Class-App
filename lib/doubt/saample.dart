import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class PDFListView extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _PDFListViewState createState() => _PDFListViewState();
}

class _PDFListViewState extends State<PDFListView> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<String?> uploadPdf(String fileName, File file) async {
    // ignore: unused_local_variable
    final reference = FirebaseStorage.instance.ref().child("pdfs/$fileName");

    // ignore: non_constant_identifier_names
    final UploadTask = reference.putFile(file);

    await UploadTask.whenComplete(() {});

    final downloadLink = await reference.getDownloadURL();

    return downloadLink;
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

      await _firebaseFirestore.collection("pdf").add({
        "name": fileName,
        "link": downloadLink,
      });
      print("Pdf uploaded Successfully");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            toolbarHeight: 32,
            backgroundColor: Color.fromARGB(255, 238, 39, 39),
            centerTitle: true,
            title: const Text("PDFs")),
        body: GridView.builder(
            itemCount: 10,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, Index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          "https://yebu.com/wp-content/uploads/2020/06/PDF-2-1000x1000.jpg",
                          height: 120,
                          width: 100,
                        ),
                        Text(
                          "Pdf Name",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.upload_file),
          onPressed: pickFile,
        ),
        // ListView.builder(
        //     itemCount: 13,
        //     // ignore: non_constant_identifier_names
        //     itemBuilder: (context, int PDFs) {
        //       return ListTile(
        //           leading: const Image(
        //               image: NetworkImage(
        //                   "https://yebu.com/wp-content/uploads/2020/06/PDF-2-1000x1000.jpg")),
        //           trailing: IconButton(
        //             icon: const Icon(Icons.arrow_circle_right_outlined),
        //             color: const Color.fromARGB(255, 248, 63, 63),
        //             onPressed: () {},
        //           ),
        //           title: Text("student $PDFs "));
        //     }),
      ),
    );
  }
}

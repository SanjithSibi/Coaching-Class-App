import 'package:flutter/material.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPagess extends StatefulWidget {
  final Map<String, dynamic> invoiceData; // Add this line

  const PdfPagess({Key? key, required this.invoiceData}) : super(key: key);

  @override
  _PdfPagessState createState() => _PdfPagessState();
}

class _PdfPagessState extends State<PdfPagess> {
  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Container(
              decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.red, width: 2),
                  borderRadius: pw.BorderRadius.circular(2)),
              child: pw.Padding(
                  padding: pw.EdgeInsets.all(12),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Text(
                              'STUDENT DETAILS',
                              style: pw.TextStyle(
                                  fontSize: 24,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColors.red),
                            ),
                          ]),
                      pw.SizedBox(height: 60),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Row(children: [
                              pw.Text("Name        :",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 22,
                                      color: PdfColors.blue900)),
                              pw.Text(' ${widget.invoiceData['name']}',
                                  style: pw.TextStyle(
                                    fontSize: 25,
                                    fontWeight: pw.FontWeight.normal,
                                  )),
                            ]),
                            pw.SizedBox(height: 24),
                            pw.Row(children: [
                              pw.Text("Roll No     :",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 22,
                                      color: PdfColors.blue900)),
                              pw.Text(' ${widget.invoiceData['rollnum']}',
                                  style: const pw.TextStyle(
                                    fontSize: 25,
                                  )),
                            ]),
                            pw.SizedBox(height: 24),
                            pw.Row(children: [
                              pw.Text("Phone no :",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 22,
                                      color: PdfColors.blue900)),
                              pw.Text(' +91 ${widget.invoiceData['phno']}',
                                  style: const pw.TextStyle(
                                    fontSize: 25,
                                  )),
                            ]),
                            pw.SizedBox(height: 16),
                            pw.Row(children: [
                              pw.Text("Address   :",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 22,
                                      color: PdfColors.blue900)),
                              pw.Text(' ${widget.invoiceData['address']}',
                                  style: const pw.TextStyle(
                                    fontSize: 25,
                                  )),
                            ]),
                            pw.SizedBox(height: 24),
                            pw.Row(children: [
                              pw.Text("Email        :",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 22,
                                      color: PdfColors.blue900)),
                              pw.Text(' ${widget.invoiceData['email']}',
                                  style: const pw.TextStyle(
                                    fontSize: 25,
                                  )),
                            ]),
                            pw.SizedBox(height: 24),
                            pw.Row(children: [
                              pw.Text("Date of birth :",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 22,
                                      color: PdfColors.blue900)),
                              pw.Text(' ${widget.invoiceData['dob']}',
                                  style: const pw.TextStyle(
                                    fontSize: 25,
                                  )),
                            ]),
                            pw.SizedBox(height: 24),
                            pw.Row(children: [
                              pw.Text("Course      :",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 22,
                                      color: PdfColors.blue900)),
                              pw.Text(' ${widget.invoiceData['course']}',
                                  style: const pw.TextStyle(
                                    fontSize: 25,
                                  )),
                            ]),
                            pw.SizedBox(height: 24),
                            pw.Row(children: [
                              pw.Text("Join Date  :",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 22,
                                      color: PdfColors.blue900)),
                              pw.Text(' ${widget.invoiceData['joindate']}',
                                  style: const pw.TextStyle(
                                    fontSize: 25,
                                  )),
                            ]),
                            pw.SizedBox(height: 24),
                            pw.Row(children: [
                              pw.Text("Fees Paid :",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 22,
                                      color: PdfColors.blue900)),
                              pw.Text(' ${widget.invoiceData['totalamt']}',
                                  style: const pw.TextStyle(
                                    fontSize: 25,
                                  )),
                            ]),
                          ]),
                    ],
                  )));
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 38,
        backgroundColor: const Color.fromARGB(255, 32, 36, 61),
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'Student Document',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 48,
            )
          ],
        ),
      ),
      body: PdfPreview(
        maxPageWidth: 1500,
        build: (format) => pdf.save(),
      ),
    );
  }
}

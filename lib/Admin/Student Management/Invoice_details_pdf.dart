import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

class PdfPages extends StatefulWidget {
  final Map<String, dynamic> invoiceData;

  const PdfPages({Key? key, required this.invoiceData}) : super(key: key);

  @override
  _PdfPagessState createState() => _PdfPagessState();
}

class _PdfPagessState extends State<PdfPages> {
  final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;

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
      body: FutureBuilder<void>(
        future: generatePdf(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return PdfPreview(
              build: (format) => pdf.save(),
            );
          }
        },
      ),
    );
  }

  Future<void> generatePdf() async {
    // Load the image from an asset
    final ByteData data = await rootBundle.load('assets/tcda.jpg');
    final Uint8List uint8List = data.buffer.asUint8List();
    final pdfImage = pw.MemoryImage(uint8List);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
                pw.Image(pdfImage, width: 157),
              ]),
              pw.SizedBox(
                height: 12,
              ),
              pw.Container(height: 4, color: PdfColors.grey300),
              pw.SizedBox(height: 4),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
                pw.Text("INVOICE :",
                    style: pw.TextStyle(
                      color: PdfColors.black,
                      fontSize: 30,
                      fontWeight: pw.FontWeight.bold,
                    )),
                pw.Text(" INV185",
                    style: pw.TextStyle(
                      color: PdfColors.black,
                      fontSize: 30,
                      fontWeight: pw.FontWeight.bold,
                    ))
              ]),
              pw.SizedBox(height: 4),
              pw.Container(height: 4, color: PdfColors.grey300),
              pw.SizedBox(
                height: 8,
              ),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(children: [
                      pw.SizedBox(height: 18),
                      pw.Text("company The creative\nDesign Academy",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.normal)),
                    ]),
                    pw.Text(" The creative Design Academy",
                        style: pw.TextStyle(
                            fontSize: 15, fontWeight: pw.FontWeight.normal))
                  ]),

              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Row(children: [
                      pw.Text("Name :",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.normal)),
                      pw.Text(' ${widget.invoiceData['name']}',
                          style: pw.TextStyle(
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          )),
                    ]),
                    pw.Row(children: [
                      pw.Column(children: [
                        pw.SizedBox(height: 8),
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              pw.Text("Address: 99 Arunachalam",
                                  style: pw.TextStyle(
                                      fontSize: 15,
                                      fontWeight: pw.FontWeight.normal)),
                              pw.Text("RoadWest,RS Pura",
                                  style: pw.TextStyle(
                                      fontSize: 15,
                                      fontWeight: pw.FontWeight.normal)),
                            ]),
                      ]),
                    ]),
                  ]),
              pw.SizedBox(height: 8),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Row(children: [
                      pw.Text("Member ID :",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.normal)),
                      pw.Text(' ${widget.invoiceData['rollnum']}',
                          style: pw.TextStyle(
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          )),
                    ]),
                    pw.SizedBox(height: 8),
                    pw.Row(children: [
                      pw.Column(children: [
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              pw.Text("Email : tcda2015@gmail.com",
                                  style: pw.TextStyle(
                                      fontSize: 15,
                                      fontWeight: pw.FontWeight.normal)),
                            ]),
                      ]),
                    ]),
                  ]),
              pw.SizedBox(height: 8),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Row(children: [
                      pw.Text("Address :",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.normal)),
                      pw.Text(' ${widget.invoiceData['address']}',
                          style: pw.TextStyle(
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          )),
                    ]),
                    pw.SizedBox(height: 8),
                    pw.Row(children: [
                      pw.Column(children: [
                        pw.Text("Phone: 8220447222",
                            style: pw.TextStyle(
                                fontSize: 15,
                                fontWeight: pw.FontWeight.normal)),
                      ]),
                    ]),
                  ]),
              pw.SizedBox(height: 8),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text("Coimbatore 641002 Tamilnadu",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.normal)),
                      pw.SizedBox(height: 8),
                      pw.Text("Website: tcda.in",
                          style: pw.TextStyle(
                              fontSize: 19, fontWeight: pw.FontWeight.normal)),
                    ]),
              ]),
              pw.SizedBox(height: 20),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("INVOICE DATE",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 16,
                            color: PdfColors.orange900)),
                    pw.Text("COURSE",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 16,
                            color: PdfColors.orange900)),
                    pw.Text("BATCH",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 16,
                            color: PdfColors.orange800)),
                    pw.Text("AMOUNT",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 16,
                            color: PdfColors.orange900)),
                  ]),

              pw.Container(height: 4, color: PdfColors.grey300),
              pw.SizedBox(height: 12),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(' ${widget.invoiceData['paydate']}',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 16,
                            color: PdfColors.grey800)),
                    pw.Text(' ${widget.invoiceData['course']}',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 16,
                            color: PdfColors.grey800)),
                    pw.Text(' ${widget.invoiceData['batch']}',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 16,
                            color: PdfColors.grey800)),
                    pw.Text(' ${widget.invoiceData['amountpaide']}',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 16,
                            color: PdfColors.grey800)),
                  ]),
              pw.SizedBox(height: 20),
              pw.Column(children: [
                pw.Padding(
                  padding: pw.EdgeInsets.all(18),
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("Final Amount",
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 20,
                                color: PdfColors.black)),
                        pw.SizedBox(width: 26, height: 30),
                        pw.Text(' ${widget.invoiceData['amountpaide']}',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 20,
                                color: PdfColors.black)),
                      ]),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(18),
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("Paid Amount",
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 20,
                                color: PdfColors.black)),
                        pw.SizedBox(width: 26, height: 30),
                        pw.Text(' ${widget.invoiceData['totalamt']}',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 20,
                                color: PdfColors.black)),
                      ]),
                )
              ]),

              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Container(
                    color: PdfColors.amber,
                    height: 50,
                    width: 250,
                    child: pw.Padding(
                      padding: pw.EdgeInsets.all(18),
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Due Amount",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 20,
                                    color: PdfColors.black)),
                            pw.SizedBox(width: 26, height: 30),
                            pw.Text(' ${widget.invoiceData['amountpaide']}',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 20,
                                    color: PdfColors.black)),
                          ]),
                    )),
              ]),
              pw.SizedBox(height: 30),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
                pw.Text(
                    "*No Refund**No Transfer**Cheques would be subjected to realisation*",
                    style: pw.TextStyle(fontSize: 13))
              ]),
              // ... rest of your PDF content
            ],
          );
        },
      ),
    );
  }
}

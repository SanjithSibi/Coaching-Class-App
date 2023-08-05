import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';

Future<List<Map<String, dynamic>>> fetchData() async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection('expence').get();

  List<Map<String, dynamic>> allData = querySnapshot.docs
      .map((QueryDocumentSnapshot<Map<String, dynamic>> document) =>
          document.data())
      .toList();

  return allData;
}

// Future<void> addEventData(BuildContext context) async {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController priceController =
//       TextEditingController(); // New controller for price

//   await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Add Event'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: InputDecoration(labelText: 'Title'),
//             ),
//             TextField(
//               controller: descriptionController,
//               decoration: InputDecoration(labelText: 'Description'),
//             ),
//             TextField(
//               controller: priceController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Price'),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () async {
//               try {
//                 await FirebaseFirestore.instance.collection('expence').add({
//                   'title': titleController.text,
//                   'description': descriptionController.text,
//                   'timestamp': Timestamp.now(),
//                   'price': double.parse(
//                       priceController.text), // Save the price as a double
//                 });
//                 Navigator.of(context).pop();
//               } catch (error) {
//                 // Handle the error appropriately
//                 print('Error adding event data: $error');
//               }
//             },
//             child: Text('Add'),
//           ),
//         ],
//       );
//     },
//   );
// }

class addExpence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event List'),
      ),
      body: Column(
        children: [
          // Container(
          //   width: 200,
          //   height: 50,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       addEventData(context);
          //     },
          //     child: Text('Add Event'),
          //   ),
          // ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FutureBuilder<List<Map<String, dynamic>>>(
                  future: fetchData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.hasError || snapshot.data == null) {
                      return Text('Error: ${snapshot.error ?? "Data is null"}');
                    }

                    // Calculate total price
                    double totalPrice = snapshot.data!
                        .map((eventData) => eventData['price'] as double)
                        .fold(
                            0,
                            (previousValue, element) =>
                                previousValue + element);

                    return Column(
                        // children: [
                        //   Text(
                        //     'Total Events: ${snapshot.data!.length}',
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        //   Text(
                        //     'Total Price: $totalPrice',
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ],
                        );
                  },
                ),
                Expanded(
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: fetchData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError || snapshot.data == null) {
                        return Text(
                            'Error: ${snapshot.error ?? "Data is null"}');
                      }
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final eventData = snapshot.data![index];
                          final timestamp = eventData['timestamp'] as Timestamp;
                          final eventDate = timestamp.toDate();
                          final formattedDate =
                              '${eventDate.year}-${eventDate.month}-${eventDate.day}';
                          // return ListTile(
                          //   title: Text(eventData['title']),
                          //   subtitle: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(eventData['description']),
                          //       Text('Date: $formattedDate'),
                          //     ],
                          //   ),
                          //   // Display other relevant data here
                          // );
                        },
                      );
                    },
                  ),
                ),
                // Add the PieChart widget here
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: fetchData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError || snapshot.data == null) {
                        return Text(
                            'Error: ${snapshot.error ?? "Data is null"}');
                      }

                      // Calculate total price

                      double totalPrice = snapshot.data!
                          .map((eventData) => eventData['price'] as double)
                          .fold(
                              0,
                              (previousValue, element) =>
                                  previousValue + element);

                      // Calculate the amount per month
                      Map<String, double> amountPerMonth = {};

                      for (var eventData in snapshot.data!) {
                        final timestamp = eventData['timestamp'] as Timestamp;
                        final eventDate = timestamp.toDate();
                        final month = '${eventDate.year}-${eventDate.month}';

                        if (amountPerMonth.containsKey(month)) {
                          amountPerMonth[month] =
                              amountPerMonth[month]! + eventData['price'];
                        } else {
                          amountPerMonth[month] = eventData['price'];
                        }
                      }

                      List<PieChartSectionData> pieChartSections =
                          amountPerMonth.entries
                              .map((entry) => PieChartSectionData(
                                    color: getRandomColor(),
                                    value: entry.value,
                                    title: '${entry.key}',
                                    radius: 50.0,
                                    titleStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    titlePositionPercentageOffset: 0.55,
                                    showTitle: true,
                                  ))
                              .toList();

                      return AspectRatio(
                        aspectRatio: 1.5,
                        child: PieChart(
                          PieChartData(
                            sections: pieChartSections,
                            // Add other pie chart settings here
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color getRandomColor() {
    final random = Random();
    return Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
  }
}

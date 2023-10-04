
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class yearlycollection extends StatefulWidget {
  @override
  _yearlycollectionState createState() => _yearlycollectionState();
}

class _yearlycollectionState extends State<yearlycollection> {
  double totalExpenses = 0.0;
  int totalEvents = 0; // Variable to store the total count of events

  @override
  void initState() {
    super.initState();
    fetchcollectionByCurrentYear().then((data) {
      double totalPrice = data['totalPrice']; // Get total price from data
      int eventCount = data['eventCount']; // Get total count from data

      setState(() {
        totalExpenses = totalPrice;
        totalEvents = eventCount; // Set the total count
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event List'),
      ),
      body: Column(
        children: [
          Container(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                addEventData(context);
              },
              child: Text('Add Event'),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Text(
                      'Total Events: $totalEvents', // Display the total count
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Total Price: $totalExpenses',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                TotalPricePage(totalExpenses: totalExpenses),
                          ),
                        );
                      },
                      child: const Text('View Total Price'),
                    ),
                  ],
                ),
                Expanded(
                  child: FutureBuilder<Map<String, dynamic>>(
                    future: fetchcollectionByCurrentYear(),
                    builder: (BuildContext context,
                        AsyncSnapshot<Map<String, dynamic>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError || snapshot.data == null) {
                        return Text(
                            'Error: ${snapshot.error ?? "Data is null"}');
                      }
                      final List<Map<String, dynamic>> eventList =
                          snapshot.data!['eventList'];

                      return ListView.builder(
                        itemCount: eventList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final eventData = eventList[index];
                          final timestamp = eventData['timestamp'] as Timestamp;
                          final eventDate = timestamp.toDate();
                          final formattedDate =
                              '${eventDate.year}-${eventDate.month}-${eventDate.day}';
                          return ListTile(
                            title: Text(eventData['title']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(eventData['description']),
                                Text('Date: $formattedDate'),
                              ],
                            ),
                            // Display other relevant data here
                          );
                        },
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
}

Future<Map<String, dynamic>> fetchcollectionByCurrentYear() async {
  DateTime now = DateTime.now();
  int currentYear = now.year;

  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection('collection')
      .where('timestamp', isGreaterThanOrEqualTo: DateTime(currentYear, 1, 1))
      .where('timestamp', isLessThan: DateTime(currentYear + 1, 1, 1))
      .get();

  List<Map<String, dynamic>> currentYearData = querySnapshot.docs
      .map((QueryDocumentSnapshot<Map<String, dynamic>> document) =>
          document.data())
      .toList();

  double totalPrice = currentYearData
      .map((eventData) => eventData['price'] as double)
      .fold(0, (previousValue, element) => previousValue + element);

  return {
    'eventList': currentYearData,
    'totalPrice': totalPrice,
    'eventCount': currentYearData.length,
  };
}

Future<void> addEventData(BuildContext context) async {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController =
      TextEditingController(); // New controller for price

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add Event'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              try {
                await FirebaseFirestore.instance.collection('collection').add({
                  'title': titleController.text,
                  'description': descriptionController.text,
                  'timestamp': Timestamp.now(),
                  'price': double.parse(
                      priceController.text), // Save the price as a double
                });
                Navigator.of(context).pop();
              } catch (error) {
                // Handle the error appropriately
                print('Error adding event data: $error');
              }
            },
            child: Text('Add'),
          ),
        ],
      );
    },
  );
}

class TotalPricePage extends StatelessWidget {
  final double totalExpenses;

  TotalPricePage({required this.totalExpenses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Price'),
      ),
      body: Center(
        child: Text(
          'Total Price: $totalExpenses',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


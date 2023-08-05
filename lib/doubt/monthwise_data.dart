import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> fetchDataAndFilter() async {
  final DateTime now = DateTime.now();
  final DateTime oneMonthAgo = now.subtract(const Duration(days: 30));
  final Timestamp oneMonthAgoTimestamp = Timestamp.fromDate(oneMonthAgo);

  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection('events')
      .orderBy('timestamp')
      .where('timestamp', isLessThanOrEqualTo: Timestamp.now())
      .where('timestamp', isGreaterThan: oneMonthAgoTimestamp)
      .get();

  List<Map<String, dynamic>> filteredData = querySnapshot.docs
      .map((QueryDocumentSnapshot<Map<String, dynamic>> document) =>
          document.data())
      .toList();

  return filteredData;
}

Future<void> addEventData(BuildContext context) async {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
                await FirebaseFirestore.instance.collection('events').add({
                  'title': titleController.text,
                  'description': descriptionController.text,
                  'timestamp': Timestamp.now(),
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

class MyWidget extends StatelessWidget {
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
                FutureBuilder<List<Map<String, dynamic>>>(
                  future: fetchDataAndFilter(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.hasError || snapshot.data == null) {
                      return Text('Error: ${snapshot.error ?? "Data is null"}');
                    }
                    return Text(
                      'Total Events: ${snapshot.data!.length}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                Expanded(
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: fetchDataAndFilter(),
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

// void main() {
//   runApp(MaterialApp(
//     home: MyWidget(),
//   ));
// }

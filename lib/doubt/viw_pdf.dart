import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class FirestoreExample extends StatefulWidget {
  @override
  _FirestoreExampleState createState() => _FirestoreExampleState();
}

class _FirestoreExampleState extends State<FirestoreExample> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _documents = [];

  Future<void> fetchData() async {
    QuerySnapshot querySnapshot = await _firestore.collection('products').get();
    setState(() {
      _documents = querySnapshot.docs;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Example'),
      ),
      body: ListView.builder(
        itemCount: _documents.length,
        itemBuilder: (context, index) {
          DocumentSnapshot document = _documents[index];

          return InkWell(
            onTap: () async {
              // Handle InkWell tap event
              launch(document['name']);
            },
            child: ListTile(
              title: Text('CLICK'),
            ),
          );
        },
      ),
    );
  }
}

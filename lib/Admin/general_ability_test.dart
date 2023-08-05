import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class Generalability_link_update extends StatefulWidget {
  const Generalability_link_update({Key? key}) : super(key: key);

  @override
  _Generalability_link_updateState createState() =>
      _Generalability_link_updateState();
}

class _Generalability_link_updateState
    extends State<Generalability_link_update> {
// text fields' controllers
  final TextEditingController _nameController = TextEditingController();

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('General Ability');

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Link'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    child: const Text('Create'),
                    onPressed: () async {
                      final String name = _nameController.text;

                      await _products.add({
                        "name": name,
                      });

                      _nameController.text = '';
                      Navigator.of(context).pop();
                    })
              ],
            ),
          );
        });
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Link'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    child: const Text('Update'),
                    onPressed: () async {
                      final String name = _nameController.text;

                      await _products.doc(documentSnapshot!.id).update({
                        "name": name,
                      });
                      _nameController.text = '';
                      Navigator.of(context).pop();
                    })
              ],
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await _products.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You have successfully deleted ')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('General Ability Test'),
        ),
        body: StreamBuilder(
          stream: _products.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['name']),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _update(documentSnapshot)),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _delete(documentSnapshot.id)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
// Add new product
        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}

class Generalability_link_open extends StatefulWidget {
  @override
  _Generalability_link_openState createState() =>
      _Generalability_link_openState();
}

class _Generalability_link_openState extends State<Generalability_link_open> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _documents = [];

  Future<void> fetchData() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('General Ability').get();
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the previous page
            Navigator.of(context).pop();
          },
        ),
        title: Text('General Ability Test'),
      ),
      body: ListView.builder(
        itemCount: _documents.length,
        itemBuilder: (context, index) {
          DocumentSnapshot document = _documents[index];

          return Container(
            padding: EdgeInsets.all(35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 252, 253, 252),
                    offset: Offset(6.0, 6.0)),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "1. Familiarize yourself with the test format and structure.\n2. Ensure your technical setup meets the requirements.\n3. Practice with sample questions to familiarize yourself with the test style. \n4. Create a quiet and distraction-free environment for the test. \n5. Manage your time effectively for each section. \n6. Read instructions carefully before answering questions. \n7. Answer strategically, eliminating incorrect options for multiple-choice questions. \n8. Review your answers before submitting the test. \n9. Stay calm and focused throughout the test. \n10. Contact technical support if you encounter any issues.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                    height:
                        20), // Adding some spacing between the text and button
                TextButton(
                  onPressed: () async {
                    launch(document['name']);
                  },
                  child: Text(
                    "Start Test",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 18, 44, 108)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcda_app/New%20User/intro.dart';

class new_enquries extends StatefulWidget {
  const new_enquries({Key? key}) : super(key: key);

  @override
  _new_enquriesState createState() => _new_enquriesState();
}

class _new_enquriesState extends State<new_enquries> {
// text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _field3Controller = TextEditingController();
  final TextEditingController _field4Controller = TextEditingController();
  final TextEditingController _field5Controller = TextEditingController();
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('New Users');

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
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _numberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
                TextField(
                  controller: _field3Controller,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _field4Controller,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
                TextField(
                  controller: _field5Controller,
                  decoration: const InputDecoration(
                      labelText: 'What Standard you are Studying'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    child: const Text('Sign Up'),
                    onPressed: () async {
                      final String name = _nameController.text;
                      final double? price =
                          double.tryParse(_numberController.text);
                      final String field3 = _field3Controller.text;
                      final String field4 = _field4Controller.text;
                      final String field5 = _field5Controller.text;
                      if (price != null) {
                        await _products.add({
                          "name": name,
                          "price": price,
                          "field3": field3,
                          "field4": field4,
                          "field5": field5,
                        });

                        _nameController.text = '';
                        _numberController.text = '';
                        _field3Controller.text = '';
                        _field4Controller.text = '';
                        _field5Controller.text = '';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewUserIntro()));
                      }
                    },
                  ),
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(DocumentSnapshot documentSnapshot) async {
    await _products.doc(documentSnapshot.id).delete();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('You have successfully deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('New Enquiries')),
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
                    title: Text(
                      "Name:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(documentSnapshot["" 'name']),
                        Text( 
                          "Phone Number:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(documentSnapshot['price'].toStringAsFixed(0)),
                        Text(
                          "Email:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(documentSnapshot['field3']),
                        Text(
                          "Address:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(documentSnapshot['field4']),
                        Text(
                          "Standard:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(documentSnapshot['field5']),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => _delete(documentSnapshot),
                          ),
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
    );
  }
}

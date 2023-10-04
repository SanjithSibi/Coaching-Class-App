import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STUDENTS DATABASE',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _items = [];
  bool _isLoading = true;

  void _refreshItems() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _items = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollnumController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phnoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _joindateController = TextEditingController();
  final TextEditingController _totalamtController = TextEditingController();

  void _showForm(int? id) async {
    if (id != null) {
      final existingItem = _items.firstWhere((element) => element['id'] == id);
      _nameController.text = existingItem['name'];
      _rollnumController.text = existingItem['rollnum'].toString();
      _dobController.text = existingItem['dob'];
      _phnoController.text = existingItem['phno'];
      _emailController.text = existingItem['email'];
      _courseController.text = existingItem['course'];
      _joindateController.text = existingItem['joindate'];
      _totalamtController.text = existingItem['totalamt'];
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _rollnumController,
                decoration: const InputDecoration(hintText: 'Roll Number'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _dobController,
                decoration: const InputDecoration(hintText: 'Date of Birth'),
              ),
              TextField(
                controller: _phnoController,
                decoration: const InputDecoration(hintText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: _courseController,
                decoration: const InputDecoration(hintText: 'Course'),
              ),
              TextField(
                controller: _joindateController,
                decoration: const InputDecoration(hintText: 'Join Date'),
              ),
              TextField(
                controller: _totalamtController,
                decoration: const InputDecoration(hintText: 'Total Amount'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_nameController.text.isEmpty ||
                      _rollnumController.text.isEmpty ||
                      _dobController.text.isEmpty ||
                      _phnoController.text.isEmpty ||
                      _emailController.text.isEmpty ||
                      _courseController.text.isEmpty ||
                      _joindateController.text.isEmpty ||
                      _totalamtController.text.isEmpty) {
                    // Show an alert if any of the required fields are empty
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Missing Information'),
                          content: const Text(
                              'Please fill in all the required fields.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    if (id == null) {
                      await _addItem();
                    }

                    if (id != null) {
                      await _updateItem(id);
                    }

                    _nameController.text = '';
                    _rollnumController.text = '';
                    _dobController.text = '';
                    _phnoController.text = '';
                    _emailController.text = '';
                    _courseController.text = '';
                    _joindateController.text = '';
                    _totalamtController.text = '';

                    Navigator.of(context).pop();
                  }
                },
                child: Text(id == null ? 'Create New' : 'Update'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addItem() async {
    await SQLHelper.createItem(
      _nameController.text,
      int.parse(_rollnumController.text),
      _dobController.text,
      _phnoController.text,
      _emailController.text,
      _courseController.text,
      _joindateController.text,
      _totalamtController.text,
    );
    _refreshItems();
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
      id,
      _nameController.text,
      int.parse(_rollnumController.text),
      _dobController.text,
      _phnoController.text,
      _emailController.text,
      _courseController.text,
      _joindateController.text,
      _totalamtController.text,
    );
    _refreshItems();
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Successfully deleted an item!')),
    );
    _refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) => Card(
                color: Colors.orange[200],
                margin: const EdgeInsets.all(15),
                child: ListTile(
                  title: Text(_items[index]['name']),
                  subtitle: Text(
                    'Roll Number: ${_items[index]['rollnum']}, Course: ${_items[index]['course']}',
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showForm(_items[index]['id']),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteItem(_items[index]['id']),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute('''CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        rollnum INTEGER,
        dob TEXT,
        phno INTEGER,
        email TEXT,
        course TEXT,
        joindate TEXT,
        totalamt TEXT,
        createdAt TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      ''');
  }

  static Future<sql.Database> db() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'students .db'),
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(
    String name,
    int rollnum,
    String dob,
    String phno,
    String email,
    String course,
    String joindate,
    String totalamt,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'rollnum': rollnum,
      'dob': dob,
      'phno': phno,
      'email': email,
      'course': course,
      'joindate': joindate,
      'totalamt': totalamt,
    };
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: 'id');
  }

  static Future<int> updateItem(
    int id,
    String name,
    int rollnum,
    String dob,
    String phno,
    String email,
    String course,
    String joindate,
    String totalamt,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'rollnum': rollnum,
      'dob': dob,
      'phno': phno,
      'email': email,
      'course': course,
      'joindate': joindate,
      'totalamt': totalamt,
      'createdAt': DateTime.now().toString(),
    };

    final result =
        await db.update('items', data, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('items', where: 'id = ?', whereArgs: [id]);
    } catch (err) {
      debugPrint('Something went wrong when deleting an item: $err');
    }
  }
}

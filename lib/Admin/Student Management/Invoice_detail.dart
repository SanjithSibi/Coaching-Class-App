import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:tcda_app/Admin/Student%20Management/Invoice_details_pdf.dart';

class Input_fields extends StatefulWidget {
  const Input_fields({Key? key}) : super(key: key);

  @override
  State<Input_fields> createState() => _Input_fieldsState();
}

class _Input_fieldsState extends State<Input_fields> {
  List<Map<String, dynamic>> _items = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  void _refreshItems() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _items = data;
      _isLoading = false;
    });
  }

  void _showForm(int? id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormPages(itemId: id),
      ),
    ).then((_) {
      _refreshItems();
    });
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
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 32, 36, 61),
        title: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Invoice Details',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 42,
                ),
                Text(
                  '',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 37, 43, 82),
                      borderRadius: BorderRadius.circular(18)),
                  height: 162,
                  child: Center(
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage('assets/pdfstu.png'),
                                height: 38),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              _items[index]['name'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Roll no :",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '${_items[index]['rollnum']}',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 192, 192, 192),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Course :",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '${_items[index]['course']}',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 192, 192, 192),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              InkWell(
                                onTap: () {
                                  final selectedData = _items[
                                      index]; // Fetch the selected item's data
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PdfPages(
                                          invoiceData:
                                              selectedData), // Pass the data to PdfPagess
                                    ),
                                  );
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 36,
                                      width: 250,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 64, 74, 139),
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  12)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              "https://cdn1.iconfinder.com/data/icons/color-bold-style/21/38_1-512.png",
                                              scale: 20,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const Text(
                                              "View Document",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                      // ... Your existing container setup
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

class FormPages extends StatelessWidget {
  final int? itemId;

  const FormPages({Key? key, this.itemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 32,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 189, 189, 189),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              itemId == null ? 'Student Add' : 'Edit Item',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 42,
            ),
            Text(""),
          ],
        ),
      ),
      body: YourFormWidget(itemId: itemId),
    );
  }
}

class YourFormWidget extends StatefulWidget {
  final int? itemId;

  YourFormWidget({Key? key, this.itemId}) : super(key: key);

  @override
  _YourFormWidgetState createState() => _YourFormWidgetState();
}

class _YourFormWidgetState extends State<YourFormWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollnumController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phnoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _joindateController = TextEditingController();
  final TextEditingController _totalamtController = TextEditingController();
  final TextEditingController _paydateController = TextEditingController();
  final TextEditingController _paymethodamtController = TextEditingController();
  final TextEditingController _batchController = TextEditingController();
  final TextEditingController _paymentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.itemId != null) {
      _loadItemData(widget.itemId!);
    }
  }

  Future<void> _loadItemData(int id) async {
    final existingItem = await SQLHelper.getItemById(id);
    setState(() {
      _nameController.text = existingItem['name'];
      _rollnumController.text = existingItem['rollnum'].toString();
      _dobController.text = existingItem['dob'];
      _phnoController.text = existingItem['phno'];
      _addressController.text = existingItem['address'];
      _emailController.text = existingItem['email'];
      _courseController.text = existingItem['course'];
      _joindateController.text = existingItem['joindate'];
      _totalamtController.text = existingItem['totalamt'];
      _totalamtController.text = existingItem['paydate'];
      _totalamtController.text = existingItem['paymethod'];
      _batchController..text = existingItem['batch'];
      _paymentController.text = existingItem['payment'];
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _rollnumController.dispose();
    _dobController.dispose();
    _phnoController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _courseController.dispose();
    _joindateController.dispose();
    _totalamtController.dispose();
    _paydateController.dispose();
    _paymethodamtController.dispose();
    _batchController.dispose();
    _paymentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 90,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(255, 191, 165, 250),
                      Color.fromARGB(255, 107, 49, 243)
                    ]),
              ),
              alignment: Alignment.center,
              child: const Center(
                child: Image(
                    image: NetworkImage(
                        'https://cdn3d.iconscout.com/3d/premium/thumb/boy-using-laptop-on-bean-bag-5565311-4688332.png',
                        scale: 2)),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  hintText: 'Enter Name',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const Text(
                "Roll Number",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              TextField(
                controller: _rollnumController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  hintText: 'Enter your number',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const Text(
                "Date of birth",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              TextField(
                controller: _dobController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  hintText: '00/00/0000',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const Text(
                "Phone Number",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              TextField(
                controller: _phnoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  hintText: '+91 0000000000',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const Text(
                "Email",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  hintText: 'Enter your email',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const Text(
                "Course",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              TextField(
                controller: _courseController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  hintText: 'Enter your course',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              const Text(
                "Join Date",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              TextField(
                controller: _joindateController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  hintText: '00/00/000',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const Text(
                "Address",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              TextField(
                controller: _addressController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  hintText: "Enter Address",
                  hintStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const Text(
                "Total Amount",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              TextField(
                controller: _totalamtController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  hintText: "Enter amount",
                  hintStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: AnimatedButton(
                  onPress: () async {
                    if (_formIsValid()) {
                      if (widget.itemId == null) {
                        await _addItem();
                      } else {
                        await _updateItem(widget.itemId!);
                      }
                      Navigator.pop(context); // Return to previous page
                    }
                  },
                  height: 44,
                  width: 200,
                  text: 'Submit',
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 123, 71, 247),
                    Color.fromARGB(255, 69, 2, 224),
                  ]),
                  selectedGradientColor: const LinearGradient(colors: [
                    Color.fromARGB(255, 69, 2, 224),
                    Colors.purpleAccent
                  ]),
                  isReverse: true,
                  selectedTextColor: Colors.white,
                  transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                  // textStyle: submitTextStyle,
                  borderColor: Colors.white,
                  borderRadius: 14,

                  borderWidth: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _addItem() async {
    await SQLHelper.createItem(
      _nameController.text,
      int.parse(_rollnumController.text),
      _dobController.text,
      _phnoController.text,
      _addressController.text,
      _emailController.text,
      _courseController.text,
      _joindateController.text,
      _totalamtController.text,
      _paydateController.text,
      _paymethodamtController.text,
      _batchController.text,
      _paymentController.text,
    );
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
      id,
      _nameController.text,
      int.parse(_rollnumController.text),
      _dobController.text,
      _phnoController.text,
      _addressController.text,
      _emailController.text,
      _courseController.text,
      _joindateController.text,
      _totalamtController.text,
      _paydateController.text,
      _paymethodamtController.text,
      _batchController.text,
      _paymentController.text,
    );
  }

  bool _formIsValid() {
    // Implement form validation logic here
    return true; // Replace with actual validation
  }
}

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute('''CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        rollnum TEXT,
        dob TEXT,
        phno TEXT,
        address TEXT,
        email TEXT,
        course TEXT,
        joindate TEXT,
        totalamt TEXT,
        paydate TEXT,
        paymethod TEXT,
        batch TEXT,
        payment TEXT,
        createdAt TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      ''');
  }

  static Future<sql.Database> db() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'studentinvoice.db'),
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
    String address,
    String email,
    String course,
    String joindate,
    String totalamt,
    String paydate,
    String paymethod,
    String batch,
    String payment,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'rollnum': rollnum,
      'dob': dob,
      'phno': phno,
      'address': address,
      'email': email,
      'course': course,
      'joindate': joindate,
      'totalamt': totalamt,
      'paydate': paydate,
      'paymethod': paymethod,
      'batch': batch,
      'payment': payment,
    };
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<Map<String, dynamic>> getItemById(int id) async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> result =
        await db.query('items', where: 'id = ?', whereArgs: [id]);
    return result.first;
  }

  static Future<int> updateItem(
    int id,
    String name,
    int rollnum,
    String dob,
    String phno,
    String address,
    String email,
    String course,
    String joindate,
    String totalamt,
    String paydate,
    String paymethod,
    String batch,
    String payment,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'rollnum': rollnum,
      'dob': dob,
      'phno': phno,
      'address': address,
      'email': email,
      'course': course,
      'joindate': joindate,
      'totalamt': totalamt,
      'paydate': paydate,
      'paymethod': paymethod,
      'batch': batch,
      'payment': payment,
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

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: 'id');
  }
}

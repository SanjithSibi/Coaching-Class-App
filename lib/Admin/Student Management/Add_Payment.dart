import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class HomePageee extends StatefulWidget {
  @override
  State<HomePageee> createState() => _HomePageeeState();
}

class _HomePageeeState extends State<HomePageee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 192, 192, 192),
        toolbarHeight: 38,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add Payment",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 42,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RollNumberInput(),
            ],
          ),
        ),
      ),
    );
  }
}

class RollNumberInput extends StatefulWidget {
  @override
  _RollNumberInputState createState() => _RollNumberInputState();
}

class _RollNumberInputState extends State<RollNumberInput> {
  final TextEditingController _rollNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _paydateController = TextEditingController();
  final TextEditingController _paymethodamtController = TextEditingController();
  String _selectedPaymentMethod = 'offline';
  String? _selectedSubPaymentMethod;
  String? _transferDate;
  String? _accountNumber;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _rollNumberController.dispose();
    _amountController.dispose();
    _paydateController.dispose();
    _paymethodamtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 310,
              child: const Image(
                  image: AssetImage('assets/paydetail.png'), height: 80),
            ),
            const SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Roll No",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    height: 44,
                    child: TextField(
                      controller: _rollNumberController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        hintText: 'Enter Roll No',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Amount Paid",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    height: 44,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _amountController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        hintText: 'Enter Amount to addition ',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Pay Date",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                      height: 44,
                      child: TextFormField(
                        controller: _paydateController,
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pay Date is required';
                          }
                          try {
                            DateFormat('dd/MM/yyyy').parseStrict(value);
                          } catch (e) {
                            return 'Invalid date format. Use DD/MM/YYYY';
                          }

                          return null; // Return null if the input is a valid date
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.grey),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          hintText: 'DD/MM/YYYY',
                          hintStyle: const TextStyle(
                            fontSize: 12,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons
                                .calendar_today), // Add a calendar icon as the button
                            onPressed: () async {
                              final pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime
                                    .now(), // You can set the initial date here
                                firstDate: DateTime(
                                    1900), // Specify the range of selectable dates
                                lastDate: DateTime.now(),
                              );

                              if (pickedDate != null) {
                                // Format the selected date and update the text field
                                setState(() {
                                  _paydateController.text =
                                      DateFormat('dd/MM/yyyy')
                                          .format(pickedDate);
                                });
                              }
                            },
                          ),
                        ),
                      )),
                  const SizedBox(height: 10),
                  const Text(
                    "Payment Method",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: _selectedPaymentMethod,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedPaymentMethod = newValue!;
                              // Clear the selected sub-method and additional fields when the main method changes
                              _selectedSubPaymentMethod = null;
                              _transferDate = null;
                              _accountNumber = null;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none, // Remove the underline
                          ),
                          items: ['online', 'offline']
                              .map((paymentMethod) => DropdownMenuItem<String>(
                                    value: paymentMethod,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(paymentMethod),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      if (_selectedPaymentMethod == 'online')
                        Column(
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: DropdownButtonFormField<String>(
                                value: _selectedSubPaymentMethod,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedSubPaymentMethod = newValue!;
                                    // Clear the additional fields when the sub-method changes
                                    _transferDate = null;
                                    _accountNumber = null;
                                  });
                                },
                                decoration: InputDecoration(
                                  border:
                                      InputBorder.none, // Remove the underline
                                ),
                                items: [
                                  'Mobile Payment',
                                  'Check Transfer',
                                  'Card Payment',
                                ]
                                    .map((subPaymentMethod) =>
                                        DropdownMenuItem<String>(
                                          value: subPaymentMethod,
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(subPaymentMethod),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                            if (_selectedSubPaymentMethod == 'Check Transfer')
                              Column(
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  // Add a TextField for Transfer Date
                                  SizedBox(
                                    height: 48,
                                    child: TextField(
                                      onChanged: (newValue) {
                                        setState(() {
                                          _transferDate = newValue;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Transfer Date',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  // Add a TextField for Account Number
                                  SizedBox(
                                    height: 48,
                                    child: TextField(
                                      onChanged: (newValue) {
                                        setState(() {
                                          _accountNumber = newValue;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'A/C NO 00000000000',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 13),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                primary: const Color.fromARGB(255, 48, 30, 71),
              ),
              onPressed: () async {
                final rollNum = int.tryParse(_rollNumberController.text);
                final enteredAmount = double.tryParse(_amountController.text);

                if (rollNum != null && enteredAmount != null) {
                  final studentDetails =
                      await SQLHelper.getStudentDetailsByRollNum(rollNum);
                  if (studentDetails != null) {
                    final currentTotalAmount =
                        double.parse(studentDetails['totalamt']);
                    final modifiedTotalAmount =
                        currentTotalAmount + enteredAmount;

                    final db = await SQLHelper.db();
                    await db.update(
                      'items',
                      {'totalamt': modifiedTotalAmount.toString()},
                      where: 'rollnum = ?',
                      whereArgs: [rollNum],
                    );

                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentDetailsPage(
                            studentName: studentDetails['name'],
                            rollNumber: studentDetails['rollnum'],
                            dob: studentDetails['dob'],
                            phno: studentDetails['phno'],
                            totalamt: modifiedTotalAmount.toString(),
                            joindate: studentDetails['joindate'],
                            course: studentDetails['course'],
                            email: studentDetails['email'],
                            address: studentDetails['address'],
                            amountpaide: studentDetails['amountpaide'],
                            batch: studentDetails['batch'],
                            paydate: _paydateController.text,
                            paymethod: _paymethodamtController.text),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: Colors.white,
                          content: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 238, 237, 237),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(6)),
                              height: 50,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.error,
                                          color:
                                              Color.fromARGB(255, 243, 19, 3)),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "Student not found",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 243, 19, 3)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "Enter Valid Roll Number !",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color: Color.fromARGB(255, 243, 19, 3)),
                                  ),
                                ],
                              ))),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.white,
                        content: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 238, 237, 237),
                                borderRadius:
                                    BorderRadiusDirectional.circular(6)),
                            height: 50,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.error,
                                        color: Color.fromARGB(255, 243, 19, 3)),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "Required",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 243, 19, 3)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "All fileds are required !",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      color: Color.fromARGB(255, 243, 19, 3)),
                                ),
                              ],
                            ))),
                  );
                }
              },
              child: const Text(
                'confirm',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentDetailsPage extends StatelessWidget {
  final String studentName;
  final String rollNumber;
  final String dob;
  final String phno;
  final String address;
  final String totalamt;
  final String joindate;
  final String course;
  final String email;
  final String paydate;
  final String paymethod;
  final String amountpaide;
  final String batch;

  const StudentDetailsPage({
    Key? key,
    required this.studentName,
    required this.rollNumber,
    required this.dob,
    required this.phno,
    required this.address,
    required this.totalamt,
    required this.joindate,
    required this.course,
    required this.email,
    required this.paydate,
    required this.amountpaide,
    required this.paymethod,
    required this.batch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        toolbarHeight: 42,
        backgroundColor: const Color.fromARGB(255, 48, 30, 71),
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Payment Details',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 26,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 305,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(26.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Student Details",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Name",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 42, 11, 83),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '$studentName',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Date of birth",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 42, 11, 83),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '$dob',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Phone no",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 42, 11, 83),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '$phno',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Email",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 42, 11, 83),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '$email',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Join date",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 42, 11, 83),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '$joindate',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 305,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Paid Details",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 23,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total amount",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 42, 11, 83),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '$amountpaide',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Paid Date",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 42, 11, 83),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '$paydate',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Payment method ",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 42, 11, 83),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '$paymethod',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Paid amount",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 31, 180, 36),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text(
                                    '$totalamt',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 31, 180, 36),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 220,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 48, 30, 71),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: () {
                          Navigator.pop(
                              context); // Navigate back to the previous screen
                        },
                        child: Container(
                            child: const Text(
                          'Go Back',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SQLHelper {
  static Future<sql.Database> db() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'studdDDD.db'),
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

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
      amountpaide TEXT,
      batch TEXT,
      payment TEXT,
      createdAt TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    ''');
  }

  static Future<Map<String, dynamic>?> getStudentDetailsByRollNum(
      int rollNum) async {
    final db = await SQLHelper.db();
    final result =
        await db.query('items', where: 'rollnum = ?', whereArgs: [rollNum]);

    if (result.isNotEmpty) {
      final studentDetails = result.first;
      return studentDetails;
    } else {
      return null;
    }
  }
}

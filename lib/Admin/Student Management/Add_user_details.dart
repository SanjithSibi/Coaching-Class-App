import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:intl/intl.dart';

import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:tcda_app/Admin/Student%20Management/student_details_pdf.dart';

class Input_field extends StatefulWidget {
  const Input_field({Key? key}) : super(key: key);

  @override
  State<Input_field> createState() => _Input_fieldState();
}

class _Input_fieldState extends State<Input_field> {
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
        builder: (context) => FormPage(itemId: id),
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
                  'Student Details',
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
                  height: 180,
                  child: Center(
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.network(
                              "https://th.bing.com/th/id/R.3f6fcd4c0a51655d392fe95a99c29140?rik=As2NAg5YAJCw0g&riu=http%3a%2f%2ffiles.softicons.com%2fdownload%2finternet-cons%2fpractika-icons-by-dryicons%2fpng%2f256%2fuser.png&ehk=NDpa6zPYmGmTx5noKZDQ%2bM4C1to6HERxXX8fHo23yIs%3d&risl=&pid=ImgRaw&r=0",
                              scale: 6,
                            ),
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
                              Text(
                                'Roll Number: ${_items[index]['rollnum']}, Course: ${_items[index]['course']}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 192, 192, 192),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
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
                                      builder: (context) => PdfPagess(
                                          invoiceData:
                                              selectedData), // Pass the data to PdfPagess
                                    ),
                                  );
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 36,

                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 64, 74, 139),
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  12)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
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
                      trailing: SizedBox(
                        width: 100,
                        child: Center(
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () => _showForm(_items[index]['id']),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 151, 19, 9),
                                ),
                                onPressed: () =>
                                    _deleteItem(_items[index]['id']),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 32, 36, 61),
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}

class FormPage extends StatelessWidget {
  final int? itemId;

  const FormPage({Key? key, this.itemId}) : super(key: key);

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
            const SizedBox(
              width: 42,
            ),
            const Text(""),
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
  final TextEditingController _batchController = TextEditingController();
  final TextEditingController _onlineofflineController =
      TextEditingController();
  String? _selectedOnlineOffline;
  String? _selectedPaymentOption;
  String _dateForCheckTransfer = '';

  final TextEditingController _amountpaideController = TextEditingController();
  String _selectedOption = "online"; // Default option is "online"
  int _selectedBatch = 1998; // Default batch year
  void _updateBatchControllerText() {
    _batchController.text = '$_selectedOption - $_selectedBatch';
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateForCheckTransfer = picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  Future<void> validate() async {
    if (formKey.currentState!.validate()) {
      if (_formIsValid()) {
        if (widget.itemId == null) {
          await _addItem();
        } else {
          await _updateItem(widget.itemId!);
        }
        Navigator.pop(context); // Return to previous page
      }
    } else {
      print("Error");
    }
  }

  bool _isValidDateFormat(String input) {
    final dateFormat = DateFormat("dd/MM/yyyy");
    try {
      dateFormat.parseStrict(input);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool _isValidDate(String input) {
    final dateFormat = DateFormat("dd/MM/yyyy");
    final parsedDate = dateFormat.parseStrict(input);
    return parsedDate != null;
  }

  bool _isFutureDate(String input) {
    final dateFormat = DateFormat("dd/MM/yyyy");
    final parsedDate = dateFormat.parseStrict(input);
    if (parsedDate == null) {
      return false;
    }

    final currentDate = DateTime.now();
    return parsedDate.isAfter(currentDate);
  }

  bool _isValidPhoneNumber(String input) {
    // Remove any non-numeric characters from the input
    final numericInput = input.replaceAll(RegExp(r'[^0-9]'), '');

    // Check if the resulting string is a valid phone number
    return numericInput.length ==
        10; // Assuming you're looking for 10-digit phone numbers
  }

  bool _isValidEmail(String input) {
    // Using a basic regular expression to check the email format
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(input);
  }

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
      _paydateController.text = existingItem['paydate'];
      _amountpaideController.text = existingItem['amountpaid'];
      _batchController.text = existingItem['batch'];
      _onlineofflineController.text = existingItem['onlineoffline'];
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
    _amountpaideController.dispose();
    _batchController.dispose();
    _onlineofflineController.dispose();
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "T",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 60, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                "C",
                style: TextStyle(
                  color: Color.fromARGB(255, 250, 205, 3),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                "D",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 255, 42),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                "A",
                style: TextStyle(
                  color: Color.fromARGB(255, 17, 0, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Form(
            key: formKey,
            child: Column(
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
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 52,
                  child: TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Enter Name",
                      hintStyle: const TextStyle(
                        fontSize: 12,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Name is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  "Roll Number",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 52,
                  child: TextFormField(
                    controller: _rollnumController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Enter your roll no",
                      hintStyle: const TextStyle(
                        fontSize: 12,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Roll Number is required ";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Date of birth",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                    height: 52,
                    child: TextFormField(
                      controller: _dobController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: "dd/MM/yyyy",
                        hintStyle: const TextStyle(
                          fontSize: 12,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () async {
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (pickedDate != null) {
                              // Format the selected date as "dd/MM/yyyy" and update the text field
                              setState(() {
                                _dobController.text =
                                    DateFormat('dd/MM/yyyy').format(pickedDate);
                              });
                            }
                          },
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Date of birth is required";
                        } else if (!_isValidDateFormat(val)) {
                          return "Invalid date format";
                        } else if (!_isValidDate(val)) {
                          return "Invalid date";
                        } else if (_isFutureDate(val)) {
                          return "Date of birth can't be in the future";
                        } else {
                          return null;
                        }
                      },
                    )),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Phone Number",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 52,
                  child: TextFormField(
                    controller: _phnoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "+91 0000000000",
                      hintStyle: const TextStyle(
                        fontSize: 12,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Phone number is required";
                      } else if (!_isValidPhoneNumber(val)) {
                        return "Invalid phone number";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Email",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 52,
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Enter your email",
                      hintStyle: const TextStyle(
                        fontSize: 12,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Email is required";
                      } else if (!_isValidEmail(val)) {
                        return "Invalid email format";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Course",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 52,
                  child: TextFormField(
                    controller: _courseController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Enter your course",
                      hintStyle: const TextStyle(
                        fontSize: 12,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Course name required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Join Date",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                    height: 52,
                    child: TextFormField(
                      controller: _joindateController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: "dd/MM/yyyy",
                        hintStyle: const TextStyle(
                          fontSize: 12,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () async {
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (pickedDate != null) {
                              // Format the selected date as "dd/MM/yyyy" and update the text field
                              setState(() {
                                _joindateController.text =
                                    DateFormat('dd/MM/yyyy').format(pickedDate);
                              });
                            }
                          },
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Join Date is required";
                        } else if (!_isValidDateFormat(val)) {
                          return "Invalid date format";
                        } else if (!_isValidDate(val)) {
                          return "Invalid date";
                        } else if (_isFutureDate(val)) {
                          return "Join Date can't be in the future";
                        } else {
                          return null;
                        }
                      },
                    )),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Address",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 52,
                  child: TextFormField(
                    controller: _addressController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Enter Address",
                      hintStyle: const TextStyle(
                        fontSize: 12,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Address is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                const Text(
                  "Total Amount",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 52,
                  child: TextFormField(
                    controller: _amountpaideController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "₹ 000.00",
                      hintStyle: const TextStyle(
                        fontSize: 12,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Total amount is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                const Text(
                  "pay Date",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                    height: 52,
                    child: TextFormField(
                      controller: _paydateController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: "dd/mm/yyyy",
                        hintStyle: const TextStyle(
                          fontSize: 12,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons
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
                                    DateFormat('dd/MM/yyyy').format(pickedDate);
                              });
                            }
                          },
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Pay Date is required";
                        } else if (!_isValidDateFormat(val)) {
                          return "Invalid date format";
                        } else if (!_isValidDate(val)) {
                          return "Invalid date";
                        } else if (_isFutureDate(val)) {
                          return "Pay Date can't be in the future";
                        } else {
                          return null;
                        }
                      },
                    )),
                SizedBox(
                  height: 3,
                ),
                const Text(
                  "Amount paid",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 52,
                  child: TextFormField(
                    controller: _totalamtController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "₹ 000.00",
                      hintStyle: const TextStyle(
                        fontSize: 12,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Amount paid";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                const Text(
                  "Enter Batch",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 52,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            value: _selectedOption,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedOption = newValue!;
                                _updateBatchControllerText();
                              });
                            },
                            items: [
                              DropdownMenuItem<String>(
                                value: "online",
                                child: Text("Online"),
                              ),
                              DropdownMenuItem<String>(
                                value: "offline",
                                child: Text("Offline"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Add some spacing
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<int>(
                            value: _selectedBatch,
                            onChanged: (int? newValue) {
                              setState(() {
                                _selectedBatch = newValue!;
                                _updateBatchControllerText();
                              });
                            },
                            items: List<DropdownMenuItem<int>>.generate(
                              2090 - 1998 + 1,
                              (index) {
                                final batchYear = 1998 + index;
                                return DropdownMenuItem<int>(
                                  value: batchYear,
                                  child: Text(batchYear.toString()),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                const Text(
                  "Payment method",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 55,
                  child: DropdownButtonFormField<String>(
                    value: _selectedOnlineOffline,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedOnlineOffline = newValue!;
                        _selectedPaymentOption =
                            null; // Reset selected payment option
                      });
                    },
                    items: ['online', 'offline']
                        .map((option) => DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: "Select online or offline",
                      hintStyle: const TextStyle(
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Required field";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),

                // Display payment options based on selection
                if (_selectedOnlineOffline == 'online')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Select Payment Option",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                        height: 55,
                        child: DropdownButtonFormField<String>(
                          value: _selectedPaymentOption,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedPaymentOption = newValue!;
                            });
                          },
                          items: [
                            'Mobile Payment',
                            'Check Transfer',
                            'Card Payment'
                          ]
                              .map((option) => DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  ))
                              .toList(),
                          decoration: InputDecoration(
                            labelText: "Select payment option",
                            hintStyle: const TextStyle(
                              fontSize: 10,
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),

                      // Additional text field for "Date" when "Check Transfer" is selected
                      if (_selectedPaymentOption == 'Check Transfer')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              "Date for Check Transfer",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: Colors.grey, width: 1)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(
                                          text: _dateForCheckTransfer),
                                      keyboardType: TextInputType.text,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _dateForCheckTransfer = newValue;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        labelText:
                                            "Enter date for check transfer",
                                        hintStyle: const TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "Required field";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextButton(
                                    onPressed: _selectDate,
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              "Account Number",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              height: 55,
                              child: TextFormField(
                                // controller: _accountNumberController,
                                keyboardType: TextInputType.text,
                                onChanged: (newValue) {
                                  // Handle account number change
                                },
                                decoration: InputDecoration(
                                  labelText: "A/C NO 0000000000000",
                                  hintStyle: const TextStyle(
                                    fontSize: 10,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                ),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Required field";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: AnimatedButton(
                  onPress: validate,

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
      _rollnumController.text,
      _dobController.text,
      _phnoController.text,
      _addressController.text,
      _emailController.text,
      _courseController.text,
      _joindateController.text,
      _totalamtController.text,
      _paydateController.text,
      _amountpaideController.text,
      _batchController.text,
      _onlineofflineController.text,
    );
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
      id,
      _nameController.text,
      _rollnumController.text,
      _dobController.text,
      _phnoController.text,
      _addressController.text,
      _emailController.text,
      _courseController.text,
      _joindateController.text,
      _totalamtController.text,
      _paydateController.text,
      _amountpaideController.text,
      _batchController.text,
      _onlineofflineController.text,
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
        amountpaide TEXT,
        batch TEXT,
        onlineoffline TEXT,
        createdAt TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      ''');
  }

  static Future<sql.Database> db() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'studentinvoic.db'),
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(
    String name,
    String rollnum,
    String dob,
    String phno,
    String address,
    String email,
    String course,
    String joindate,
    String totalamt,
    String paydate,
    String amountpaide,
    String batch,
    String onlineoffline,
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
      'amountpaide': amountpaide,
      'batch': batch,
      'onlineoffline': onlineoffline,
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
    String rollnum,
    String dob,
    String phno,
    String address,
    String email,
    String course,
    String joindate,
    String totalamt,
    String paydate,
    String amountpaide,
    String batch,
    String onlineoffline,
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
      'amountpaide': amountpaide,
      'batch': batch,
      'onlineoffline': onlineoffline,
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

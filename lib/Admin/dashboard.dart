import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:tcda_app/Admin/Student%20Management/invoice.dart';
import 'package:tcda_app/Admin/Student%20Management/delete_user.dart';
import 'package:tcda_app/Admin/new_enquries.dart';
import 'package:tcda_app/Admin/collections/total_collection.dart';
import 'package:tcda_app/Admin/expence/totalexpences.dart';
import 'package:tcda_app/Admin/update_sample_question_papers.dart';
import 'package:tcda_app/Admin/updating_test_links.dart';
import 'package:tcda_app/Admin/add_materials.dart';
import 'package:tcda_app/Admin/expence/yearwise_expence.dart';
import 'package:tcda_app/login.dart';
import 'package:tcda_app/Admin/Student%20Management/add_new_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcda_app/reusable_widgets/notifications/home_page.dart';

Future<Map<String, dynamic>> fetchmonthData() async {
  DateTime now = DateTime.now();
  int currentYear = now.year;
  int currentMonth = now.month;

  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection('expence')
      .where('timestamp',
          isGreaterThanOrEqualTo: DateTime(currentYear, currentMonth, 1))
      .where('timestamp',
          isLessThan: DateTime(currentYear, currentMonth + 1, 1))
      .get();

  List<Map<String, dynamic>> eventDataList = querySnapshot.docs
      .map((QueryDocumentSnapshot<Map<String, dynamic>> document) =>
          document.data())
      .toList();

  double totalPrice = eventDataList
      .map((eventData) => eventData['price'] as double)
      .fold(0, (previousValue, element) => previousValue + element);

  return {
    'eventList': eventDataList,
    'totalPrice': totalPrice,
    'eventCount': eventDataList.length,
  };
}

Future<Map<String, dynamic>> fetchmonthcollection() async {
  DateTime now = DateTime.now();
  int currentYear = now.year;
  int currentMonth = now.month;

  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection('collection')
      .where('timestamp',
          isGreaterThanOrEqualTo: DateTime(currentYear, currentMonth, 1))
      .where('timestamp',
          isLessThan: DateTime(currentYear, currentMonth + 1, 1))
      .get();

  List<Map<String, dynamic>> eventDataList = querySnapshot.docs
      .map((QueryDocumentSnapshot<Map<String, dynamic>> document) =>
          document.data())
      .toList();

  double totalPrice = eventDataList
      .map((eventData) => eventData['price'] as double)
      .fold(0, (previousValue, element) => previousValue + element);

  return {
    'eventList': eventDataList,
    'totalPrice': totalPrice,
    'eventCount': eventDataList.length,
  };
}

Future<List<Map<String, dynamic>>> fetchDataByCurrentYear() async {
  DateTime now = DateTime.now();
  int currentYear = now.year;

  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection('expence')
      .where('timestamp', isGreaterThanOrEqualTo: DateTime(currentYear, 1, 1))
      .where('timestamp', isLessThan: DateTime(currentYear + 1, 1, 1))
      .get();

  List<Map<String, dynamic>> currentYearData = querySnapshot.docs
      .map((QueryDocumentSnapshot<Map<String, dynamic>> document) =>
          document.data())
      .toList();

  return currentYearData;
}

Future<Map<String, dynamic>> fetchData() async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection('expence').get();

  List<Map<String, dynamic>> eventDataList = querySnapshot.docs
      .map((QueryDocumentSnapshot<Map<String, dynamic>> document) =>
          document.data())
      .toList();

  double totalPrice = eventDataList
      .map((eventData) => eventData['price'] as double)
      .fold(0, (previousValue, element) => previousValue + element);

  return {
    'eventList': eventDataList,
    'totalPrice': totalPrice,
    'eventCount': eventDataList.length,
  };
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

Future<Map<String, dynamic>> totalcollection() async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection('collection').get();

  List<Map<String, dynamic>> eventDataList = querySnapshot.docs
      .map((QueryDocumentSnapshot<Map<String, dynamic>> document) =>
          document.data())
      .toList();

  double totalPrice = eventDataList
      .map((eventData) => eventData['price'] as double)
      .fold(0, (previousValue, element) => previousValue + element);

  return {
    'eventList': eventDataList,
    'totalPrice': totalPrice,
    'eventCount': eventDataList.length,
  };
}

class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  double totalExpenses = 0.0;
  double totalyExpenses = 0.0;
  double totalmonthExpenses = 0.0;
  double monthcollection = 0.0;
  double totalyearcollection = 0.0;
  double totalcollections = 0.0;

  @override
  void initState() {
    super.initState();
    fetchDataByCurrentYear().then((data) {
      double totalPrice = data
          .map((eventData) => eventData['price'] as double)
          .fold(0, (previousValue, element) => previousValue + element);
      setState(() {
        totalExpenses = totalPrice;
      });
    });
    fetchData().then((data) {
      double totalPrice = data['totalPrice']; // Get total price from data

      setState(() {
        totalyExpenses = totalPrice;
      });
    });
    fetchmonthData().then((data) {
      double totalPrice = data['totalPrice']; // Get total price from data

      setState(() {
        totalmonthExpenses = totalPrice;
      });
    });
    fetchmonthcollection().then((data) {
      double totalPrice = data['totalPrice']; // Get total price from data
      int eventCount = data['eventCount']; // Get total count from data

      setState(() {
        monthcollection = totalPrice;
      });
    });
    fetchcollectionByCurrentYear().then((data) {
      double totalPrice = data['totalPrice']; // Get total price from data

      setState(() {
        totalyearcollection = totalPrice;
      });
    });
    totalcollection().then((data) {
      double totalPrice = data['totalPrice']; // Get total price from data
      int eventCount = data['eventCount']; // Get total count from data

      setState(() {
        totalcollections = totalPrice;
      });
    });
  }

  final _avancedDrawerController = AdvancedDrawerController();
  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        backdropColor: Color.fromARGB(255, 18, 44, 108),
        controller: _avancedDrawerController,
        animationCurve: Curves.easeIn,
        animationDuration: Duration(microseconds: 300),
        drawer: drawerWidgets(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Admin Dashboard"),
            leading: IconButton(
              onPressed: () {
                _avancedDrawerController.showDrawer();
              },
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _avancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(microseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(234, 255, 255, 255),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 180,
                      width: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 250, 250),
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 200, 201, 241),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 64,
                            width: 180,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://i.pinimg.com/736x/fc/fb/58/fcfb5858aa6d4c2a4214dab15ac6957a.jpg',
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "Today joining",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            height: 50,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      height: 180,
                      width: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 250, 250),
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 200, 201, 241),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 72,
                            width: 180,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.freepik.com/free-vector/university-graduates_151150-2146.jpg',
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "monthly joining",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            height: 50,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      height: 180,
                      width: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 250, 250),
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 200, 201, 241),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 64,
                            width: 180,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://th.bing.com/th/id/OIP.ubKrVOgUZn9vKUkAoMF-NQHaHL?pid=ImgDet&w=1858&h=1803&rs=1',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            "yearly joining",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            height: 50,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 180,
                      width: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 250, 250),
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 200, 201, 241),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 64,
                            width: 180,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/coletiond.png")),
                            ),
                          ),
                          const Text(
                            "Monthly collection",
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 50,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$monthcollection',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      height: 180,
                      width: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 250, 250),
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 200, 201, 241),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 64,
                            width: 180,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/coletiond.png")),
                            ),
                          ),
                          const Text(
                            "Yearly collection",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 50,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$totalyearcollection',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      height: 180,
                      width: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 250, 250),
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 200, 201, 241),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 64,
                            width: 178,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/coletiond.png")),
                            ),
                          ),
                          const Text(
                            "Total Collection",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 50,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$totalcollections',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 180,
                      width: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 250, 250),
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 200, 201, 241),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 68,
                            width: 178,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://media.istockphoto.com/vectors/income-increase-strategy-financial-high-return-on-investment-fund-vector-id957360650?k=6&m=957360650&s=612x612&w=0&h=VlgrO0mLkKkypwpZUZKtp86-7Mj9hRcG_LEN18FAVJ8='),
                              ),
                            ),
                          ),
                          const Text(
                            "monthly expense",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 50,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$totalmonthExpenses',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      height: 180,
                      width: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 250, 250),
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 200, 201, 241),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 68,
                            width: 178,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://media.istockphoto.com/vectors/income-increase-strategy-financial-high-return-on-investment-fund-vector-id957360650?k=6&m=957360650&s=612x612&w=0&h=VlgrO0mLkKkypwpZUZKtp86-7Mj9hRcG_LEN18FAVJ8='),
                              ),
                            ),
                          ),
                          const Text(
                            "yearly expense",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 50,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$totalExpenses',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      height: 180,
                      width: 90,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/download.png"),
                          fit: BoxFit.cover,
                        ),
                        color: Color.fromARGB(255, 250, 250, 250),
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 200, 201, 241),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 68,
                            width: 178,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://media.istockphoto.com/vectors/income-increase-strategy-financial-high-return-on-investment-fund-vector-id957360650?k=6&m=957360650&s=612x612&w=0&h=VlgrO0mLkKkypwpZUZKtp86-7Mj9hRcG_LEN18FAVJ8='),
                              ),
                            ),
                          ),
                          const Text(
                            "Total expense",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 50,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Color.fromARGB(255, 241, 68, 68),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$totalyExpenses',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ));
  }

  drawerWidgets() {
    return Container(
        height: 500,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Expanded(
              // Use Expanded to take up all available space
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: ListView(
                  // Wrap Column with ListView
                  shrinkWrap:
                      true, // Important to make ListView work inside a Column
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/logo.png",
                        height: 60,
                        width: 60,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Add User"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person_off),
                      title: Text("Delete User"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DeleteUser(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.book_online_sharp),
                      title: Text("Add Study Materials"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => updateStudyMaterials(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.book_online_sharp),
                      title: Text("Update Question Papers"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => updateQuestionPapers(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.update),
                      title: Text("Update Test Links"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UpdatingTestLinks(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.update),
                      title: Text("New Enquiries"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const new_enquries(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.money),
                      title: Text("Add collection"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TotalCollection(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.money_sharp),
                      title: Text("Add expence"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TotalExpense(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.money_sharp),
                      title: Text("Student Management"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InvoiceDetails(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.lock_clock_sharp),
                      title: Text("FollowUp Remainder"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout_outlined),
                      title: Text("Logout"),
                      onTap: () {
                        _showLogoutDialog(
                            context); // Show the logout confirmation dialog
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:tcda_app/Admin/adding_study_materials.dart';
import 'package:tcda_app/Admin/delete_user.dart';
import 'package:tcda_app/Admin/updating_test_links.dart';
import 'package:tcda_app/trail/login.dart';
import 'package:tcda_app/Admin/add_new_user.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final _avancedDrawerController = AdvancedDrawerController();
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
                      height: 132,
                      width: 99,
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
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                      height: 132,
                      width: 98,
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
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                      height: 132,
                      width: 98,
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
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 132,
                      width: 98,
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
                                  'https://yt3.ggpht.com/a/AATXAJzt4CB9A8NGuSK1y78HKbgMIfErf1Y-CJG4RYrpRQ=s900-c-k-c0xffffffff-no-rj-mo',
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "Today collection",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                      height: 132,
                      width: 98,
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
                                  'https://yt3.ggpht.com/a/AATXAJzt4CB9A8NGuSK1y78HKbgMIfErf1Y-CJG4RYrpRQ=s900-c-k-c0xffffffff-no-rj-mo',
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "monthly collection",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                      height: 132,
                      width: 98,
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
                                image: NetworkImage(
                                  'https://yt3.ggpht.com/a/AATXAJzt4CB9A8NGuSK1y78HKbgMIfErf1Y-CJG4RYrpRQ=s900-c-k-c0xffffffff-no-rj-mo',
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "Today experience",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 132,
                      width: 98,
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
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                      height: 132,
                      width: 98,
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
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                      height: 132,
                      width: 98,
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
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 132,
                      width: 98,
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
                                    'https://cdn3.iconfinder.com/data/icons/schooling-flat/614/4057_-_Male_Graduate-512.png'),
                              ),
                            ),
                          ),
                          const Text(
                            "Live student",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                      height: 132,
                      width: 98,
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
                                    'https://www.nexuspropertymanagement.com/sites/default/files/Realtor.jpg'),
                              ),
                            ),
                          ),
                          const Text(
                            "Left student",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                      height: 132,
                      width: 98,
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
                                    'https://th.bing.com/th/id/OIP.tW6XRjkXxFJPDGbn_qsFtwHaIN?pid=ImgDet&w=1488&h=1649&rs=1'),
                              ),
                            ),
                          ),
                          const Text(
                            "Due Ammount",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 132,
                      width: 98,
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
                                    'https://th.bing.com/th/id/OIP.uPwWQq-lj7ARyhFYfHwKXQAAAA?pid=ImgDet&w=300&h=300&rs=1'),
                              ),
                            ),
                          ),
                          // const Text(
                          //   "Due Amount Reminder",
                          //   style: TextStyle(
                          //     fontSize: 8,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                      height: 132,
                      width: 98,
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
                                    'https://fintos.tech/wp-content/uploads/2021/07/Loan-Application-768x576.png'),
                              ),
                            ),
                          ),
                          const Text(
                            "Today Due Reminder",
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                      height: 132,
                      width: 98,
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
                                    'https://th.bing.com/th/id/OIP.jnHo_X4kb8stD-5h9XauiQHaIr?pid=ImgDet&rs=1'),
                              ),
                            ),
                          ),
                          const Text(
                            "Today follow up",
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 22,
                            width: 22,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 241, 68, 68)),
                            child: const Center(
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  drawerWidgets() {
    return Container(
        decoration: BoxDecoration(),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/logo.png",
                        height: 100,
                        width: 100,
                      )),
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
                          builder: (context) => UploadFiles(),
                        ),
                      );
                    },
                  ),
                  // ListTile(
                  //   title: Text("Hi Hello Everryone"),
                  // ),
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
                    leading: Icon(Icons.logout_outlined),
                    title: Text("Logout"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

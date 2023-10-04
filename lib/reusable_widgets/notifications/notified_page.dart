import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifiePage extends StatelessWidget {
  final String? label;
  const NotifiePage({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Get.isDarkMode ? Colors.white : Colors.grey,
              )),
          title: Text(
            this.label.toString().split("|")[0],
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 29, 57, 216),
          ),
          child: Center(
            child: Text(
              this.label.toString().split("|")[1],
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}

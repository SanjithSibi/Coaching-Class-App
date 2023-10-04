import 'package:flutter/material.dart';
import 'package:tcda_app/Admin/Student%20Management/Add_Payment.dart';
import 'package:tcda_app/Admin/Student%20Management/Add_user_details.dart';
import 'package:tcda_app/Admin/Student%20Management/Invoice_detail.dart';

class InvoiceDetails extends StatelessWidget {
  const InvoiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 28,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            Text(
              "Invoice",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image: AssetImage('assets/yyy.jpg')),
                        SizedBox(
                          width: 8,
                        ),
                        Center(
                            child: Text(
                          "Invoice Payment\nDetails",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color.fromARGB(255, 68, 68, 68)),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FormPage()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 50, 36, 88),
                            borderRadius: BorderRadius.circular(16)),
                        height: 280,
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Add student Details",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                  image: AssetImage('assets/addstudent.png'),
                                  height: 130),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Add",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageee()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 48, 30, 71),
                            borderRadius: BorderRadius.circular(16)),
                        height: 280,
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Add Payment ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                  image: AssetImage('assets/payement.png'),
                                  height: 100),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Add",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Input_fields()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 39, 47, 92),
                            borderRadius: BorderRadius.circular(16)),
                        height: 280,
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Invoice Details",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                  image: AssetImage('assets/yyy.jpg'),
                                  height: 140),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "View",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Input_field()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 32, 36, 61),
                            borderRadius: BorderRadius.circular(16)),
                        height: 280,
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "View Student Details",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                  image: AssetImage('assets/man.png'),
                                  height: 125),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "View",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

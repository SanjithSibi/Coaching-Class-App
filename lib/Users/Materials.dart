import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcda_app/Users/read_question_papers.dart';
import 'package:tcda_app/Users/read_study_materials.dart';

import 'package:tcda_app/login.dart';

class StudyMaterials extends StatelessWidget {
  const StudyMaterials({Key? key}) : super(key: key);
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
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                });
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 249, 249),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // automaticallyImplyLeading: false,
        title: Text('Study Materials'),
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back), // Use your desired back button icon here
          onPressed: () {
            Navigator.pop(
                context); // This will pop the current page and return to the previous one
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _showLogoutDialog(context); // Show the logout confirmation dialog
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 150.0,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/read.png'),
                      fit: BoxFit.scaleDown,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20.0, // Soften the shaodw
                        spreadRadius: 2.0,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  child: const Center(child: Text("")),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFListViews(),
                    ),
                  );
                },
              ),
              const SizedBox(
                  height:
                      10), // Adds a spacing of 10 pixels between the container and the text
              const Text("Study Materials"),
              SizedBox(
                height: 50,
              ),
              InkWell(
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 150.0,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Add notes-pana.png'),
                      fit: BoxFit.scaleDown,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20.0, // Soften the shaodw
                        spreadRadius: 2.0,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QestionPapersView(),
                    ),
                  );
                },
              ),
              const SizedBox(
                  height:
                      10), // Adds a spacing of 10 pixels between the container and the text
              const Text("Question Papers"),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

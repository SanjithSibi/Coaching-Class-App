import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_button/neumorphic_button.dart';
import 'package:tcda_app/Users/Attendance.dart';
import 'package:tcda_app/Users/Redirect_to_google_meet.dart';
import 'package:tcda_app/Users/online_test.dart';
import 'package:tcda_app/Users/signin_screen.dart';
import 'package:tcda_app/Users/intro.dart';
import 'package:tcda_app/Users/Materials.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 249, 249),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
        title: Text('My App'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Signed out");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              });
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
                      image: AssetImage('assets/Online calendar-pana.png'),
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
                  child: const Center(child: Text("1")),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Attendance(),
                    ),
                  );
                },
              ),
              const SizedBox(
                  height:
                      10), // Adds a spacing of 10 pixels between the container and the text
              const Text("Attendance"),
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
                      image: AssetImage('assets/Reading book-pana.png'),
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
                  child: const Center(child: Text("2")),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudyMaterials(),
                    ),
                  );
                  print("button 2 pressed ");
                },
              ),
              const SizedBox(
                  height:
                      10), // Adds a spacing of 10 pixels between the container and the text
              const Text("Materials"),
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
                      image: AssetImage('assets/Online learning-cuate.png'),
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
                      builder: (context) => OnlineClass(),
                    ),
                  );
                },
              ),
              const SizedBox(
                  height:
                      10), // Adds a spacing of 10 pixels between the container and the text
              const Text("Online Class"),
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
                      image: AssetImage('assets/Online test-pana.png'),
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
                      builder: (context) => OnlineTest(),
                    ),
                  );
                },
              ),
              const SizedBox(
                  height:
                      10), // Adds a spacing of 10 pixels between the container and the text
              const Text("Online test"),
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcda_app/Users/signin_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class OnlineTest extends StatefulWidget {
  const OnlineTest({super.key});

  @override
  State<OnlineTest> createState() => _OnlineTestState();
}

class _OnlineTestState extends State<OnlineTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 249, 249),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
        title: Text('Online Test '),
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
                height: 20,
              ),
              InkWell(
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 100.0,
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
                onTap: () async {
                  launch('https://forms.gle/FJ8mPjWPnJ8sUCyEA');

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Attendance(),
                  //   ),
                  // );
                },
              ),
              const Text("Drawing"),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    height: 100.0,
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
                  onTap: () async {
                    launch('https://meet.google.com/cgu-txjd-afk');
                  }),
              const Text("Apptitude"),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    height: 100.0,
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
                  onTap: () async {
                    launch('https://meet.google.com/cgu-txjd-afk');
                  }),
              const Text("Reasoning"),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    height: 100.0,
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
                  onTap: () async {
                    launch('https://meet.google.com/cgu-txjd-afk');
                  }),
              const Text("English And Communication"),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  child: Container(
                    height: 100.0,
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
                  onTap: () async {
                    launch('https://meet.google.com/cgu-txjd-afk');
                  }),
              const Text("GK And Current Affairs"),
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

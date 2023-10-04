import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this package
import 'package:tcda_app/Admin/dashboard.dart';
import 'package:tcda_app/Users/existing_users_icon_page.dart';

import '../../reusable_widgets/reusable_widgets.dart';
import '../../utils/color_utils.dart';

class DeleteUser extends StatefulWidget {
  const DeleteUser({Key? key}) : super(key: key);

  @override
  State<DeleteUser> createState() => _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Use a Stack to layer the background image and content
        children: <Widget>[
          // Background Image
          FutureBuilder(
            future: rootBundle
                .load('assets/delete.png'), // Load the background image
            builder: (BuildContext context, AsyncSnapshot<ByteData> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final bytes = snapshot.data!.buffer.asUint8List();
                return Image.memory(
                  bytes,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                );
              } else {
                return CircularProgressIndicator(); // Show loading indicator while loading the image
              }
            },
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 62,
                  ),
                  Text(
                    "Delete User",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 18, 44, 108),
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                    "Enter Email Id",
                    Icons.person_outline,
                    false,
                    _emailTextController,
                  ),
                  const SizedBox(height: 20),
                  reusableTextField(
                    "Enter Password",
                    Icons.lock_outlined,
                    true,
                    _passwordTextController,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text,
                        )
                            .then((value) {
                          value.user!.delete().then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("User deleted successfully"),
                              ),
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoard()),
                            );
                          }).catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${error.toString()}"),
                              ),
                            );
                            // print("Error deleting user: ${error.toString()}");
                          });
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "No user Found or Password Does not match"),
                            ),
                          );
                          // print("Error signing in: ${error.toString()}");
                        });
                      },
                      child: Text(
                        'DELETE USER',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 250, 247, 245),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.black26;
                            }
                            return Color.fromARGB(255, 18, 44, 108);
                          }),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcda_app/Admin/dashboard.dart';
import 'package:tcda_app/Users/existing_users_icon_page.dart';
import 'package:tcda_app/New%20User/new_user_login.dart';
import 'package:tcda_app/reusable_widgets/reusable_widgets.dart';
import 'package:tcda_app/utils/color_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/login.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.all(12),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 210,
                            ),
                            TextFormField(
                              controller: emailController,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.9),
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.black,
                                ),
                                labelText: 'Enter Your Mail',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 97, 97, 97),
                                ),
                                filled: true,
                                enabled: true,
                                contentPadding: const EdgeInsets.only(
                                  left: 14.0,
                                  bottom: 8.0,
                                  top: 15.0,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                fillColor: Colors.white.withOpacity(0.3),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .white, // Set the border color here
                                    width: 1.0, // Set the border width
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email cannot be empty";
                                }
                                if (!RegExp(
                                        r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]+$")
                                    .hasMatch(value)) {
                                  return "Please enter a valid email";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                emailController.text = value!;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: _isObscure3,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.9),
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline,
                                    color: Colors.black),
                                suffixIcon: IconButton(
                                  icon: Icon(_isObscure3
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  color: Colors.white70,
                                  onPressed: () {
                                    setState(() {
                                      _isObscure3 = !_isObscure3;
                                    });
                                  },
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 97, 97, 97),
                                ),
                                filled: true,
                                enabled: true,
                                contentPadding: const EdgeInsets.only(
                                  left: 14.0,
                                  bottom: 8.0,
                                  top: 15.0,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                fillColor: Colors.white.withOpacity(0.3),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                    color:
                                        Colors.red, // Set the border color here
                                    width: 1.0, // Set the border width
                                  ),
                                ),
                              ),
                              validator: (value) {
                                RegExp regex = new RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return "Password cannot be empty";
                                }
                                if (!regex.hasMatch(value)) {
                                  return "Please enter a valid password (min. 6 characters)";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                passwordController.text = value!;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            Container(
                              width: 130,
                              height: 50,
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90)),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    visible = true;
                                  });
                                  signIn(emailController.text,
                                      passwordController.text);
                                },
                                child: Text(
                                  "LOG IN",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 250, 247, 245),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors.black26;
                                      }
                                      return Color.fromARGB(255, 18, 44, 108);
                                    }),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)))),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            signUpOption(),
                            Visibility(
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                visible: visible,
                                child: Container(
                                    child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "Admin") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashBoard(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "New User ?",
          style: TextStyle(color: Color.fromARGB(179, 19, 2, 94)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewUserLogin()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(
                color: Color.fromARGB(179, 19, 2, 94),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('No user found for that email'),
            ),
          );
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Wrong password provided for that user.'),
            ),
          );
        }
      }
    }
  }
}

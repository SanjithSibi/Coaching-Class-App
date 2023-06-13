import 'package:flutter/material.dart';
import 'package:tcda_app/Users/existing_users_icon_page.dart';
import 'package:tcda_app/Users/intro.dart';
import 'package:tcda_app/utils/color_utils.dart';
import 'package:select_form_field/select_form_field.dart';
import '../reusable_widgets/reusable_widgets.dart';

class NewUser extends StatefulWidget {
  const NewUser({super.key});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'boxValue',
      'label': 'NIFT',
      'icon': Icon(Icons.stop),
    },
    {
      'value': 'boxValue',
      'label': 'NID',
      'icon': Icon(Icons.stop),
    },
    {
      'value': 'boxValue',
      'label': 'UCEED',
      'icon': Icon(Icons.stop),
    },
    {
      'value': 'circleValue',
      'label': 'CEED',
      'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': 'starValue',
      'label': 'FDDI',
      // 'enable': false,
      'icon': Icon(Icons.grade),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("FF7817"),
          hexStringToColor("FF7817"),
          // hexStringToColor("122C6C")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(children: <Widget>[
              logoWidget("assets/logo.png"),
              SizedBox(
                height: 30,
              ),
              reusableTextField("Enter user Name", Icons.person_2_outlined,
                  false, _emailTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Phone Number",
                  Icons.phone_android_outlined, true, _passwordTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Mail id", Icons.mail_lock_outlined, true,
                  _passwordTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField(
                  "Enter Address", Icons.home, true, _passwordTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Which Standard you are studing",
                  Icons.book_sharp, true, _passwordTextController),
              SizedBox(
                height: 20,
              ),
              SelectFormField(
                decoration: InputDecoration(
                  labelText: 'What Coaching You need ?',
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                  prefixIcon: Icon(
                    Icons.format_shapes,
                    color: Colors.white70,
                  ),
                ),
                type: SelectFormFieldType.dropdown,
                initialValue: 'NIFT',
                icon: Icon(
                  Icons.format_shapes,
                  color: Colors.white70,
                ),
                // labelText: 'What Coaching You need ?',
                // style: TextStyle(color: Colors.white.withOpacity(0.9)),
                items: _items,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              signInSignUpButton(context, true, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Animatio()));
              }),
            ]),
          ),
        ),
      ),
    );
  }
}

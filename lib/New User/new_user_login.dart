import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcda_app/New%20User/intro.dart';

class NewUserLogin extends StatefulWidget {
  const NewUserLogin({Key? key}) : super(key: key);

  @override
  _NewUserLoginState createState() => _NewUserLoginState();
}

class _NewUserLoginState extends State<NewUserLogin>{
// text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _field3Controller = TextEditingController();
  final TextEditingController _field4Controller = TextEditingController();
  final TextEditingController _field5Controller = TextEditingController();
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('New Users');

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _numberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
                TextField(
                  controller: _field3Controller,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _field4Controller,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
                TextField(
                  controller: _field5Controller,
                  decoration: const InputDecoration(
                      labelText: 'What Standard you are Studying'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    child: const Text(
                      'Sign Up',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 250, 247, 245),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    onPressed: () async {
                      final String name = _nameController.text;
                      final double? price =
                          double.tryParse(_numberController.text);
                      final String field3 = _field3Controller.text;
                      final String field4 = _field4Controller.text;
                      final String field5 = _field5Controller.text;
                      if (price != null) {
                        await _products.add({
                          "name": name,
                          "price": price,
                          "field3": field3,
                          "field4": field4,
                          "field5": field5,
                        });

                        _nameController.text = '';
                        _numberController.text = '';
                        _field3Controller.text = '';
                        _field4Controller.text = '';
                        _field5Controller.text = '';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewUserIntro()));
                      }
                    },
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
                                    borderRadius: BorderRadius.circular(30)))),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      height: 52,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.black,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome To TCDA !!!',
                            style: TextStyle(
                              fontSize: 24,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Row(),
                          const SizedBox(
                            height: 14,
                          ),
                          Container(
                            height: 150,
                            // width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 73, 72, 72),
                                border: Border.all(color: Colors.black12),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: const Image(
                              image: AssetImage(
                                'assets/tcda_image.jpg',
                              ),
                              width:
                                  400, // Adjust the width as per your requirements
                              height: 200,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Row(
                            children: [
                              Text(
                                'T',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 30, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'C',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 166, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'D',
                                style: TextStyle(
                                  color: Color.fromRGBO(35, 190, 3, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'A',
                                style: TextStyle(
                                  color: Color.fromRGBO(16, 3, 190, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            height: 360,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 224, 224, 241),
                              // border: Border.all(color: Colors.black12),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 235, 235, 247),
                                  blurRadius: 6.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.circle_outlined,
                                        size: 17,
                                        color:
                                            Color.fromARGB(255, 102, 18, 236),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      DefaultTextStyle(
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 102, 18, 236),
                                        ),
                                        child: Text(
                                            'Transforming Dreams into \n Designs with TCDA'
                                            // animatedTexts: [
                                            //   // WavyAnimatedText('Hello World'),
                                            //   WavyAnimatedText(
                                            //       'Transforming Dreams into Designs with TCDA'),
                                            //   WavyAnimatedText(
                                            //       'Transforming Dreams into Designs with TCDA'),
                                            // ],
                                            // isRepeatingAnimation: true,
                                            ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        height: 38,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                size: 8,
                                                color: Color.fromARGB(
                                                    255, 102, 18, 236),
                                              ),
                                              SizedBox(
                                                width: 12,
                                                height: 16,
                                              ),
                                              Text(
                                                'We are thrilled to have you join our',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 24,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'institution, known for its excellence in',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    'nurturing creative minds in the fields of',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 24,
                                        height: 38,
                                      ),
                                      Icon(
                                        Icons.check_sharp,
                                        size: 14,
                                        color:
                                            Color.fromARGB(255, 102, 18, 236),
                                      ),
                                      SizedBox(
                                        width: 6,
                                        height: 16,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Text(
                                            'NIFT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 24,
                                        height: 1,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Icon(
                                                Icons.check_sharp,
                                                size: 14,
                                                color: Color.fromARGB(
                                                    255, 102, 18, 236),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'NID',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.check_sharp,
                                                size: 14,
                                                color: Color.fromARGB(
                                                    255, 102, 18, 236),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'UCEED',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.check_sharp,
                                                size: 14,
                                                color: Color.fromARGB(
                                                    255, 102, 18, 236),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'CEED ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        size: 8,
                                        color:
                                            Color.fromARGB(255, 102, 18, 236),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        'At “The Creative Design Academy” in',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text(
                                        'Coimbatore,we are committed to providing',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text(
                                        'a stimulating and supportive environment',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text(
                                        'where your passion for art,design,and',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text(
                                        'creativity can flourish.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _create(),
          label: Text(
            "Click Here",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          foregroundColor: Colors.white, // Set the desired button color
          backgroundColor: const Color.fromARGB(255, 18, 44, 108),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}

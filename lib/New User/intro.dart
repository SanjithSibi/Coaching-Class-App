import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:grouped_action_buttons/grouped_action_buttons_package.dart';

class NewUserIntro extends StatefulWidget {
  const NewUserIntro({super.key});

  @override
  State<NewUserIntro> createState() => _NewUserIntroState();
}

class _NewUserIntroState extends State<NewUserIntro> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Color.fromARGB(234, 255, 255, 255),
      home: Scaffold(
        backgroundColor: Color.fromARGB(234, 255, 255, 255),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Color.fromARGB(234, 255, 255, 255),
                ),
              ),
              Positioned.fill(
                child: FloatingBubbles.alwaysRepeating(
                  noOfBubbles: 25,
                  colorsOfBubbles: [
                    Colors.green.withAlpha(30),
                    Colors.red,
                    Color.fromARGB(255, 21, 40, 209),
                  ],
                  sizeFactor: 0.16,
                  opacity: 70,
                  paintingStyle: PaintingStyle.fill,
                  shape: BubbleShape.circle,
                  speed: BubbleSpeed.normal,
                ),
              ),
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
                            'The Creative Design Academy (TCDA)',
                            style: TextStyle(
                              fontSize: 19,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            'Created by TCDA',
                            style: TextStyle(
                                fontSize: 16,
                                height: 1.2,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 66, 66, 66)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color.fromARGB(255, 255, 30, 0),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color.fromARGB(255, 255, 30, 0),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color.fromARGB(255, 255, 30, 0),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color.fromARGB(255, 255, 30, 0),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 102, 18, 236),
                                border: Border.all(color: Colors.black12),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: const Image(
                                image: AssetImage(
                              'assets/intro.png',
                            )),
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
                            height: 300,
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
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 102, 18, 236),
                                        ),
                                        child: AnimatedTextKit(
                                          animatedTexts: [
                                            // WavyAnimatedText('Hello World'),
                                            WavyAnimatedText('TCDA'),
                                            WavyAnimatedText('TCDA'),
                                            WavyAnimatedText('TCDA'),
                                            WavyAnimatedText('TCDA'),
                                            WavyAnimatedText('TCDA'),
                                            WavyAnimatedText('TCDA'),
                                            WavyAnimatedText('TCDA'),
                                            WavyAnimatedText('TCDA'),
                                          ],
                                          isRepeatingAnimation: true,
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
                                        width: 3,
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
                                                'The creative Design Academy(TCDA) is a premier ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 20,
                                                height: 16,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'NIFT Coaching Centrem in Coimbatore that offers ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    'Comprehensive and hands-on learing experiences ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    'To aspiring designers.',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 11,
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
                                        width: 4,
                                        height: 38,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        size: 8,
                                        color:
                                            Color.fromARGB(255, 102, 18, 236),
                                      ),
                                      SizedBox(
                                        width: 12,
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
                                            'This instiution was developed,designed,and put',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'Into use in 2015.',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 4,
                                        height: 1,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 12,
                                          ),
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
                                              ),
                                              Text(
                                                'In oreder to give the students a creative learnig',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'Experience,TCDA employs an approach that is a ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'Good combination of interactive, workshop-based',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'And practical.',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                ),
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
                                        width: 4,
                                        height: 1,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 12,
                                          ),
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
                                              ),
                                              Text(
                                                'TCDA is without a doubt entry coaching cenntre ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'Due to its emphasis on creative thinking and ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'Teaching techniques',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
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
                            ),
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            height: 240,
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
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 102, 18, 236),
                                        ),
                                        child: AnimatedTextKit(
                                          animatedTexts: [
                                            // WavyAnimatedText('Hello World'),
                                            WavyAnimatedText('Why TCDA'),
                                            WavyAnimatedText('Why TCDA'),
                                            WavyAnimatedText('Why TCDA'),
                                            WavyAnimatedText('Why TCDA'),
                                            WavyAnimatedText('Why TCDA'),
                                          ],
                                          isRepeatingAnimation: true,
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
                                        width: 3,
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
                                                'In the filed of NIFT NID,UCEED,and CEED exam       ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 20,
                                                height: 16,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Tutoring,TCDA is renowned for its distinctive for its',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    'Distinctive method of educationg students who',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    'Want to pursue a career in fashion design.',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 11,
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
                                        width: 6,
                                        height: 38,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        size: 8,
                                        color:
                                            Color.fromARGB(255, 102, 18, 236),
                                      ),
                                      SizedBox(
                                        width: 12,
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
                                            'TCDA focuses on strengthening young minds with',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 11,
                                            ),
                                          ),
                                          Text(
                                            'Ideas, suggestions, and techniques.',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 6,
                                        height: 1,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 12,
                                          ),
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
                                              ),
                                              Text(
                                                'Additionally, the TCDA faculty members engaging',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'And Student-centred teaching style is well-liked',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'And respected by the student population.',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 11,
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
                            ),
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            height: 290,
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
                                          fontSize: 13,
                                          color:
                                              Color.fromARGB(255, 102, 18, 236),
                                        ),
                                        child: AnimatedTextKit(
                                          animatedTexts: [
                                            // WavyAnimatedText('Hello World'),
                                            WavyAnimatedText(
                                                'NIFT/NID/CEED/UCEED Coaching Program'),
                                            WavyAnimatedText(
                                                'NIFT/NID/CEED/UCEED Coaching Program'),
                                          ],
                                          isRepeatingAnimation: true,
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
                                        width: 3,
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
                                                'An intense programme that will help students      ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 10,
                                                height: 16,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Completely prepare for the NIFT, NID, CEED   ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    'And UCEED exams as well as for other desgin',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    'institutes.',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 11,
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
                                            'Expert instructors ideas, suggestions and',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 11,
                                            ),
                                          ),
                                          Text(
                                            'techniques.',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 11,
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
                                                'Personalized mentoring and study strategies',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 11,
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
                                                'Thorough instruction in sketch development',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 11,
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
                                                'Convenient scheduling',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 11,
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
                                                'With intuitive online study materials',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
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
                                        width: 4,
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
                                        'Mock tests, past-year question papers, and ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
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
                                        'Topic-specific tests.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
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
        floatingActionButton: GroupedActionButtons(
          distance: 112,
          openButtonIcon: const Icon(Icons.chat),
          closeButtonIcon: const Icon(Icons.close),
          children: [
            ActionButton(
              onPressed: () => launch("tel://6383783392"),
              backgroundColor: Color.fromARGB(255, 226, 104, 55),
              icon: Icon(Icons.call_sharp),
            ),
            ActionButton(
              backgroundColor: Color.fromARGB(255, 252, 250, 250),
              onPressed: () => launch("mailto:sanjithmani20@gmail.com"),
              icon: Image.asset(
                'assets/mail.png',
              ),
            ),
            ActionButton(
              backgroundColor: Color.fromARGB(255, 44, 155, 22),
              onPressed: () => launch("https://wa.me/+918608638406"),
              icon: Image.asset(
                'assets/wp.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

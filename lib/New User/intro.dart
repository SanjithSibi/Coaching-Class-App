import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nice_loading_button/nice_loading_button.dart';
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
      color: const Color.fromARGB(234, 255, 255, 255),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(234, 255, 255, 255),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: const Color.fromARGB(234, 255, 255, 255),
                ),
              ),
              Positioned.fill(
                child: FloatingBubbles.alwaysRepeating(
                  noOfBubbles: 25,
                  colorsOfBubbles: [
                    Colors.green.withAlpha(30),
                    Colors.red,
                    const Color.fromARGB(255, 21, 40, 209),
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
                      padding: const EdgeInsets.all(16),
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
                                color: Colors.white,
                                border: Border.all(color: Colors.black12),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: const Image(
                                image: NetworkImage(
                                    "https://th.bing.com/th/id/OIP.pguRErOLpYp1o1AdTd-uXgAAAA?pid=ImgDet&rs=1")),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Row(
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/logo.png",
                                ),
                                fit: BoxFit.fitWidth,
                                width: 70,
                                height: 70,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            height: 320,
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
                                    height: 16,
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
                                              Text(
                                                'What sets TCDA apart is our team of passionate and\nexperienced instructors who are not just educators\nbut also industry professionals. They bring real-world\nexpertise and contemporary insights into the\nclassroom, ensuring that our students receive\nrelevant and up-to-date knowledge.',
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
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        'We offer comprehensive courses that cover various\naspects of design, from the fundamentals to advanced\ntechniques. Our curriculum integrates theory and\npractical application, encouraging hands-on projects\nand collaborative learning experiences. Moreover,\nwe regularly organize workshops, guest lectures,\nand design competitions to enhance students\nexposure and encourage networking with\nprofessionals in the field.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
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
                            height: 270,
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
                                  SizedBox(
                                    height: 12,
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 6,
                                        height: 38,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Text(
                                                'At TCDA, we coach for NID NIFT UCEED, CEED &\nNATA As an institution committed to excellence, we\nprovide state-of-the-art facilities and access to\ncutting-edge design tools and software. Our aim is\nnot just to teach design but to instill a sense of\npurpose, innovation, and ethical responsibility in our\nstudents.',
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
                                  SizedBox(
                                    height: 22,
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Join us at The Creative Design Academy and unlock\nyour creative potential. Let us be your steppingstone\ntowards a fulfilling and rewarding career in the\never-evolving world of design. Together, let s shape\na world of beauty, functionality, and meaningful\nexperiences through the power of creativity!',
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
                            ),
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(16),
                            height: 600,
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
                                          fontSize: 12,
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
                                    height: 12,
                                  ),
                                  const Row(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 6,
                                                height: 16,
                                              ),
                                              Text(
                                                'At The Creative Design Academy (TCDA), we\nspecialize in comprehensive coaching programs\ntailored to help aspiring students prepare for\nprestigious entrance exams such as NID(National\nInstitute of Design),NIFT(National Institute of\nFashion Technology), UCEED(Undergraduate\nCommon Entrance Examination for Design), and\nNATA (National Aptitude Test in Architecture).',
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
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'Our expert instructors possess a deep understanding\nof the exam patterns and requirements, ensuring that\nRstudents receive personalized guidance and training\nto excel in their respective fields of interest.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'TCDA s coaching approach goes beyond rote\nlearning, emphasizing conceptual understanding,\nproblem-solving skills, and honing creativity to\nenable students to stand out in highly competitive\ndesign entrance exams.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'With a proven track record of successful students\nwho have secured top ranks in NID, NIFT, UCEED,\nand NATA exams, TCDA prides itself on being a\nreliable and results-driven coaching center.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'Join TCDA s specialized coaching programs and\nembark on your journey towards a thriving career\nin design equipped with the confidence, skills, and\nexpertise necessary to gain admission to the most\nprestigious design institutes in the country.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'With a proven track record of successful students\nwho have secured top ranks in NID, NIFT, UCEED,\nand NATA exams, TCDA prides itself on being a\nreliable and results-driven coaching center.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  LoadingButton(
                                    height: 50,
                                    borderRadius: 100,
                                    animate: true,
                                    color: Color.fromARGB(255, 102, 18, 236),
                                    width: 100,
                                    loader: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: const Center(
                                        child: SpinKitDoubleBounce(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      "Visit Us",
                                      style: TextStyle(
                                        color: Colors
                                            .white, // Set the desired text color here
                                      ),
                                    ),
                                    onTap: (startLoading, stopLoading,
                                        buttonState) async {
                                      if (buttonState == ButtonState.idle) {
                                        startLoading();
                                        // Do something here
                                        await Future.delayed(
                                            const Duration(seconds: 3));
                                        stopLoading();
                                        launch("https://tcda.in/");
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
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
            // ActionButton(
            //   backgroundColor: Color.fromARGB(255, 255, 255, 255),
            //   onPressed: () => launch("https://tcda.in/"),
            //   icon: Image.asset(
            //     'assets/web.png',
            //   ),
            // ),
            ActionButton(
              onPressed: () => launch("tel://6383783392"),
              backgroundColor: const Color.fromARGB(255, 226, 104, 55),
              icon: Icon(Icons.call_sharp),
            ),
            ActionButton(
              backgroundColor: const Color.fromARGB(255, 252, 250, 250),
              onPressed: () => launch("mailto:sanjithmani20@gmail.com"),
              icon: Image.asset(
                'assets/mail.png',
              ),
            ),
            ActionButton(
              backgroundColor: const Color.fromARGB(255, 44, 155, 22),
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

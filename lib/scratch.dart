import 'dart:ui';

Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.grey.shade500,
        automaticallyImplyLeading: false,
        title: Text('My App'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
               FirebaseAuth.instance.signOut().then((value) {
          print("Signed out");
           Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));

        });
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade500,
      body: Center(
          child: NeumorphicButton(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SignInScreen(),
          //   ),
          // );
        },
        child: Image.asset(
          'assets/attendance.png',
          height: 80,
          color: Colors.grey[700],        
        ),        
        borderRadius: 12,
        bottomRightShadowBlurRadius: 15,
        bottomRightShadowSpreadRadius: 1,
        borderWidth: 5,
        backgroundColor: Colors.grey.shade300,
        topLeftShadowBlurRadius: 15,
        topLeftShadowSpreadRadius: 1,
        topLeftShadowColor: Colors.white,
        bottomRightShadowColor: Colors.grey.shade500,
        height: size.width * 0.5,
        width: size.width * 0.5,
        padding: EdgeInsets.all(50),
        bottomRightOffset: Offset(4, 4),
        topLeftOffset: Offset(-4, -4),
      )),
      
    );


    home_screen.DartPerformanceMode


    import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_button/neumorphic_button.dart';
import 'package:tcda_app/doubt/signin_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const  HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: ElevatedButton(child: Text("Log out"),
//       onPressed: (){
//         FirebaseAuth.instance.signOut().then((value) {
//           print("Signed out");
//            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));

//         });
       
//       },
//       )),
//     );
//   }
// }
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  

  @override
  
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
           Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));

        });
            },
          ),
        ],
      ),
        body: SingleChildScrollView( 
   
      
      child: Column(
        
        children: [
          SizedBox(              
              height: 30,
            ),
           NeumorphicButton(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SignInScreen(),
          //   ),
          // );
        },
        child: Image.asset(
          'assets/attendance.png',
          height: 80,
          color: Colors.grey[700],        
        ),        
        borderRadius: 12,
        bottomRightShadowBlurRadius: 15,
        bottomRightShadowSpreadRadius: 1,
        borderWidth: 5,
        backgroundColor: Colors.grey.shade300,
        topLeftShadowBlurRadius: 15,
        topLeftShadowSpreadRadius: 1,
        topLeftShadowColor: Colors.white,
        bottomRightShadowColor: Colors.grey.shade500,
        height: size.width * 0.5,
        width: size.width * 0.5,
        padding: EdgeInsets.all(50),
        bottomRightOffset: Offset(4, 4),
        topLeftOffset: Offset(-4, -4),
      ),
      SizedBox(              
              height: 50,
            ),
           NeumorphicButton(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SignInScreen(),
          //   ),
          // );
        },
        child: Column(
          children: [
             Image.asset(
          'assets/material.jpg',
          // height: 80,
          // color: Colors.grey[700],        
        ),
        Text('data'),
          ],
        ),
          
      
        borderRadius: 12,
        bottomRightShadowBlurRadius: 15,
        bottomRightShadowSpreadRadius: 1,
        borderWidth: 5,
        backgroundColor: Colors.grey.shade300,
        topLeftShadowBlurRadius: 15,
        topLeftShadowSpreadRadius: 1,
        topLeftShadowColor: Colors.white,
        bottomRightShadowColor: Colors.grey.shade500,
        height: size.width * 0.5,
        width: size.width * 0.5,
        padding: EdgeInsets.all(50),
        bottomRightOffset: Offset(4, 4),
        topLeftOffset: Offset(-4, -4),
      ),
      SizedBox(              
              height: 50,
            ),
           NeumorphicButton(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SignInScreen(),
          //   ),
          // );
        },
        child: Image.asset(
          'assets/online_class.jpg',
          // height: 80,
          // color: Colors.grey[700],        
        ),        
        borderRadius: 12,
        bottomRightShadowBlurRadius: 15,
        bottomRightShadowSpreadRadius: 1,
        borderWidth: 5,
        backgroundColor: Colors.grey.shade300,
        topLeftShadowBlurRadius: 15,
        topLeftShadowSpreadRadius: 1,
        topLeftShadowColor: Colors.white,
        bottomRightShadowColor: Colors.grey.shade500,
        height: size.width * 0.5,
        width: size.width * 0.5,
        padding: EdgeInsets.all(50),
        bottomRightOffset: Offset(4, 4),
        topLeftOffset: Offset(-4, -4),
      ),
      SizedBox(              
              height: 50,
            ),
           NeumorphicButton(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SignInScreen(),
          //   ),
          // );
        },
         child: Column(
          children: [
             Image.asset(
          'assets/test-removebg.png',
          height: 40,
          // color: Colors.grey[700],        
        ),
        Text('Online Test'),
          ],
        ),
        
        
        borderRadius: 12,
      
        bottomRightShadowBlurRadius: 15,
        bottomRightShadowSpreadRadius: 1,
        borderWidth: 5,
        backgroundColor: Colors.grey.shade300,
        topLeftShadowBlurRadius: 15,
        topLeftShadowSpreadRadius: 1,
        topLeftShadowColor: Colors.white,
        bottomRightShadowColor: Colors.grey.shade500,
        height: size.width * 0.5,
        width: size.width * 0.5,
        padding: EdgeInsets.all(50),
        bottomRightOffset: Offset(4, 4),
        topLeftOffset: Offset(-4, -4),
      ),
       SizedBox(              
              height: 30,
            ),
        ],
      ),
    ),);
  }
}






 import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyAppp());
}

class MyAppp extends StatefulWidget {
  const MyAppp({super.key});

  @override
  State<MyAppp> createState() => _MyApppState();
}

class _MyApppState extends State<MyAppp> {
  @override
  void iniState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 9, 192, 224),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 24, 0, 233),
          title: const Text('google meeting'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              launch('https://meet.google.com/cgu-txjd-afk');
            },
            child: Text('Open URL'),
          ),
        ),
      ),
    );
  }
}





import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(234, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(200, 255, 255, 255),
          title: const Text(
            "Dash board",
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 17,
                fontFamily: AutofillHints.newUsername),
          ),
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 18,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 132,
                    width: 99,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 64,
                          width: 180,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://i.pinimg.com/736x/fc/fb/58/fcfb5858aa6d4c2a4214dab15ac6957a.jpg',
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "Today joining",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 132,
                    width: 98,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 72,
                          width: 180,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.freepik.com/free-vector/university-graduates_151150-2146.jpg',
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "monthly joining",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 132,
                    width: 98,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 64,
                          width: 180,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://th.bing.com/th/id/OIP.ubKrVOgUZn9vKUkAoMF-NQHaHL?pid=ImgDet&w=1858&h=1803&rs=1',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "yearly joining",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 132,
                    width: 98,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 64,
                          width: 180,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://yt3.ggpht.com/a/AATXAJzt4CB9A8NGuSK1y78HKbgMIfErf1Y-CJG4RYrpRQ=s900-c-k-c0xffffffff-no-rj-mo',
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "Today collection",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 132,
                    width: 98,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 64,
                          width: 180,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://yt3.ggpht.com/a/AATXAJzt4CB9A8NGuSK1y78HKbgMIfErf1Y-CJG4RYrpRQ=s900-c-k-c0xffffffff-no-rj-mo',
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "monthly collection",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 132,
                    width: 98,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 64,
                          width: 178,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://yt3.ggpht.com/a/AATXAJzt4CB9A8NGuSK1y78HKbgMIfErf1Y-CJG4RYrpRQ=s900-c-k-c0xffffffff-no-rj-mo',
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "Today experience",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 132,
                    width: 98,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 68,
                          width: 178,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://media.istockphoto.com/vectors/income-increase-strategy-financial-high-return-on-investment-fund-vector-id957360650?k=6&m=957360650&s=612x612&w=0&h=VlgrO0mLkKkypwpZUZKtp86-7Mj9hRcG_LEN18FAVJ8='),
                            ),
                          ),
                        ),
                        const Text(
                          "monthly expense",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 132,
                    width: 98,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 68,
                          width: 178,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://media.istockphoto.com/vectors/income-increase-strategy-financial-high-return-on-investment-fund-vector-id957360650?k=6&m=957360650&s=612x612&w=0&h=VlgrO0mLkKkypwpZUZKtp86-7Mj9hRcG_LEN18FAVJ8='),
                            ),
                          ),
                        ),
                        const Text(
                          "yearly expense",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 132,
                    width: 98,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/download.png"),
                        fit: BoxFit.cover,
                      ),
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 68,
                          width: 178,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://media.istockphoto.com/vectors/income-increase-strategy-financial-high-return-on-investment-fund-vector-id957360650?k=6&m=957360650&s=612x612&w=0&h=VlgrO0mLkKkypwpZUZKtp86-7Mj9hRcG_LEN18FAVJ8='),
                            ),
                          ),
                        ),
                        const Text(
                          "Total expense",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 132,
                    width: 98,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/download.png"),
                        fit: BoxFit.cover,
                      ),
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 68,
                          width: 178,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://cdn3.iconfinder.com/data/icons/schooling-flat/614/4057_-_Male_Graduate-512.png'),
                            ),
                          ),
                        ),
                        const Text(
                          "Live student",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 132,
                    width: 98,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 68,
                          width: 178,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.nexuspropertymanagement.com/sites/default/files/Realtor.jpg'),
                            ),
                          ),
                        ),
                        const Text(
                          "Left student",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 132,
                    width: 98,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 68,
                          width: 178,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://th.bing.com/th/id/OIP.tW6XRjkXxFJPDGbn_qsFtwHaIN?pid=ImgDet&w=1488&h=1649&rs=1'),
                            ),
                          ),
                        ),
                        const Text(
                          "Due Ammount",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 132,
                    width: 98,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 68,
                          width: 178,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://th.bing.com/th/id/OIP.uPwWQq-lj7ARyhFYfHwKXQAAAA?pid=ImgDet&w=300&h=300&rs=1'),
                            ),
                          ),
                        ),
                        const Text(
                          "Due Amount Reminder",
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 132,
                    width: 98,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 68,
                          width: 178,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://fintos.tech/wp-content/uploads/2021/07/Loan-Application-768x576.png'),
                            ),
                          ),
                        ),
                        const Text(
                          "Today Due Reminder",
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 132,
                    width: 98,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 201, 241),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 68,
                          width: 178,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://th.bing.com/th/id/OIP.jnHo_X4kb8stD-5h9XauiQHaIr?pid=ImgDet&rs=1'),
                            ),
                          ),
                        ),
                        const Text(
                          "Today follow up",
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 241, 68, 68)),
                          child: const Center(
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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




if (pickedFile != null) {
      // String filename = pickedFile.files[0].name;
      // File file = File(pickedFile.files[0].path!);
     uploadPDF(filename, file);
      // await _firebaseFirestore.collection("pdfs").add({
      //   "name": filename,
      //   "url": downloadLink,
      // });
      print("Pdf Uploaded Successfully");
    }



     floatingActionButton: GroupedActionButtons(
          distance: 112,
          openButtonIcon: const Icon(Icons.edit),
          closeButtonIcon: const Icon(Icons.close),
          children: [
            ActionButton(
              onPressed: () => print('b1'),
              backgroundColor: Colors.red,
              icon: const Icon(Icons.abc_rounded),
            ),
            ActionButton(
              onPressed: () => print('b2'),
              icon: const Icon(Icons.ac_unit),
            ),
            ActionButton(
              onPressed: () => print('b3'),
              icon: const Icon(Icons.access_alarms),
            ),
          ],
        ),


                floatingActionButton: Container(
          height: 42,
          width: 42,
          child: FloatingActionButton(
            onPressed: () => launch("tel://8248192468"),
            child: Icon(Icons.call_sharp),
            backgroundColor: Color.fromARGB(255, 250, 27, 27),
          ),
        ),


        
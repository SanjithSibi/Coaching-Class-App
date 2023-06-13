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
import 'package:tcda_app/Users/signin_screen.dart';

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

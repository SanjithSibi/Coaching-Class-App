
import 'package:flutter/material.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {

    void _reloadPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Mypage()),
    );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your page content here

            // Button to reload the page
            ElevatedButton(
              onPressed: _reloadPage,
              child: Text('Reload Page'),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class MyPage extends StatefulWidget {
//   @override
//   _MyPageState createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   void _reloadPage() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (BuildContext context) => MyPage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Your page content here

//             // Button to reload the page
//             ElevatedButton(
//               onPressed: _reloadPage,
//               child: Text('Reload Page'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

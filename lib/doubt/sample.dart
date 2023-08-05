// import 'package:flutter/material.dart';
// import 'package:draggable_expandable_fab/draggable_expandable_fab.dart';

// class Ani extends StatelessWidget {
//   const Ani({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Diamond FAB',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Diamond Dial FAB Demo'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final Size _size = MediaQuery.of(context).size;
//     return Scaffold(
//       floatingActionButtonAnimator: NoScalingAnimation(),
//       floatingActionButtonLocation: ExpandableFloatLocation(),
//       floatingActionButton: ExpandableDraggableFab(
//         childrenCount: 3,
//         onTab: () {
//           debugPrint("Tab");
//         },
        
//         distance: 100, // Animation distance during open and close.
//         children: [],
         
        
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       // Remove the debug banner
//       debugShowCheckedModeBanner: false,
//       title: 'Kindacode.com',
//       home: HomePage(),
//     );
//   }
// }

class HoePage extends StatefulWidget {
  const HoePage({Key? key}) : super(key: key);

  @override
  State<HoePage> createState() => _HoePageState();
}

class _HoePageState extends State<HoePage> {
  // Determine whether the red box is shown or not
  bool _isShown = true;

  void _delete(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to remove the text?'),
            actions: [
              // The "Yes" button
              CupertinoDialogAction(
                onPressed: () {
                  setState(() {
                    _isShown = false;
                    Navigator.of(context).pop();
                  });
                },
                isDefaultAction: true,
                isDestructiveAction: true,
                child: const Text('Yes'),
              ),
              // The "No" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                isDefaultAction: false,
                isDestructiveAction: false,
                child: const Text('No'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Kindacode.com'),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              CupertinoButton(
                  onPressed: _isShown == true ? () => _delete(context) : null,
                  child: const Text('Remove The Paragraph Below')),
              const SizedBox(
                height: 30,
              ),
              if (_isShown == true)
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                                'tusrtyu'),                )
            ],
          ),
        ));
  }
}
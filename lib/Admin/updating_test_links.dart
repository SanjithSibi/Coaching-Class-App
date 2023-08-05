import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nice_loading_button/nice_loading_button.dart';
import 'package:tcda_app/Admin/drawing_test_link.dart';
import 'package:tcda_app/Admin/general_ability_test.dart';
import 'package:tcda_app/Admin/non_verbal_reasoning_test_link.dart';

class UpdatingTestLinks extends StatelessWidget {
  const UpdatingTestLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Test Link'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // This will pop the current route and go back
          },
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Nice Loading Button with CircularProgress widget
            LoadingButton(
              height: 50,
              borderRadius: 8,
              animate: true,
              color: const Color.fromARGB(255, 18, 44, 108),
              width: MediaQuery.of(context).size.width * 0.44,
              loader: Container(
                padding: const EdgeInsets.all(10),
                width: 40,
                height: 40,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              child: Text(
                "Drawing",
                style: TextStyle(
                  color: Colors.white, // Set the desired text color here
                ),
              ),
              onTap: (startLoading, stopLoading, buttonState) async {
                if (buttonState == ButtonState.idle) {
                  startLoading();
                  // Do something here
                  await Future.delayed(const Duration(seconds: 2));
                  stopLoading();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Drawinglinkupdate()),
                  );
                }
              },
            ),
            const SizedBox(height: 50),
            // Nice Loading Button with custom Text
            LoadingButton(
              height: 50,
              borderRadius: 8,
              roundLoadingShape: false,
              color: Color.fromARGB(255, 18, 44, 108),
              width: MediaQuery.of(context).size.width * 0.44,
              minWidth: MediaQuery.of(context).size.width * 0.29,
              loader: const Text(
                "Loading in...",
                style: TextStyle(
                  color: Colors.white, // Set the desired text color here
                ),
              ),
              child: Text(
                "General Ability",
                style: TextStyle(
                  color: Colors.white, // Set the desired text color here
                ),
              ),
              onTap: (startLoading, stopLoading, buttonState) async {
                if (buttonState == ButtonState.idle) {
                  startLoading();
                  // Do something here
                  await Future.delayed(const Duration(seconds: 2));
                  stopLoading();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Generalability_link_update()),
                  );
                }
              },
            ),
            const SizedBox(height: 50),
            // Nice Loading Button with Custom Loading
            LoadingButton(
              height: 50,
              borderRadius: 8,
              animate: true,
              color: const Color.fromARGB(255, 18, 44, 108),
              width: MediaQuery.of(context).size.width * 0.44,
              loader: Container(
                padding: const EdgeInsets.all(10),
                child: const Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.white,
                  ),
                ),
              ),
              child: Text(
                "Non Verbal Reasoning",
                style: TextStyle(
                  color: Colors.white, // Set the desired text color here
                ),
              ),
              onTap: (startLoading, stopLoading, buttonState) async {
                if (buttonState == ButtonState.idle) {
                  startLoading();
                  // Do something here
                  await Future.delayed(const Duration(seconds: 3));
                  stopLoading();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Nonverbalreasoninglinkupdate()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

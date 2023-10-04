import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class TotalPricePage extends StatefulWidget {
  final double totalExpenses;

  TotalPricePage({required this.totalExpenses});

  @override
  _TotalPricePageState createState() => _TotalPricePageState();
}

class _TotalPricePageState extends State<TotalPricePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Price'),
      ),
      body: Center(
        child: Container(
          height: 100, // Adjust the size as needed
          width: 100, // Adjust the size as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 241, 68, 68),
          ),
          child: Center(
            child: Text(
              widget.totalExpenses.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

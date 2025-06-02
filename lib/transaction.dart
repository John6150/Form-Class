import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Welcome to transactions',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

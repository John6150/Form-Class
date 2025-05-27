import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: SafeArea(
        child: Container(
          color: Colors.red,
          child: Center(child: Text('Hello, welcome to the dashbaord')),
        ),
      ),
    );
  }
}

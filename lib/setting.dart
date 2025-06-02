import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Welcome to settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

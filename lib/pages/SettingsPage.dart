import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 4, 144, 209),
        body: Center(
          child: Text(
            'SettingsPage',
            style: TextStyle(
              fontSize: 60,
            ), // Text
          ), // Center
        ));
  }
}

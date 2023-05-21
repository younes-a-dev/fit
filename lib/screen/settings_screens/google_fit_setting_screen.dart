import 'package:flutter/material.dart';

class GoogleFitSettingScreen extends StatelessWidget {
  const GoogleFitSettingScreen({Key? key}) : super(key: key);

  static const routeName = '/Settings screen --> Google fit setting screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Google fit settings screen'),
      ),
    );
  }
}

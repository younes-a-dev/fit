import 'package:flutter/material.dart';

class GuideSettingScreen extends StatelessWidget {
  const GuideSettingScreen({Key? key}) : super(key: key);

  static const routeName = '/SettingsScreen --> GuideSettingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Guide Screen'),
      ),
    );
  }
}

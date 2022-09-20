import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:workout/view/add_exercise_screen.dart';
import 'package:workout/view/alert_screen.dart';
import 'package:workout/view/forget_password_screen.dart';
import 'package:workout/view/intro_slider.dart';
import 'package:workout/view/main/auth_screen.dart';
import 'package:workout/view/main/discover_selected_cat_screen.dart';
import 'package:workout/view/main/home_screen.dart';

import 'bottom_navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home:  const HomeScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => AuthScreen()),
        //from create plan screen to add exercise screen
        GetPage(name: '/Add Exercise', page: () => AddExerciseScreen()),
        // from login page to forget password screen
        GetPage(name: '/forget password', page: () => ForgetPasswordScreen()),
        // from login-signup screen to bottom navigator
        GetPage(name: '/bottomNavigator', page: () => BottomNavigator()),
        // from login-signup screen to introSlider
        GetPage(name: '/intro slider screen', page: () => IntroSlider()),
        // from home Screen to Bookmarked screen
        GetPage(name: '/bookmarked screen', page: () => AlertScreen()),
        // // from home screen to exercise detail screen
        // GetPage(
        //     name: '/Exercise Detail Screen',
        //     page: () => ExerciseDetailScreen()),

        // from discover home and club item to selected item(cat) screen
        GetPage(
            name: '/Discover selected cat screen',
            page: () => DiscoverSelectedCatScreen()),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:workout/provider/articles.dart';
import 'package:workout/provider/exercise.dart';
import 'package:workout/provider/plan.dart';
import 'package:workout/provider/user_setting.dart';
import 'package:workout/screen/Article_detail_screen.dart';
import 'package:workout/screen/about_us_screen.dart';
import 'package:workout/screen/bmi_score_screen.dart';
import 'package:workout/screen/calculator_screens/body_fat_percentage_screen.dart';
import 'package:workout/screen/calculator_screens/body_mass_index_screen.dart';
import 'package:workout/screen/calculator_screens/calories_burned_screen.dart';
import 'package:workout/screen/calculator_screens/daily_calorie_calculator_screen.dart';
import 'package:workout/screen/care_plans_screen.dart';
import 'package:workout/screen/change_password_screen.dart';
import 'package:workout/screen/init_user_info.dart';
import 'package:workout/screen/log_measurement_screen.dart';
import 'package:workout/screen/main/add_exercise_screen.dart';
import 'package:workout/screen/calculators_screen.dart';
import 'package:workout/screen/edit_profile_screen.dart';
import 'package:workout/screen/main/create_custom_plan_screen.dart';
import 'package:workout/screen/main/create_plan_screen.dart';
import 'package:workout/screen/main/plan_overview_screen.dart';
import 'package:workout/screen/main/edit_custom_plan_screen.dart';
import 'package:workout/screen/main/favorite_plans_screen.dart';
import 'package:workout/screen/main/home_screen.dart';
import 'package:workout/screen/main/selected_custom_plan_screen.dart';
import 'package:workout/screen/manage_subscription_screen.dart';
import 'package:workout/screen/measures_screen.dart';
import 'package:workout/screen/main/settings_screen.dart';
import 'package:workout/screen/on_bording_screen.dart';
import 'package:workout/screen/selected_hex_Fit_plan_screen.dart';
import 'package:workout/screen/settings_screens/google_fit_setting_screen.dart';
import 'package:workout/screen/settings_screens/guide_setting_screen.dart';
import 'package:workout/screen/settings_screens/select_first_week_day_screen.dart';
import 'package:workout/screen/settings_screens/theme_setting_screen.dart';
import 'package:workout/screen/settings_screens/units_setting_screen.dart';
import 'package:workout/screen/settings_screens/workout_setting_screen.dart';
import 'package:workout/screen/statistics_screen.dart';
import 'package:workout/theme/custom_theme.dart';
import 'package:workout/theme/config.dart';

import 'provider/measure.dart';
import 'screen/alert_screen.dart';
import 'screen/forget_password_screen.dart';
import 'screen/intro_slider.dart';
import 'screen/main/auth_screen.dart';
import 'screen/discover_selected_plan_detail_screen.dart';
import 'bottom_navigator.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarContrastEnforced: true,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  // SystemChrome.setEnabledSystemUIMode(
  //   SystemUiMode.manual,
  // );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Exercises(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Measures(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Plans(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Articles(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => User(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Workout',
        // theme: ThemeData(
        //   appBarTheme: AppBarTheme(
        //     elevation: 0,
        //     backgroundColor: Colors.transparent,
        //     brightness: Brightness.light,
        //   ),
        //   primarySwatch: Colors.blue,
        //   fontFamily: 'Raleway',
        // ),
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: currentTheme.currentTheme,
        home: AuthScreen(),
        // CaloriesBurnedScreen(),
        //const AuthScreen(),
        // IntroSlider(),
        //  OnBoardingScreen(),
        initialRoute: '/',
        routes: {
          AddExerciseScreen.routeName: (ctx) => AddExerciseScreen(),
          ForgetPasswordScreen.routeName: (ctx) => ForgetPasswordScreen(),
          BottomNavigator.routeName: (ctx) => BottomNavigator(),
          IntroSlider.routeName: (ctx) => IntroSlider(),
          AlertScreen.routeName: (ctx) => AlertScreen(),
          DiscoverSelectedPlanDetailScreen.routeName: (ctx) =>
              DiscoverSelectedPlanDetailScreen(),
          EditProfileScreen.routName: (ctx) => EditProfileScreen(),
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
          ManageSubscriptionScreen.routeName: (ctx) =>
              ManageSubscriptionScreen(),
          AboutUsScreen.routeName: (ctx) => AboutUsScreen(),
          FavoritePlansScreen.routeName: (ctx) => FavoritePlansScreen(),
          MeasuresScreen.routeName: (ctx) => MeasuresScreen(),
          CalculatorsScreen.routeName: (ctx) => CalculatorsScreen(),
          StatisticsScreen.routeName: (ctx) => StatisticsScreen(),
          CarePlansScreen.routeName: (ctx) => CarePlansScreen(),
          // settings screens route
          WorkoutSettingScreen.routeName: (ctx) => WorkoutSettingScreen(),
          UnitsSettingScreen.routeName: (ctx) => UnitsSettingScreen(),
          GuideSettingScreen.routeName: (ctx) => GuideSettingScreen(),
          ThemeSettingScreen.routeName: (ctx) => ThemeSettingScreen(),
          GoogleFitSettingScreen.routeName: (ctx) => GoogleFitSettingScreen(),
          SelectFirstWeekDayScreen.routeName: (ctx) =>
              SelectFirstWeekDayScreen(),
          // Calculators screen route
          BodyMassIndexScreen.routeName: (ctx) => BodyMassIndexScreen(),
          BodyFatPercentageScreen.routeName: (ctx) => BodyFatPercentageScreen(),
          CaloriesBurnedScreen.routeName: (ctx) => CaloriesBurnedScreen(),
          DailyCalorieCalculatorScreen.routeName: (ctx) =>
              DailyCalorieCalculatorScreen(),
          BmiScoreScreen.routeName: (ctx) => BmiScoreScreen(),
          SelectedCustomPlanScreen.routeName: (ctx) =>
              SelectedCustomPlanScreen(),
          EditCustomPlanScreen.routeName: (ctx) => EditCustomPlanScreen(),
          ArticleDetailScreen.routeName: (ctx) => ArticleDetailScreen(),
          LogMeasurementScreen.routeName: (ctx) => LogMeasurementScreen(),
          // SetWeeklyGoalScreen.routeName: (ctx) => SetWeeklyGoalScreen(),
          PlanOverviewScreen.routeName: (ctx) => PlanOverviewScreen(),
          OnBoardingScreen.routeName: (ctx) => OnBoardingScreen(),
          SelectedHexFitPlanScreen.routeName: (ctx) =>
              SelectedHexFitPlanScreen(),
          CreatePlanScreen.routeName: (ctx)=> CreatePlanScreen(),
          ChangePasswordScreen.routeName : (ctx) => ChangePasswordScreen(),
          InitUserInfo.routeName: (ctx) => InitUserInfo(),
        },
        // getPages: [
        //   GetPage(name: '/', page: () => AuthScreen()),
        //   //from create plan screen to add exercise screen
        //   GetPage(name: '/Add Exercise', page: () => AddExerciseScreen()),
        //   // from login page to forget password screen
        //   GetPage(name: '/forget password', page: () => ForgetPasswordScreen()),
        //   // from login-signup screen to bottom navigator
        //   GetPage(name: '/bottomNavigator', page: () => BottomNavigator()),
        //   // from login-signup screen to introSlider
        //   GetPage(name: '/intro slider screen', page: () => IntroSlider()),
        //   // from home Screen to Bookmarked screen
        //   GetPage(name: '/bookmarked screen', page: () => AlertScreen()),
        //   // // from home screen to exercise detail screen
        //   // GetPage(
        //   //     name: '/Exercise Detail Screen',
        //   //     page: () => ExerciseDetailScreen()),

        //   // from discover home and club item to selected item(cat) screen
        //   GetPage(
        //       name: '/Discover selected cat screen',
        //       page: () => DiscoverSelectedCatScreen()),
        // ],
      ),
    );
  }
}

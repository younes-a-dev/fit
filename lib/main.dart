import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../screen/Article_detail_screen.dart';
import '../../screen/about_us_screen.dart';
import '../../screen/bmi_score_screen.dart';
import '../../screen/calculator_screens/body_fat_percentage_screen.dart';
import '../../screen/calculator_screens/body_mass_index_screen.dart';
import '../../screen/calculator_screens/calories_burned_screen.dart';
import '../../screen/calculator_screens/daily_calorie_calculator_screen.dart';
import '../../screen/care_plans_screen.dart';
import '../../screen/change_password_screen.dart';
import '../../screen/init_user_info.dart';
import '../../screen/log_measurement_screen.dart';
import '../../screen/main/add_exercise_screen.dart';
import '../../screen/calculators_screen.dart';
import '../../screen/edit_profile_screen.dart';
import '../../screen/main/create_plan_screen.dart';
import '../../screen/main/plan_overview_screen.dart';
import '../../screen/main/edit_custom_plan_screen.dart';
import '../../screen/main/favorite_plans_screen.dart';
import '../../screen/main/selected_custom_plan_screen.dart';
import '../../screen/manage_subscription_screen.dart';
import '../../screen/measures_screen.dart';
import '../../screen/main/settings_screen.dart';
import '../../screen/on_bording_screen.dart';
import '../../screen/selected_hex_Fit_plan_screen.dart';
import '../../screen/settings_screens/google_fit_setting_screen.dart';
import '../../screen/settings_screens/guide_setting_screen.dart';
import '../../screen/settings_screens/select_first_week_day_screen.dart';
import '../../screen/settings_screens/theme_setting_screen.dart';
import '../../screen/settings_screens/units_setting_screen.dart';
import '../../screen/settings_screens/workout_setting_screen.dart';
import '../../screen/statistics_screen.dart';
import '../../theme/custom_theme.dart';
import '../../theme/config.dart';

import 'features/feature_auth/presentation/bloc/cubit/auth_cubit.dart';
import 'features/feature_auth/presentation/screens/change_pass_screen.dart';
import 'features/feature_auth/presentation/screens/code_verification_screen.dart';
import 'features/feature_startup/presentation/screens/splash_screen.dart';
import 'features/feature_startup/presentation/cubit/startup_cubit.dart';
import 'features/language/presentation/cubit/language_cubit.dart';
import 'features/language/presentation/screens/language_selection_page.dart';
import 'locator.dart';
import 'screen/alert_screen.dart';
import 'features/feature_auth/presentation/screens/enter_email_for_pass_reset_screen.dart';
import 'features/feature_startup/presentation/screens/intro_slider.dart';
import 'features/feature_auth/presentation/screens/auth_screen.dart';
import 'screen/discover_selected_plan_detail_screen.dart';
import 'bottom_navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarContrastEnforced: true,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  await setup();
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

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SplashCubit>()..startSplash(), // Auto-start
        ),
        BlocProvider(
          create: (context) => sl<LanguageCubit>(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        // BlocProvider(
        //   create: (context) => ButtonCubit(),
        // ),

        // ChangeNotifierProvider(
        //   create: (ctx) => Auth(),
        // ),
        // ChangeNotifierProvider(
        //   create: (ctx) => Exercises(),
        // ),
        // ChangeNotifierProvider(
        //   create: (ctx) => Measures(),
        // ),
        // ChangeNotifierProvider(
        //   create: (ctx) => Plans(),
        // ),
        // ChangeNotifierProvider(
        //   create: (ctx) => Articles(),
        // ),
        // ChangeNotifierProvider(
        //   create: (ctx) => User(),
        // ),
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
        home: SplashScreen(),
        // CaloriesBurnedScreen(),
        //const AuthScreen(),
        // IntroSlider(),
        //  OnBoardingScreen(),
        initialRoute: '/',
        routes: {
          AuthScreen.routeName: (ctx) => const AuthScreen(),
          LanguageSelectionPage.routeName : (ctx) => LanguageSelectionPage(),
          CodeVerificationScreen.routeName: (ctx) => CodeVerificationScreen(),
          ChangePassScreen.routeName: (ctx) => ChangePassScreen(),
          AddExerciseScreen.routeName: (ctx) => const AddExerciseScreen(),
          EnterEmailForPassResetScreen.routeName: (ctx) =>
              const EnterEmailForPassResetScreen(),
          BottomNavigator.routeName: (ctx) => BottomNavigator(),
          IntroSlider.routeName: (ctx) => IntroSlider(),
          AlertScreen.routeName: (ctx) => AlertScreen(),
          DiscoverSelectedPlanDetailScreen.routeName: (ctx) =>
              DiscoverSelectedPlanDetailScreen(),
          EditProfileScreen.routName: (ctx) => const EditProfileScreen(),
          SettingsScreen.routeName: (ctx) => const SettingsScreen(),
          ManageSubscriptionScreen.routeName: (ctx) =>
              ManageSubscriptionScreen(),
          AboutUsScreen.routeName: (ctx) => const AboutUsScreen(),
          FavoritePlansScreen.routeName: (ctx) => const FavoritePlansScreen(),
          MeasuresScreen.routeName: (ctx) => const MeasuresScreen(),
          CalculatorsScreen.routeName: (ctx) => const CalculatorsScreen(),
          StatisticsScreen.routeName: (ctx) => const StatisticsScreen(),
          CarePlansScreen.routeName: (ctx) => const CarePlansScreen(),
          // settings screens route
          WorkoutSettingScreen.routeName: (ctx) => const WorkoutSettingScreen(),
          UnitsSettingScreen.routeName: (ctx) => const UnitsSettingScreen(),
          GuideSettingScreen.routeName: (ctx) => const GuideSettingScreen(),
          ThemeSettingScreen.routeName: (ctx) => const ThemeSettingScreen(),
          GoogleFitSettingScreen.routeName: (ctx) =>
              const GoogleFitSettingScreen(),
          SelectFirstWeekDayScreen.routeName: (ctx) =>
              const SelectFirstWeekDayScreen(),
          // Calculators screen route
          BodyMassIndexScreen.routeName: (ctx) => const BodyMassIndexScreen(),
          BodyFatPercentageScreen.routeName: (ctx) =>
              const BodyFatPercentageScreen(),
          CaloriesBurnedScreen.routeName: (ctx) => CaloriesBurnedScreen(),
          DailyCalorieCalculatorScreen.routeName: (ctx) =>
              DailyCalorieCalculatorScreen(),
          BmiScoreScreen.routeName: (ctx) => const BmiScoreScreen(),
          SelectedCustomPlanScreen.routeName: (ctx) =>
              const SelectedCustomPlanScreen(),
          EditCustomPlanScreen.routeName: (ctx) => const EditCustomPlanScreen(),
          ArticleDetailScreen.routeName: (ctx) => const ArticleDetailScreen(),
          LogMeasurementScreen.routeName: (ctx) => LogMeasurementScreen(),
          // SetWeeklyGoalScreen.routeName: (ctx) => SetWeeklyGoalScreen(),
          PlanOverviewScreen.routeName: (ctx) => const PlanOverviewScreen(),
          OnBoardingScreen.routeName: (ctx) => const OnBoardingScreen(),
          SelectedHexFitPlanScreen.routeName: (ctx) =>
              const SelectedHexFitPlanScreen(),
          CreatePlanScreen.routeName: (ctx) => const CreatePlanScreen(),
          ChangePasswordScreen.routeName: (ctx) => const ChangePasswordScreen(),
          InitUserInfo.routeName: (ctx) => const InitUserInfo(),
        },
      ),
    );
  }
}

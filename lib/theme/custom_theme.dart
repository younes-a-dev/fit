import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  bool get themeMode {
    return _isDarkTheme;
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      // // brightness:,
      // // visualDensity:,
      //  primarySwatch: ,
      primaryColor:const Color(0xff2e2e2e),
      primaryColorLight: const Color(0xff2e2e2e),
      primaryColorDark: const Color(0xfff5f5f5),
      canvasColor:  const Color(0xff2e2e2e),
      // // shadowColor:,
      scaffoldBackgroundColor: const Color(0xfff9f9f9),
      // // cardColor:,
       dividerColor: const Color(0xffe1e1e1),
      // // focusColor:,
      // hoverColor:,
      // // highlightColor:,
      // // splashColor:,
      // // splashFactory:,
      // // unselectedWidgetColor:,
      // // disabledColor:,
      // // buttonTheme:,
      // // toggleButtonsTheme:,
      // secondaryHeaderColor:,
      // // dialogBackgroundColor:,
      // // indicatorColor:,
      // hintColor: Colors.grey,
      fontFamily: 'Raleway',
      textTheme: const TextTheme(
        // Sing up - Sign in
        titleLarge: TextStyle(
          color: Color(0xff212121),
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
        //  OnBoarding title
        titleMedium: TextStyle(
          color: Color(0xff212121),
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        //App Bars title
        titleSmall: TextStyle(
          color: Color(0xff212121),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        // Exercise item title
        bodyLarge: TextStyle(
          color: Color(0xff212121),
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        // bodyMedium:

        // Today session ( workout count session name)
        // plan history card ( date )
        // Exercise items ( sets count --- muscle type)
        bodySmall: TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
        // ListView title ( dashboard - settings )
        // OnBoarding Questions
        labelLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff212121),
          fontSize: 20,
        ),
        // Plan card title
        // Today Session ( Plan Name , Day counter )
        // plan Sessions Card name in plan overView Screen
        labelMedium: TextStyle(
          color: Color(0xfffafafa),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        // Today session ( Today ),
        // Measurement Screen ( Muscle name ),
        labelSmall: TextStyle(
          color: Color(0xfffafafa),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),

        // Calculator Screens ( Description titles ),
        displayLarge: TextStyle(
          color: Color(0xff212121),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        // displayMedium: ,
        // Home & create plan & Measurement & Calculator Screens (
        // description Text)
        displaySmall: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.normal,
          fontSize: 13,
        ),
        //
        // headlineLarge: ,
        // Profile listview item title
        headlineMedium: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        // Plan Card ( Workouts and its time)
        // Plan history car ( title )
        headlineSmall: TextStyle(
          color: Color(0xfffafafa),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),

        //----------------------------------------------------------------------
        // Deprecate
        // bodyText1: ,
        //  bodyText2: ,
        // button: ,
        // caption: ,
        // headline1: ,
        // overline: ,
        // headline2: ,
        // headline3: ,
        // headline4: ,
        // headline5: ,
        // headline6: ,
        // subtitle1: ,
        // subtitle2: ,
      ),
      // appBarTheme: AppBarTheme(),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.withOpacity(.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
              color: Colors.transparent, style: BorderStyle.none, width: 0),
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        suffixIconColor: const Color(0xffffd600),
        prefixIconColor: const Color(0xffffd600),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
              color: Colors.transparent, style: BorderStyle.none, width: 0),
        ),
        disabledBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
              color: Colors.transparent, style: BorderStyle.none, width: 0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),



      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Color(0xffffd600)),
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // maximumSize: const MaterialStatePropertyAll(Size(300, 100)),
          fixedSize: const MaterialStatePropertyAll(Size(double.maxFinite, 50)),
          // Button Text Color
          foregroundColor: const MaterialStatePropertyAll(Colors.black54),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      // outlinedButtonTheme:,
      // textButtonTheme:,
      // iconTheme:,
      // primaryIconTheme:,
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Colors.grey,
        labelColor: Color(0xff212121),
        indicatorSize: TabBarIndicatorSize.label,
        splashFactory: InkRipple.splashFactory,
        labelPadding: EdgeInsets.only(left: 35, right: 35, top: 20, bottom: 20),
      ),
      // materialTapTargetSize:MaterialTapTargetSize.padded,
      // appBarTheme:,
      // scrollbarTheme:,
      // colorScheme:,
      // dialogTheme:,
      // navigationRailTheme:,
      // typography:,
      // popupMenuTheme:,
      // snackBarTheme:,
      // dividerTheme:,
      //------------------------------------------------------------------------
      // primaryTextTheme: ,
      // sliderTheme:,
      // tooltipTheme:,
      // cardTheme:,
      // chipTheme:,
      // platform:,
      // applyElevationOverlayColor:,
      // pageTransitionsTheme:,
      // bottomAppBarTheme:,
      // floatingActionButtonTheme:,
      // cupertinoOverrideTheme:,
      // bottomSheetTheme:,
      // bannerTheme:,
      // buttonBarTheme:,
      // bottomNavigationBarTheme:,
      // timePickerTheme:,
      // textSelectionTheme:,
      // dataTableTheme:,
      // checkboxTheme:,
      // radioTheme:,
      // switchTheme:,
      // progressIndicatorTheme:,

      //------------------------------------------------------------------------
      // Deprecated
      // fixTextFieldOutlineLabel:,
      // primaryColorBrightness:,
      // accentColor:,
      // accentColorBrightness:,
      // bottomAppBarColor:,
      // selectedRowColor:,
      // buttonColor:,
      // backgroundColor:,
      // errorColor:,
      // toggleableActiveColor:,
      // accentTextTheme:,
      // accentIconTheme:,

      // Deleted
      // useTextSelectionTheme:,
      // textSelectionColor:,
      // cursorColor:,
      // textSelectionHandleColor:,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      // // brightness:,
      // // visualDensity:,
      // primarySwatch:,
       primaryColor: const Color(0xfffafafa),
       primaryColorLight: const Color(0xfffafafa),
       primaryColorDark:  const Color(0xff2e2e2e),
      canvasColor: Colors.grey,
      // // shadowColor:,
      scaffoldBackgroundColor: const Color(0xff212121),
      // // cardColor:,
        dividerColor: const Color(0x50f5f5f5),
      // // focusColor:,
      // hoverColor:,
      // // highlightColor:,
      // // splashColor:,
      // // splashFactory:,
      // // unselectedWidgetColor:,
      // // disabledColor:,
      // // buttonTheme:,
      // // toggleButtonsTheme:,
      // secondaryHeaderColor:,
      // // dialogBackgroundColor:,
      // // indicatorColor:,
      // hintColor: Colors.grey,
      fontFamily: 'Raleway',
      textTheme: const TextTheme(
        // Sing up - Sign in
        titleLarge: TextStyle(
          color: Color(0xfffafafa),
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
        //  OnBoarding title
        titleMedium: TextStyle(
          color: Color(0xfffafafa),
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        //App Bars title
        titleSmall: TextStyle(
          color: Color(0xfffafafa),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        // Exercise item title
        bodyLarge: TextStyle(
          color: Color(0xfffafafa),
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        // bodyMedium:

        // Today session ( workout count session name)
        // plan history card ( date )
        // Exercise items ( sets count --- muscle type)
        bodySmall: TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
        // ListView title ( dashboard - settings )
        // OnBoarding Questions
        labelLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xfffafafa),
          fontSize: 20,
        ),
        // Plan card title
        // Today Session ( Plan Name , Day counter )
        // plan Sessions Card name in plan overView Screen
        labelMedium: TextStyle(
          color: Color(0xfffafafa),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        // Today session ( Today ),
        // Measurement Screen ( Muscle name ),
        labelSmall: TextStyle(
          color: Color(0xfffafafa),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),

        // Calculator Screens ( Description titles ),
        displayLarge: TextStyle(
          color: Color(0xfffafafa),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        // displayMedium: ,
        // Home & create plan & Measurement & Calculator Screens (
        // description Text)
        displaySmall: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        //
        // Profile listview item title
        // headlineLarge: ,
        headlineMedium: TextStyle(
          color: Color(0xfffafafa),
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        // Plan Card ( Workouts and its time)
        // Plan history car ( title )
        headlineSmall: TextStyle(
          color: Color(0xfffafafa),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),

        //----------------------------------------------------------------------
        // Deprecate
        // bodyText1: ,
        //  bodyText2: ,
        // button: ,
        // caption: ,
        // headline1: ,
        // overline: ,
        // headline2: ,
        // headline3: ,
        // headline4: ,
        // headline5: ,
        // headline6: ,
        // subtitle1: ,
        // subtitle2: ,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.withOpacity(.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
              color: Colors.transparent, style: BorderStyle.none, width: 0),
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        suffixIconColor: const Color(0xffffd600),
        prefixIconColor: const Color(0xffffd600),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
              color: Colors.transparent, style: BorderStyle.none, width: 0),
        ),
        disabledBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
              color: Colors.transparent, style: BorderStyle.none, width: 0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),



      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Color(0xffffd600)),
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // maximumSize: const MaterialStatePropertyAll(Size(300, 100)),
          fixedSize: const MaterialStatePropertyAll(Size(double.maxFinite, 50)),
          // Button Text Color
          foregroundColor: const MaterialStatePropertyAll(Colors.black54),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      // outlinedButtonTheme:,
      // textButtonTheme:,
      // iconTheme:,
      // primaryIconTheme:,
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Colors.grey,
        labelColor: Color(0xff212121),
        indicatorSize: TabBarIndicatorSize.label,
        splashFactory: InkRipple.splashFactory,
        labelPadding: EdgeInsets.only(left: 35, right: 35, top: 20, bottom: 20),
      ),
      // materialTapTargetSize:MaterialTapTargetSize.padded,
      // appBarTheme:,
      // scrollbarTheme:,
      // colorScheme:,
      // dialogTheme:,
      // navigationRailTheme:,
      // typography:,
      // popupMenuTheme:,
      // snackBarTheme:,
      // dividerTheme:,
      //------------------------------------------------------------------------
      // primaryTextTheme: ,
      // sliderTheme:,
      // tooltipTheme:,
      // cardTheme:,
      // chipTheme:,
      // platform:,
      // applyElevationOverlayColor:,
      // pageTransitionsTheme:,
      // bottomAppBarTheme:,
      // floatingActionButtonTheme:,
      // cupertinoOverrideTheme:,
      // bottomSheetTheme:,
      // bannerTheme:,
      // buttonBarTheme:,
      // bottomNavigationBarTheme:,
      // timePickerTheme:,
      // textSelectionTheme:,
      // dataTableTheme:,
      // checkboxTheme:,
      // radioTheme:,
      // switchTheme:,
      // progressIndicatorTheme:,

      //------------------------------------------------------------------------
      // Deprecated
      // fixTextFieldOutlineLabel:,
      // primaryColorBrightness:,
      // accentColor:,
      // accentColorBrightness:,
      // bottomAppBarColor:,
      // selectedRowColor:,
      // buttonColor:,
      // backgroundColor:,
      // errorColor:,
      // toggleableActiveColor:,
      // accentTextTheme:,
      // accentIconTheme:,

      // Deleted
      // useTextSelectionTheme:,
      // textSelectionColor:,
      // cursorColor:,
      // textSelectionHandleColor:,
    );
  }
}

// ThemeData({
// Brightness? brightness,
// VisualDensity? visualDensity,
// MaterialColor? primarySwatch,
// Color? primaryColor,
// Brightness? primaryColorBrightness,
// Color? primaryColorLight,
// Color? primaryColorDark,
// Color? accentColor,
// Brightness? accentColorBrightness,
// Color? canvasColor,
// Color? shadowColor,
// Color? scaffoldBackgroundColor,
// Color? bottomAppBarColor,
// Color? cardColor,
// Color? dividerColor,
// Color? focusColor,
// Color? hoverColor,
// Color? highlightColor,
// Color? splashColor,
// InteractiveInkFeatureFactory? splashFactory,
// Color? selectedRowColor,
// Color? unselectedWidgetColor,
// Color? disabledColor,
// Color? buttonColor,
// ButtonThemeData? buttonTheme,
// ToggleButtonsThemeData? toggleButtonsTheme,
// Color? secondaryHeaderColor,
// Color? textSelectionColor,
// Color? cursorColor,
// Color? textSelectionHandleColor,
// Color? backgroundColor,
// Color? dialogBackgroundColor,
// Color? indicatorColor,
// Color? hintColor,
// Color? errorColor,
// Color? toggleableActiveColor,
// String? fontFamily,
// TextTheme? textTheme,
// TextTheme? primaryTextTheme,
// TextTheme? accentTextTheme,
// InputDecorationTheme? inputDecorationTheme,
// IconThemeData? iconTheme,
// IconThemeData? primaryIconTheme,
// IconThemeData? accentIconTheme,
// SliderThemeData? sliderTheme,
// TabBarTheme? tabBarTheme,
// TooltipThemeData? tooltipTheme,
// CardTheme? cardTheme,
// ChipThemeData? chipTheme,
// TargetPlatform? platform,
// MaterialTapTargetSize? materialTapTargetSize,
// bool? applyElevationOverlayColor,
// PageTransitionsTheme? pageTransitionsTheme,
// AppBarTheme? appBarTheme,
// ScrollbarThemeData? scrollbarTheme,
// BottomAppBarTheme? bottomAppBarTheme,
// ColorScheme? colorScheme,
// DialogTheme? dialogTheme,
// FloatingActionButtonThemeData? floatingActionButtonTheme,
// NavigationRailThemeData? navigationRailTheme,
// Typography? typography,
// NoDefaultCupertinoThemeData? cupertinoOverrideTheme,
// SnackBarThemeData? snackBarTheme,
// BottomSheetThemeData? bottomSheetTheme,
// PopupMenuThemeData? popupMenuTheme,
// MaterialBannerThemeData? bannerTheme,
// DividerThemeData? dividerTheme,
// ButtonBarThemeData? buttonBarTheme,
// BottomNavigationBarThemeData? bottomNavigationBarTheme,
// TimePickerThemeData? timePickerTheme,
// TextButtonThemeData? textButtonTheme,
// ElevatedButtonThemeData? elevatedButtonTheme,
// OutlinedButtonThemeData? outlinedButtonTheme,
// TextSelectionThemeData? textSelectionTheme,
// DataTableThemeData? dataTableTheme,
// CheckboxThemeData? checkboxTheme,
// RadioThemeData? radioTheme,
// SwitchThemeData? switchTheme,
// ProgressIndicatorThemeData? progressIndicatorTheme,
// bool? fixTextFieldOutlineLabel,
// bool? useTextSelectionTheme,
// })

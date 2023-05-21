import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:workout/screen/main/create_custom_plan_screen.dart';

import 'screen/main/discover_screen.dart';
import 'screen/main/home_screen.dart';
import 'screen/main/profile_screen.dart';

class BottomNavigator extends StatefulWidget {
  BottomNavigator({Key? key}) : super(key: key);

  static const routeName = '/Login-SignupScreen->BottomNavigator';

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;



  List _pages = [
    HomeScreen(),
    DiscoverScreen(),
    CreateCustomPlanScreen(),
    ProfileScreen(),
  ];

  void changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            elevation: 0,
            labelTextStyle: MaterialStateProperty.all( TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColorLight,
            ))),
        child: NavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: _currentIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations:  [
            NavigationDestination(
              icon: const Icon(
                flu.FluentIcons.home,
                color: Colors.grey,
              ),
              selectedIcon: Icon(
                flu.FluentIcons.home,
                color: Theme.of(context).primaryColorLight,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: const Icon(
                flu.FluentIcons.compass_n_w,
                color: Colors.grey,
              ),
              selectedIcon: Icon(
                flu.FluentIcons.compass_n_w,
                color: Theme.of(context).primaryColorLight,
              ),
              label: 'Discover',
            ),
            NavigationDestination(
              icon: const Icon(
                flu.FluentIcons.add_event,
                color: Colors.grey,
              ),
              selectedIcon: Icon(
                flu.FluentIcons.add_event,
                color: Theme.of(context).primaryColorLight,
              ),
              label: 'Create',
            ),
            NavigationDestination(
              icon: const Icon(
                flu.FluentIcons.contact,
                color: Colors.grey,
              ),
              selectedIcon: Icon(
                flu.FluentIcons.contact,
                color: Theme.of(context).primaryColorLight,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      // Stack(
      //   children: [
      //     SizedBox(
      //       height: size.height,
      //       width: size.width,
      //       child: Center(
      //         child: _pages[currentIndex],
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 15,
      //       left: 25,
      //       right: 25,
      //       child: Container(
      //         padding: EdgeInsets.only(top: 15, bottom: 15),
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           border: Border.all(width: .1, color: Colors.grey),
      //           borderRadius: BorderRadius.circular(15),
      //         ),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             IconButton(
      //               onPressed: () => changeScreen(0),
      //               icon: Icon(
      //                 flu.FluentIcons.home,
      //                 color: currentIndex == 0 ? Colors.black : Colors.grey,
      //               ),
      //             ),
      //             IconButton(
      //               onPressed: () => changeScreen(1),
      //               icon: Icon(
      //                 flu.FluentIcons.search,
      //                 color: currentIndex == 1 ? Colors.black : Colors.grey,
      //               ),
      //             ),
      //             IconButton(
      //               onPressed: () => changeScreen(2),
      //               icon: Icon(
      //                 flu.FluentIcons.contact,
      //                 color: currentIndex == 2 ? Colors.black : Colors.grey,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

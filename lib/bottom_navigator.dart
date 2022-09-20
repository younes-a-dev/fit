import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:workout/view/main/create_plan_screen.dart';
import 'package:workout/view/main/discover_screen.dart';
import 'package:workout/view/main/home_screen.dart';
import 'package:workout/view/main/profile_screen.dart';

class BottomNavigator extends StatefulWidget {
  BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;

  List _pages = [
    HomeScreen(),
    DiscoverScreen(),
    CreatePlanScreen(),
    ProfileScreen(),
  ];

  void changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            elevation: 0,
            labelTextStyle: MaterialStateProperty.all(const TextStyle(
              fontWeight: FontWeight.w500,
            ))),
        child: NavigationBar(
          backgroundColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: _currentIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(
                flu.FluentIcons.home,
                color: Colors.grey,
              ),
              selectedIcon: Icon(
                flu.FluentIcons.home,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                flu.FluentIcons.compass_n_w,
                color: Colors.grey,
              ),
              selectedIcon: Icon(
                flu.FluentIcons.compass_n_w,
                color: Colors.black,
              ),
              label: 'Discover',
            ),
            NavigationDestination(
              icon: Icon(
                flu.FluentIcons.add_event,
                color: Colors.grey,
              ),
              selectedIcon: Icon(
                flu.FluentIcons.add_event,
                color: Colors.black,
              ),
              label: 'Create',
            ),
            NavigationDestination(
              icon: Icon(
                flu.FluentIcons.contact,
                color: Colors.grey,
              ),
              selectedIcon: Icon(
                flu.FluentIcons.contact,
                color: Colors.black,
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

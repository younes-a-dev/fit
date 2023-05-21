import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:workout/screen/settings_screens/select_first_week_day_screen.dart';

import '../../provider/user_setting.dart';
import '../../res/colors.dart';

class WorkoutSettingScreen extends StatefulWidget {
  const WorkoutSettingScreen({Key? key}) : super(key: key);

  static const routeName = '/Settings screen --> Workout setting screen ';

  @override
  State<WorkoutSettingScreen> createState() => _WorkoutSettingScreenState();
}

class _WorkoutSettingScreenState extends State<WorkoutSettingScreen> {
  // Widget _buildListItem(Function function, String text, IconData icon) {
  //   return Column(
  //     children: [
  //       InkWell(
  //         borderRadius: BorderRadius.circular(16),
  //         onTap: () {
  //           function();
  //         },
  //         child: ListTile(
  //           title: Text(text),
  //           // dense: true,
  //           horizontalTitleGap: 0,
  //           minLeadingWidth: 35,
  //           contentPadding: const EdgeInsets.only(right: 35, left: 35),
  //           trailing: const Icon(
  //             Icons.arrow_right,
  //             color: MyColors.mainColor,
  //           ),
  //         ),
  //       ),
  //       const Divider(
  //         indent: 50,
  //         endIndent: 50,
  //       )
  //     ],
  //   );
  // }

  bool _keepAwakePhone = true;

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<User>(context).user;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          // Appbar
          Container(
            height: (size.height) / 20,
            width: size.width,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 20 + MediaQuery.of(context).padding.top,
              left: 5,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  'Workout Settings',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                    fontSize: 24,
                  ),
                ),
                // D  :)
                const IconButton(
                  onPressed: null,
                  splashColor: Colors.transparent,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),

          const Gap(30),
          Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(SelectFirstWeekDayScreen.routeName)
                      .then((_) => setState(() {}));
                },
                child: ListTile(
                  title: Row(
                    children: [
                      Text(
                        'Firs Day Of The Week',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                     const Spacer(),
                      Text(
                        userData.userFirstDay.toString().substring(13),
                        style: const TextStyle(
                          color: MyColors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_right,
                        color: MyColors.mainColor,
                      ),
                    ],
                  ),
                  // dense: true,
                  horizontalTitleGap: 0,
                  minLeadingWidth: 35,
                  contentPadding: const EdgeInsets.only(right: 35, left: 35),
                  leading:  Icon(Icons.today, color: Theme.of(context).primaryColor),
                ),
              ),
              const Divider(
                indent: 50,
                endIndent: 50,
              ),
              ListTile(
                horizontalTitleGap: 0,
                minLeadingWidth: 35,
                contentPadding: const EdgeInsets.only(left: 35, right: 35),
                title: Text(
                  'Keep Awake During Workout',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                subtitle: const Text(
                  'Enable this if you don\'t want your phone sleep while you'
                  '\'re'
                  ' in a workout',
                  style: TextStyle(
                    color: MyColors.grey,
                    fontSize: 12,
                  ),
                ),
                leading:  Icon(
                  Icons.screen_lock_portrait,
                  color: Theme.of(context).primaryColor,
                ),
                trailing: Switch(
                  activeColor: MyColors.mainColor,
                  value: _keepAwakePhone,
                  onChanged: (value) {
                    setState(() {
                      _keepAwakePhone = value;
                    });
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

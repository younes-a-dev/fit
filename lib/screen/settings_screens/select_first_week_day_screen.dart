import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:workout/widgets/app_bar_widget.dart';

import '../../provider/user_setting.dart';
import '../../res/colors.dart';

class SelectFirstWeekDayScreen extends StatefulWidget {
  const SelectFirstWeekDayScreen({Key? key}) : super(key: key);

  static const routeName =
      '/Workout Setting screen --> select first day of week screen';

  @override
  State<SelectFirstWeekDayScreen> createState() =>
      _SelectFirstWeekDayScreenState();
}

class _SelectFirstWeekDayScreenState extends State<SelectFirstWeekDayScreen> {
  int _selectedDayIndex = 0;

  Widget _buildDayListItem(
    String text,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(left: 35, right: 35),
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 15, color: Theme.of(context).primaryColor),
                ),
                const Spacer(),
                const Icon(
                  Icons.check,
                ),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<User>(context).user;
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'First Week Day',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(30),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Text(
              'Calendar week Starts on...',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Gap(50),
          GestureDetector(
            onTap: () {
              setState(() {
                userData.userFirstDay = FirstWeekDay.saturday;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(left: 35, right: 35),
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Saturday',
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.check,
                        color: userData.userFirstDay == FirstWeekDay.saturday
                            ? MyColors.mainColor
                            : Colors.transparent,
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                userData.userFirstDay = FirstWeekDay.sunday;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(left: 35, right: 35),
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Sunday',
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.check,
                        color: userData.userFirstDay == FirstWeekDay.sunday
                            ? MyColors.mainColor
                            : Colors.transparent,
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                userData.userFirstDay = FirstWeekDay.monday;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(left: 35, right: 35),
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Monday',
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.check,
                        color: userData.userFirstDay == FirstWeekDay.monday
                            ? MyColors.mainColor
                            : Colors.transparent,
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

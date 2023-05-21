import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';

import '../res/colors.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          availableGestures: AvailableGestures.none,
          locale: 'en_US',
          headerVisible: false,
          calendarFormat: CalendarFormat.week,
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, date, events) => SizedBox(
              height: size.height / 25,
              width: size.width / 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    date.day.toString(),
                    style:  const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: MyColors.grey,
                    ),
                  ),
                  Container(
                    width: 0,
                    height: 0,
                    decoration: const BoxDecoration(
                      color: MyColors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 0,
                    height: 0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MyColors.grey),
                  ),
                ],
              ),
            ),
            todayBuilder: (context, date, events) => SizedBox(
              height: size.height / 25,
              width: size.width / 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    date.day.toString(),
                    style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const Gap(10),
                  Container(
                    height: 4,
                    width: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MyColors.mainColor),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

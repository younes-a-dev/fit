import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';


class HomeDaysOfWeekItem extends StatelessWidget {

  final String day;
  final bool selectedDays;
  final bool currentDay;

  HomeDaysOfWeekItem(this.day,this.selectedDays,this.currentDay);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height / 25,
      width: Get.size.width / 15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            day,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          Container(
            width: selectedDays ? 5 : 0,
            height: selectedDays ? 5 : 0,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            height: currentDay ? 4 : 0,
            width: currentDay ? 20 : 0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.yellow
            ),
          ),
        ],
      ),
    );
  }
}

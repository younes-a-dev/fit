import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:workout/view/main/discover_selected_cat_screen.dart';

class HomeAndClubItem extends StatelessWidget {
  final String title;
  final String image;
  final int exerciseTime;
  final int exerciseCount;

  HomeAndClubItem(
      this.title, this.image, this.exerciseTime, this.exerciseCount);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => DiscoverSelectedCatScreen(),
          arguments: {
            'title': title,
            'image': image,
            'exerciseTime': exerciseTime,
            'exerciseCount': exerciseCount,
          },
        );
      },
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 8,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            //padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 8,
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              //color: Colors.black87,
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black87,
                  Colors.black54,
                  Colors.black54,
                  Colors.transparent,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                const Gap(5),
                Row(
                  children: [
                    Text(
                      '$exerciseTime  mins',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    const Icon(
                      flu.FluentIcons.location_dot,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      '$exerciseCount  workout',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      flu.FluentIcons.hexagon,
                      color: Colors.yellow.withOpacity(.6),
                      size: 16,
                    ),
                    Gap(5),
                    Icon(
                      flu.FluentIcons.hexagon,
                      color: Colors.yellow.withOpacity(.6),
                      size: 16,
                    ),
                    Gap(5),
                    Icon(
                      flu.FluentIcons.hexagon,
                      color: Colors.yellow.withOpacity(.6),
                      size: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

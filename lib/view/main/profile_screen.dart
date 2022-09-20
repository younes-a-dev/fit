import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  Widget _buildListTile(IconData icon, String title) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          const Gap(15),
          Text(
            title,
            style: TextStyle(
                color: Colors.black.withOpacity(.7),
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          const Icon(
            flu.FluentIcons.chevron_right,
            size: 18,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: // Appbar
          Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: (Get.size.height) / 10,
            width: Get.size.width,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 35,
              right: 35,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Spacer(),
                Icon(flu.FluentIcons.more_vertical),
              ],
            ),
          ),
          Container(
            width: Get.size.height / 10,
            height: Get.size.height / 10,
            //margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(90),
            ),
            child: Center(
              child: Icon(
                Icons.hexagon_outlined,
                color: Colors.yellow,
                size: Get.size.height / 20,
              ),
            ),
          ),
          Gap(20),
          Text(
            'Younes',
            style: TextStyle(
              color: Colors.black87.withOpacity(.7),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gap(30),
          Divider(color: Colors.yellow, thickness: 1.5),
          Container(
            margin: EdgeInsets.only(left: 35, right: 35, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dashboard',
                  style: TextStyle(
                      color: Colors.black.withOpacity(.7),
                      fontSize: 19,
                      fontWeight: FontWeight.w700),
                ),
                const Gap(20),
                _buildListTile(flu.FluentIcons.care_plan, 'Care plan'),
                _buildListTile(flu.FluentIcons.share, 'Invite Friends'),
                _buildListTile(flu.FluentIcons.bug, 'Report a bug'),
                _buildListTile(flu.FluentIcons.care_plan, 'Care plan'),
                _buildListTile(flu.FluentIcons.care_plan, 'Care plan'),
                _buildListTile(flu.FluentIcons.settings, 'Settings'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

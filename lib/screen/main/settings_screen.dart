import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:workout/screen/settings_screens/google_fit_setting_screen.dart';
import 'package:workout/screen/settings_screens/guide_setting_screen.dart';
import 'package:workout/screen/settings_screens/theme_setting_screen.dart';
import 'package:workout/screen/settings_screens/units_setting_screen.dart';
import 'package:workout/screen/settings_screens/workout_setting_screen.dart';

//
//
//
//// delete this screen
//
//
//

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = '/EditProfileScreen --> Settings screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? _equipmentValue;

  void _selectEquipment(dynamic selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _equipmentValue = selectedValue;
      });
    }
  }

  Widget _buildListItem(Function function, String text, IconData icon) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            function();
          },
          child: ListTile(
            title: Text(text),
            // dense: true,
            horizontalTitleGap: 0,
            minLeadingWidth: 35,
            contentPadding: const EdgeInsets.only(right: 35, left: 35),
            leading: Icon(icon, color: Colors.black),
            trailing: const Icon(
              Icons.arrow_right,
              color: Colors.yellow,
            ),
          ),
        ),
        const Divider(
          indent: 50,
          endIndent: 50,
        )
      ],
    );
  }

  Widget _buildListTitle(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: Row(
        children: [
          Icon(icon, size: 22),
          const Gap(10),
          Text(
            '$title :',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            top: 40 + MediaQuery.of(context).padding.top,
            left: 35,
            right: 35,
          ),
          child: const Text(
            'Settings',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
              fontSize: 24,
            ),
          ),
        ),

        //Gap(20),
        SizedBox(
          child: Column(
            children: [
              const Gap(30),
              _buildListItem(
                () {
                  Navigator.of(context)
                      .pushNamed(WorkoutSettingScreen.routeName);
                },
                'Workout',
                Icons.fitness_center_outlined,
              ),
              _buildListItem(
                () {
                  Navigator.of(context).pushNamed(UnitsSettingScreen.routeName);
                },
                'Units',
                Icons.straighten_rounded,
              ),
              _buildListItem(
                () {
                  Navigator.of(context).pushNamed(GuideSettingScreen.routeName);
                },
                'Guide',
                Icons.lightbulb_outline_rounded,
              ),
              _buildListItem(
                () {
                  Navigator.of(context).pushNamed(ThemeSettingScreen.routeName);
                },
                'Theme',
                Icons.dark_mode,
              ),
              _buildListItem(
                () {
                  Navigator.of(context)
                      .pushNamed(GoogleFitSettingScreen.routeName);
                },
                'Google Fit',
                Icons.link,
              ),
              _buildListItem(() {}, 'Invite Friend', Icons.mail),
              _buildListItem(() {}, 'Rate Us', Icons.star),
              _buildListItem(() {}, 'Feedback', Icons.create),
              _buildListItem(() {}, 'Report Bugs', Icons.bug_report),
              // _buildListItem(() {}, 'Guide', Icons.lightbulb_outline_rounded),
              // _buildListItem(() {}, 'Guide', Icons.lightbulb_outline_rounded),
              // _buildListItem(() {}, 'Guide', Icons.lightbulb_outline_rounded),
            ],
          ),
        )
      ],
    ));
  }
}

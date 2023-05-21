import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:gap/gap.dart';
import 'package:workout/screen/about_us_screen.dart';
import 'package:workout/screen/calculators_screen.dart';
import 'package:workout/screen/care_plans_screen.dart';
import 'package:workout/screen/edit_profile_screen.dart';
import 'package:workout/screen/main/favorite_plans_screen.dart';
import 'package:workout/screen/manage_subscription_screen.dart';
import 'package:workout/screen/measures_screen.dart';
import 'package:workout/screen/main/settings_screen.dart';
import 'package:workout/screen/statistics_screen.dart';

import '../../model/menu_item_model.dart';
import '../../res/colors.dart';
import '../../widgets/menu_item.dart' as menItem;
import '../settings_screens/google_fit_setting_screen.dart';
import '../settings_screens/guide_setting_screen.dart';
import '../settings_screens/theme_setting_screen.dart';
import '../settings_screens/units_setting_screen.dart';
import '../settings_screens/workout_setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _buildListTile(Function function, IconData icon, double size,
      String title, bool enabled) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            function();
          },
          child: ListTile(
            title: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                if (enabled) const Spacer(),
                if (enabled)
                  const Text(
                    'soon',
                    style: TextStyle(
                        color: MyColors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
              ],
            ),
            // dense: true,
            horizontalTitleGap: 0,
            minLeadingWidth: 35,
            contentPadding: const EdgeInsets.only(right: 45, left: 45),
            leading: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            trailing: const Icon(
              Icons.arrow_right,
              color: MyColors.mainColor,
            ),
          ),
        ),
        // const Divider(
        //   indent: 50,
        //   endIndent: 50,
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        //****** AppBar
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(size.height / 25),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: size.height / 10,
              width: size.width,
              decoration: BoxDecoration(
                //color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: MyColors.mainColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    PopupMenuButton<ProfileMenuItemModel>(
                      color: Theme.of(context).primaryColorDark,
                      icon: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          //TODO: image place holder
                          color: MyColors.grey,
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Image.asset(
                            'assets/images/jonah.jpeg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      iconSize: MediaQuery.of(context).size.height / 22,
                      offset: const Offset(-30, 30),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onSelected: (item) => onSelected(context, item),
                      itemBuilder: ((context) => [
                            ...menItem.MenuItem.firstItems
                                .map(buildItem)
                                .toList(),
                            //PopupMenuDivider(),
                            ...menItem.MenuItem.secondItems
                                .map(buildItem)
                                .toList(),
                            //PopupMenuDivider(),
                            ...menItem.MenuItem.thirdItems
                                .map(buildItem)
                                .toList(),
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            'Dashboard',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const Gap(16),
                        _buildListTile(
                          () {
                            Navigator.of(context).pushNamed(
                              FavoritePlansScreen.routeName,
                            );
                          },
                          Icons.collections_bookmark_rounded,
                          20,
                          'Favorite Plans',
                          false,
                        ),
                        const Divider(
                          indent: 50,
                          endIndent: 50,
                        ),
                        _buildListTile(
                          () {
                            Navigator.of(context)
                                .pushNamed(CarePlansScreen.routeName);
                          },
                          flu.FluentIcons.care_plan,
                          20,
                          'Care Plan',
                          true,
                        ),
                        const Divider(
                          indent: 50,
                          endIndent: 50,
                        ),
                        _buildListTile(
                          () {
                            Navigator.of(context).pushNamed(
                              CalculatorsScreen.routeName,
                            );
                          },
                          flu.FluentIcons.calculator,
                          20,
                          'Calculators',
                          false,
                        ),
                        const Divider(
                          indent: 50,
                          endIndent: 50,
                        ),
                        _buildListTile(
                          () {
                            Navigator.of(context).pushNamed(
                              MeasuresScreen.routeName,
                            );
                          },
                          Icons.accessibility,
                          22,
                          'Measures',
                          false,
                        ),
                        const Divider(
                          indent: 50,
                          endIndent: 50,
                        ),
                        _buildListTile(
                          () {
                            Navigator.of(context).pushNamed(
                              StatisticsScreen.routeName,
                            );
                          },
                          Icons.show_chart,
                          22,
                          'Statistics',
                          true,
                        ),
                      ],
                    ),
                  ),

                  // settings column
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const Gap(16),
                        _buildListTile(() {
                          Navigator.of(context)
                              .pushNamed(WorkoutSettingScreen.routeName);
                        }, Icons.fitness_center_outlined, 20, 'Workout', false),
                        const Divider(indent: 50, endIndent: 50),
                        _buildListTile(() {
                          Navigator.of(context)
                              .pushNamed(UnitsSettingScreen.routeName);
                        }, Icons.straighten_rounded, 20, 'Units', false),
                        const Divider(indent: 50, endIndent: 50),
                        _buildListTile(() {
                          Navigator.of(context)
                              .pushNamed(GuideSettingScreen.routeName);
                        }, Icons.lightbulb_outline_rounded, 22, 'Guide', false),
                        const Divider(indent: 50, endIndent: 50),
                        _buildListTile(() {
                          Navigator.of(context)
                              .pushNamed(ThemeSettingScreen.routeName);
                        }, Icons.dark_mode, 22, 'Theme', false),
                        const Divider(indent: 50, endIndent: 50),
                        _buildListTile(() {
                          Navigator.of(context)
                              .pushNamed(GoogleFitSettingScreen.routeName);
                        }, Icons.link, 22, 'Google Fit', false),
                        const Divider(indent: 50, endIndent: 50),
                        _buildListTile(
                            () {}, Icons.mail, 22, 'Invite Friend', false),
                        const Divider(indent: 50, endIndent: 50),
                        _buildListTile(() {}, Icons.star, 22, 'Rate Us', false),
                        const Divider(indent: 50, endIndent: 50),
                        _buildListTile(
                            () {}, Icons.create, 22, 'Feedback', false),
                        const Divider(
                          indent: 50,
                          endIndent: 50,
                        ),
                        _buildListTile(
                          () {},
                          Icons.bug_report,
                          22,
                          'Report Bugs',
                          false,
                        ),
                        const Divider(
                          indent: 50,
                          endIndent: 50,
                        ),
                        _buildListTile(
                          () {},
                          Icons.info_outline_rounded,
                          22,
                          'About '
                          'Us',
                          false,
                        ),
                        //TODO: create another one for terms
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class PopUpMen extends StatefulWidget {
//   PopUpMen({Key? key, required this.menuList, this.icon}) : super(key: key);

//   final List<PopupMenuEntry> menuList;
//   final Widget? icon;

//   @override
//   State<PopUpMen> createState() => _PopUpMenState();
// }

// class _PopUpMenState extends State<PopUpMen> {
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//       itemBuilder: ((context) => widget.menuList),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       icon: widget.icon,
//       iconSize: MediaQuery.of(context).size.height / 22,
//       offset: Offset(-30, 30),
//       elevation: 0,
//     );
//   }
// }

PopupMenuItem<ProfileMenuItemModel> buildItem(ProfileMenuItemModel item) =>
    PopupMenuItem<ProfileMenuItemModel>(
      value: item,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 5, right: 5),
        horizontalTitleGap: 0,
        leading: Icon(
          item.icon,
          color: item.iconColor,
        ),
        title: Text(
          item.text,
          style: const TextStyle(
              color: Color(0xff2e2e2e),
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ),
      ),
    );

PopupMenuItem<ProfileMenuItemModel> buildItem2(ProfileMenuItemModel item) =>
    PopupMenuItem<ProfileMenuItemModel>(
      value: item,
      child: Text(
        item.text,
      ),
    );

void onSelected(BuildContext context, ProfileMenuItemModel item) {
  switch (item) {
    case menItem.MenuItem.itemEditProfile:
      Navigator.of(context).pushNamed(EditProfileScreen.routName);
      break;
    case menItem.MenuItem.itemSettings:
      Navigator.of(context).pushNamed(SettingsScreen.routeName);
      break;
    case menItem.MenuItem.itemManageSubscription:
      Navigator.of(context).pushNamed(ManageSubscriptionScreen.routeName);
      break;
    case menItem.MenuItem.itemAboutUs:
      Navigator.of(context).pushNamed(AboutUsScreen.routeName);
      break;
  }
}

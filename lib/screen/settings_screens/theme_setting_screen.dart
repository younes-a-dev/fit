import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:workout/theme/config.dart';


class ThemeSettingScreen extends StatelessWidget {
  const ThemeSettingScreen({Key? key}) : super(key: key);

  static const routeName = '/setting screen --> Theme Setting screen';

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
                  'Choose Theme',
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
          ListTile(
            horizontalTitleGap: 0,
            minLeadingWidth: 35,
            contentPadding: const EdgeInsets.only(left: 35, right: 35),
            title: Text(
              'Dark Theme',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            leading:  Icon(
              Icons.dark_mode,
              color: Theme.of(context).primaryColor,
            ),
            trailing: Switch(
              activeColor: Colors.yellow,
              value: currentTheme.themeMode,
              onChanged: (value) {
                currentTheme.toggleTheme();
              },
            ),
          ),
        ],
      ),
    );
  }
}

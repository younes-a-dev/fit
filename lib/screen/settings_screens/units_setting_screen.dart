import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:toggle_switch/toggle_switch.dart' as ts;

import '../../res/colors.dart';

class UnitsSettingScreen extends StatelessWidget {
  const UnitsSettingScreen({Key? key}) : super(key: key);

  static const routeName = '/Setting Screen --> Units settings screen';

  Widget _buildToggleSwitch(BuildContext context, String title,
      String firstLabel, String secondLabel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: MyColors.grey, fontSize: 17),
        ),
        const Gap(15),
        ts.ToggleSwitch(
          minWidth: MediaQuery.of(context).size.width / 2,
          minHeight: 50.0,
          fontSize: 16.0,
          initialLabelIndex: 1,
          activeBgColor: const  [MyColors.mainColor],
          activeFgColor: MyColors.black,
          inactiveBgColor: Theme.of(context).primaryColorDark,
          inactiveFgColor: MyColors.grey,
          totalSwitches: 2,
          labels: [firstLabel, secondLabel],
          onToggle: (index) {
            print('switched to: $index');
          },
        ),
      ],
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
                  'Select Units',
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
              _buildToggleSwitch(context, 'Weight', 'kg', 'lbs'),
              const Gap(35),
              _buildToggleSwitch(context, 'Body Measurements', 'cm', 'in')
            ],
          )
        ],
      ),
    );
  }
}

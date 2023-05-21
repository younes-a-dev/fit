import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:workout/screen/calculator_screens/body_mass_index_screen.dart';
import 'package:workout/screen/calculator_screens/calories_burned_screen.dart';
import 'package:workout/screen/calculator_screens/daily_calorie_calculator_screen.dart';

import '../res/colors.dart';
import '../widgets/app_bar_widget.dart';
import 'calculator_screens/body_fat_percentage_screen.dart';

class CalculatorsScreen extends StatelessWidget {
  const CalculatorsScreen({Key? key}) : super(key: key);

  static const routeName = '/ProfileScreen --> Calculators Screen ';

  Widget _buildListItem(BuildContext context, Function function, String text) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            function();
          },
          child: ListTile(
            title: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            contentPadding: const EdgeInsets.only(right: 35, left: 35),
            trailing: const Icon(
              Icons.arrow_right,
              color: MyColors.mainColor,
            ),
          ),
        ),
        const Divider(
          endIndent: 35,
          indent: 35,
          color:MyColors.grey,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidget(title: 'Calculators',),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(30),
          Column(
            children: [
              _buildListItem(
                context,
                () {
                  Navigator.of(context)
                      .pushNamed(BodyMassIndexScreen.routeName);
                },
                'Body Mass Index (BMI)',
              ),
              _buildListItem(
                context,
                () {
                  Navigator.of(context)
                      .pushNamed(BodyFatPercentageScreen.routeName);
                },
                'Body Fat Percentage',
              ),
              _buildListItem(
                context,
                () {
                  Navigator.of(context)
                      .pushNamed(CaloriesBurnedScreen.routeName);
                },
                'Calories Burned',
              ),
              _buildListItem(
                context,
                () {
                  Navigator.of(context)
                      .pushNamed(DailyCalorieCalculatorScreen.routeName);
                },
                'Daily Calorie Calculator',
              ),
            ],
          )
        ],
      ),
    );
  }
}

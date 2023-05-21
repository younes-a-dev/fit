import 'package:flutter/material.dart';

import 'package:readmore/readmore.dart';
import 'package:gap/gap.dart';
import 'package:toggle_switch/toggle_switch.dart' as ts;
import 'package:workout/widgets/custom_textfield_widget.dart';
import '../../res/colors.dart';
import '../../widgets/app_bar_widget.dart';

class DailyCalorieCalculatorScreen extends StatefulWidget {
  DailyCalorieCalculatorScreen({Key? key}) : super(key: key);

  static const routeName =
      '/Calculators screen --> Daily Calorie Calculators Screen';

  @override
  State<DailyCalorieCalculatorScreen> createState() =>
      _DailyCalorieCalculatorScreenState();
}

class _DailyCalorieCalculatorScreenState
    extends State<DailyCalorieCalculatorScreen> {
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  double _calorieNeedsValue = 0;
  int _genderValue = 0;
  int _activityLevel = 0;

  void calculateDailyCalorieNeed() {
    double bmr = 0;
    double calorieNeeds = 0;
    if (_genderValue == 0) {
      bmr = 66.5 +
          (13.75 * double.parse(_weightController.text)) +
          (5.003 * double.parse(_heightController.text)) -
          (6.75 * int.parse(_ageController.text));
    } else {
      bmr = 655.1 +
          (9.563 * double.parse(_weightController.text)) +
          (1.850 * double.parse(_heightController.text)) -
          (4.676 * int.parse(_ageController.text));
    }
    if (_activityLevel == 0) {
      calorieNeeds = bmr * 1.2;
    } else if (_activityLevel == 1) {
      calorieNeeds = bmr * 1.375;
    } else if (_activityLevel == 2) {
      calorieNeeds = bmr * 1.55;
    } else if (_activityLevel == 3) {
      calorieNeeds = bmr * 1.725;
    } else if (_activityLevel == 4) {
      calorieNeeds = bmr * 1.9;
    }
    _calorieNeedsValue = calorieNeeds;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const AppBarWidget(title: 'Daily Calorie Calculator'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(5),
                  Text(
                    'CALCULATE YOUR CALORIC NEEDS :',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(5),
                  const ReadMoreText(
                    '''The daily calorie intake calculator will help you calculate the number of calories you should consume in line with your goals. If your goal is to lose weight, calculate the number of calories you should consume by selecting the weight loss section. If your goal is to build muscle, choose the muscle building part.''',
                    textAlign: TextAlign.start,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    colorClickableText: Colors.blueAccent,
                    trimCollapsedText: 'more',
                    trimExpandedText: 'less',
                    style: TextStyle(
                      color: MyColors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Gender',
                        style: TextStyle(color: MyColors.grey, fontSize: 17),
                      ),
                      const Gap(15),
                      Align(
                        alignment: Alignment.center,
                        child: ts.ToggleSwitch(
                          //minWidth: MediaQuery.of(context).size.width / 2,
                          //minHeight: 60.0,
                          customHeights: const [75, 75],
                          isVertical: true,
                          fontSize: 16.0,
                          initialLabelIndex: _genderValue,
                          activeBgColor: const [MyColors.mainColor],
                          activeFgColor: MyColors.black,
                          inactiveBgColor: Theme.of(context).primaryColorDark,
                          inactiveFgColor: MyColors.grey,
                          totalSwitches: 2,
                          labels: const ['Male', 'Female'],
                          onToggle: (index) {
                            //print('switched to: $index');
                            _genderValue = index!;
                          },
                        ),
                      ),
                    ],
                  ),
                  // Column(
                  //   //crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     const Text(
                  //       'Goal',
                  //       style: TextStyle(color: Colors.grey, fontSize: 17),
                  //     ),
                  //     const Gap(15),
                  //     Align(
                  //       alignment: Alignment.center,
                  //       child: ts.ToggleSwitch(
                  //         minWidth: MediaQuery.of(context).size.width / 3,
                  //         //minHeight: 50.0,
                  //         customHeights: const [40, 40, 40],
                  //         fontSize: 16.0,
                  //         isVertical: true,
                  //         initialLabelIndex: _goalValue,
                  //         activeBgColor: const [Colors.yellow],
                  //         activeFgColor: Colors.black,
                  //         inactiveBgColor: const Color(0xfff5f5f5),
                  //         inactiveFgColor: Colors.grey,
                  //         totalSwitches: 3,
                  //         labels: const [
                  //           'Fat Loss',
                  //           'Maintenance',
                  //           'Muscle Gain'
                  //         ],
                  //         onToggle: (index) {
                  //           //print('switched to: $index');
                  //           _goalValue = index!;
                  //           print('Units Value is $_goalValue');
                  //         },
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Column(
                    children: [
                      const Text(
                        'Activity Level',
                        style: TextStyle(color: MyColors.grey, fontSize: 17),
                      ),
                      const Gap(15),
                      Align(
                        alignment: Alignment.center,
                        child: ts.ToggleSwitch(
                          minWidth: MediaQuery.of(context).size.width / 2,
                          //minHeight: 50.0,
                          customHeights: const [30, 30, 30, 30, 30],
                          fontSize: 16.0,
                          initialLabelIndex: _activityLevel,
                          activeBgColor: const [MyColors.mainColor],
                          activeFgColor: MyColors.black,
                          inactiveBgColor: Theme.of(context).primaryColorDark,
                          inactiveFgColor: MyColors.grey,
                          totalSwitches: 5,
                          labels: const [
                            'Sedentary',
                            'Lightly Active',
                            'Moderately Active',
                            'Very Active',
                            'Extra Active',
                          ],
                          isVertical: true,
                          onToggle: (index) {
                            //print('switched to: $index');
                            _activityLevel = index!;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(30),
            CustomTextFieldWidget(
              controller: _ageController,
              hintText: 'Age',
            ),
            const Gap(20),
            CustomTextFieldWidget(
              controller: _weightController,
              hintText: 'Weight (kg)',
            ),
            const Gap(20),
            CustomTextFieldWidget(
              controller: _heightController,
              hintText: 'Height (cm)',
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        calculateDailyCalorieNeed();
                      });
                    },
                    style: ButtonStyle(
                      maximumSize: MaterialStatePropertyAll(
                        Size(size.width / 3.5, 40),
                      ),
                    ),
                    child: const Text('Calculator'),
                  ),
                  Text(
                    'TARGET DAILY CALORIC INTAKE : ${_calorieNeedsValue.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: MyColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(15),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25, left: 15, right: 15, bottom: 20),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'UNDERSTANDING CALORIC NEEDS :',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(5),
                      const ReadMoreText(
                        '''A calorie is a unit of energy. This power that the body needs to move and maintain its temperature is called energy. The nutrients we take into our body turn into energy, but after meeting the energy need,the excess calories turn into fat molecules and cause the body to fat.\n\nThe essential nutrients our body needs to produce energy; Protein, Carbohydrate, Fat\n\nEnergy = Cal – Kcal\n1 gr. Carbohydrate = 4 calories\n1 gr. Protein = 4 calories\n1 gr. Fat = 9calories\n7700 Calorie = 1Kg\n\n7700 calories is equivalent to 1 kilogram. If you consume 7700 calories, you will gain 1 kilogram. If you spend 7700 calories, you will lose 1 kilogram.\n''',
                        textAlign: TextAlign.start,
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        colorClickableText: Colors.blueAccent,
                        trimCollapsedText: 'more',
                        trimExpandedText: 'less',
                        style: TextStyle(
                          color: MyColors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(15),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25, left: 15, right: 15, bottom: 20),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Calories In Common Fruits',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(10),
                          const Divider(
                            color: MyColors.mainColor,
                          ),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Food',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Divider(),
                                  const Text(
                                    'Apple',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Divider(),
                                  const Text(
                                    'Banana',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Divider(),
                                  const Text(
                                    'Orange',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Divider(),
                                  const Text(
                                    'Strawberry',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children:  [
                                  Text(
                                    'SIZE',
                                    style: TextStyle(
                                      color:Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Divider(),
                                  const   Text(
                                    '1 small',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const  Divider(),
                                  const  Text(
                                    '1 medium',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const  Divider(),
                                  const  Text(
                                    '1',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const  Divider(),
                                  const  Text(
                                    '1 cup',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children:  [
                                  Text(
                                    'CALORIES',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Divider(),
                                  const Text(
                                    '80',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Divider(),
                                  const  Text(
                                    '101',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const  Divider(),
                                  const  Text(
                                    '71',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const  Divider(),
                                  const  Text(
                                    '53',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Gap(25),
                      const Divider(color: MyColors.mainColor),
                      const Gap(10),

                      // table 2
                      Column(
                        children: [
                           Text(
                            'Calories In Common Vegetable',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(10),
                          const Divider(color: MyColors.mainColor),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    'Food',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Divider(),
                                  const Text(
                                    'Broccoli',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Divider(),
                                  const Text(
                                    'Carrots',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Divider(),
                                  const Text(
                                    'Eggplant',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Divider(),
                                  const Text(
                                    'Lettuce',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children:  [
                                  Text(
                                    'SIZE',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                const  Divider(),
                                const  Text(
                                    '1 cup',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                const  Divider(),
                                const  Text(
                                    '1 cup',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '1 cup',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '1 cup',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children:  [
                                  Text(
                                    'CALORIES',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '40',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '45',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '38',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '7',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Gap(25),
                      const Divider(
                        color: MyColors.mainColor,
                      ),
                      const Gap(10),

                      // table 3
                      Column(
                        children: [
                           Text(
                            'Calories In Common Foods',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(10),
                          const Divider(color: MyColors.mainColor),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    'Food',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                const  Divider(),
                                const  Text(
                                    'Bread',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    'Beef',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    'Egg',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    'Pizza',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    'Hamburger',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children:  [
                                  Text(
                                    'SIZE',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '1 slice',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '1 slice',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    'large',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '1 slice',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '1',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children:  [
                                  Text(
                                    'CALORIES',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '75',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '120',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '79',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '180',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '280',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Gap(25),
                      const Divider(color: MyColors.mainColor),
                      const Gap(10),

                      // table 4
                      Column(
                        children: [
                           Text(
                            'Calories In Common Beverages',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(10),
                          const Divider(color: MyColors.mainColor),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    'Food',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    'Coca-cola',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    'Diet Coke',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    'Milk, low-fat',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    'Milk',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    'Orange Juice',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children:  [
                                  Text(
                                    'SIZE',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '1cup',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '1cup',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '1cup',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '1cup',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '1cup',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children:  [
                                  Text(
                                    'CALORIES',
                                    style: TextStyle(
                                      color:Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Divider(),
                                  const Text(
                                    '97',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '3',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '104',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '150',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                 const Divider(),
                                 const Text(
                                    '115',
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

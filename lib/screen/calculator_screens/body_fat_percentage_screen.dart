import 'package:flutter/material.dart';
import 'dart:math';

import 'package:toggle_switch/toggle_switch.dart' as ts;
import 'package:gap/gap.dart';
import 'package:workout/widgets/custom_textfield_widget.dart';

import '../../res/colors.dart';
import '../../widgets/app_bar_widget.dart';

class BodyFatPercentageScreen extends StatefulWidget {
  const BodyFatPercentageScreen({Key? key}) : super(key: key);

  static const routeName = '/Calculators screen --> Body Fat Percentage Screen';

  @override
  State<BodyFatPercentageScreen> createState() =>
      _BodyFatPercentageScreenState();
}

class _BodyFatPercentageScreenState extends State<BodyFatPercentageScreen> {
  //final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _waistCircumferenceController = TextEditingController();
  final _neckCircumferenceController = TextEditingController();
  final _hipCircumferenceController = TextEditingController();

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _waistCircumferenceController.dispose();
    _neckCircumferenceController.dispose();
    _hipCircumferenceController.dispose();
    super.dispose();
  }

  ///// BODY FAT FORMULA:
  // For men, (cm)
  // 100 x ((4.95 / (1.0324 - 0.19077 * log10(waist - neck) + 0.15456 * log10(height))) - 4.5)
  //
  // For women, (cm)
  // 100 x ((4.95 / (1.29579 - 0.35004 * log10(waist + hip - neck) + 0.22100 * log10(height))) - 4.5)

  // For men, (in)
  // (86.010 * log10( waist – neck ) ) – [70.041 * log10(height)) + 36.76
  //
  // For women, (in)
  // 163.205 x log10(waist + hip - neck) - 97.684 x log10(height)- 78.387.

  double _bfpScore = 0;

  // TODO: Change Value to enums (its work but enum is better)
  // 0 for male & 1 for female
  int _genderValue = 0;

  // 0 for (cm), 1 for (in)
  int _unitsValue = 0;

  double logBase(num x, num base) => log(x) / log(base);

  double log10(num x) => log(x) / ln10;

  void calculateBfp() {
    if (_genderValue == 0 && _unitsValue == 0) {
      _bfpScore = 100 *
          ((4.95 /
                  (1.0324 -
                      0.19077 *
                          log10(double.parse(
                                  _waistCircumferenceController.text) -
                              double.parse(_neckCircumferenceController.text)) +
                      0.15456 * log10(double.parse(_heightController.text)))) -
              4.5);
    } else if (_genderValue == 0 && _unitsValue == 1) {
      _bfpScore = (86.010 *
              log10(double.parse(_waistCircumferenceController.text) -
                  double.parse(_neckCircumferenceController.text))) -
          (70.041 * log10(double.parse(_heightController.text))) +
          36.76;
    } else if (_genderValue == 1 && _unitsValue == 0) {
      _bfpScore = 100 *
          ((4.95 /
                  (1.29579 -
                      0.35004 *
                          log10(double.parse(
                                  _waistCircumferenceController.text) +
                              double.parse(_hipCircumferenceController.text) -
                              double.parse(_neckCircumferenceController.text)) +
                      0.22100 * log10(double.parse(_heightController.text)))) -
              4.5);
    } else if (_genderValue == 1 && _unitsValue == 1) {
      _bfpScore = 163.205 *
              log10(double.parse(_waistCircumferenceController.text) +
                  double.parse(_hipCircumferenceController.text) -
                  double.parse(_neckCircumferenceController.text)) -
          97.684 * log10(double.parse(_heightController.text)) -
          78.387;
    }

    // female (inch)
    // _bfpScore = 163.205 * log10(double.parse(_waistCircumferenceController
    //     .text) + double.parse(_hipCircumferenceController.text) - double
    //     .parse(_neckCircumferenceController.text)) - 97.684 * log10(double
    //     .parse(_heightController.text))- 78.387;

    // female (cm)
    // _bfpScore = 100 *
    //     ((4.95 /
    //             (1.29579 -
    //                 0.35004 *
    //                     log10(double.parse(_waistCircumferenceController.text) +
    //                         double.parse(_hipCircumferenceController.text) -
    //                         double.parse(_neckCircumferenceController.text)) +
    //                 0.22100 * log10(double.parse(_heightController.text)))) -
    //         4.5);

    // male (cm)
    // _bfpScore = 100*((4.95 / (1.0324 - 0.19077 * log10(double.parse
    //   (_waistCircumferenceController.text) - double.parse
    //   (_neckCircumferenceController.text)) + 0.15456 * log10
    //   (double.parse(_heightController.text)))) - 4.5);

    // male (inch)
    // _bfpScore = (86.010 * log10(double.parse(_waistCircumferenceController
    //     .text)- double.parse(_neckCircumferenceController.text))) - (70.041 *
    //     log10(double.parse(_heightController.text))) + 36.76;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const AppBarWidget(title: 'Body Fat Percentage'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Gender',
                        style: TextStyle(color: MyColors.grey, fontSize: 17),
                      ),
                      const Gap(10),
                      Align(
                        alignment: Alignment.center,
                        child: ts.ToggleSwitch(
                          minWidth: MediaQuery.of(context).size.width / 2 - 50,
                          minHeight: 40.0,
                          fontSize: 16.0,
                          customWidths: [size.width / 5, size.width / 5],
                          initialLabelIndex: _genderValue,
                          activeBgColor: const [MyColors.mainColor],
                          activeFgColor: MyColors.black,
                          inactiveBgColor: Theme.of(context).primaryColorDark,
                          inactiveFgColor: MyColors.grey,
                          totalSwitches: 2,
                          labels: const ['Male', 'Female'],
                          onToggle: (index) {
                            _genderValue = index!;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Units',
                        style: TextStyle(color: MyColors.grey, fontSize: 17),
                      ),
                      const Gap(10),
                      Align(
                        alignment: Alignment.center,
                        child: ts.ToggleSwitch(
                          minWidth: MediaQuery.of(context).size.width / 2 - 50,
                          customWidths: [size.width / 5, size.width / 5],
                          minHeight: 40.0,
                          fontSize: 16.0,
                          initialLabelIndex: _unitsValue,
                          activeBgColor: const [MyColors.mainColor],
                          activeFgColor: MyColors.black,
                          inactiveBgColor: Theme.of(context).primaryColorDark,
                          inactiveFgColor: MyColors.grey,
                          totalSwitches: 2,
                          labels: const ['cm', 'in'],
                          onToggle: (index) {
                            _unitsValue = index!;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
            CustomTextFieldWidget(
              controller: _waistCircumferenceController,
              hintText: 'Waist Circumference (cm)',
            ),
            const Gap(20),
            CustomTextFieldWidget(
              controller: _neckCircumferenceController,
              hintText: 'Neck Circumference (cm)',
            ),
            const Gap(20),

            //TODO: if male note show
            CustomTextFieldWidget(
              controller: _hipCircumferenceController,
              hintText: 'Hip Circumference (cm)',
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
                        calculateBfp();
                      });
                    },
                    style: ButtonStyle(
                      maximumSize: MaterialStatePropertyAll(
                        Size(size.width / 3, 40),
                      ),
                    ),
                    child: const Text('Calculate'),
                  ),
                  Text(
                    'You\'re BFP Is : ${_bfpScore.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: MyColors.grey),
                  )
                ],
              ),
            ),
            const Gap(20),

            //TODO: change columns to one Widget
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25, left: 15, right: 15, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CLASSIFICATION',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            'Essential Fat',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            'Athletes',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            'Fitness',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            'Acceptable',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            'Obese',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const VerticalDivider(),
                      Column(
                        children: [
                          Text(
                            'MEN (% FAT)',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            '2-5 %',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            '6-13 %',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            '14-17 %',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            '18-25 %',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            '25+ %',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const VerticalDivider(

                      ),
                      Column(
                        children: [
                          Text(
                            'WOMAN (% FAT)',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            '10-13 %',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            '14-20 %',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            '21-24 %',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            '25-31 %',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            '32+ %',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
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

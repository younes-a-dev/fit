import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../res/colors.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/custom_textfield_widget.dart';


class BodyMassIndexScreen extends StatefulWidget {
  const BodyMassIndexScreen({Key? key}) : super(key: key);

  static const routeName = '/Calculators screen --> Body Mass Index Screen';

  @override
  State<BodyMassIndexScreen> createState() => _BodyMassIndexScreenState();
}

class _BodyMassIndexScreenState extends State<BodyMassIndexScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  // int _gender = 0;
  // int _height = 150;
  // int _age = 30;
  // int _weight = 50;
  // bool _isFinished = false;
  double _bmiScore = 0;

  Widget _buildBmiDescription(String title, String text) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              const Icon(
                Icons.arrow_forward_rounded,
                size: 18,
                color: MyColors.mainColor,
              ),
              const Gap(5),
              Text(
                title,
                style:  TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const Gap(2),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 10,
            bottom: 10,
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: MyColors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  void calculateBmi() {
    _bmiScore = int.parse(_weightController.text) /
        pow(int.parse(_heightController.text) / 100, 2);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: const AppBarWidget(title: 'Body Mass Index'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            CustomTextFieldWidget(
              hintText: 'Height (cm)',
              controller: _heightController,
            ),
            const Gap(10),
            CustomTextFieldWidget(
              hintText: 'Weight (kg)',
              controller: _weightController,
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        calculateBmi();
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
                    'You\'re BMI Is : ${_bmiScore.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 16,
                        color: MyColors.grey,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const Gap(20),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 10,
                      right: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBmiDescription(
                          'If your BMI is below 18.5 :',
                          '''Your BMI is considered underweight Keep in mind that an underweight BMI calculation may pose certain health risks. Please consult your health care provider for more information about BMI calculations.''',
                        ),
                        const Divider(),
                        _buildBmiDescription(
                          'If your BMI is between 18.5 – 24.9:',
                          '''Your BMI is considered normal. This healthy weight helps reduce your risk of serious health conditions and means you’re close to your fitness goals.''',
                        ),
                        const Divider(),
                        _buildBmiDescription(
                          'If your BMI is between 25 – '
                              '29.9:',
                          '''You’re in the overweight range. You are at increased risk for a variety of illnesses at your present weight. You should lose weight by changing your diet and exercising more.''',
                        ),
                        const Divider(),
                        _buildBmiDescription(
                          'If your BMI is above 30:',
                          '''Your BMI is considered overweight. Being overweight may increase your risk of cardiovascular disease. Consider making lifestyle changes through healthy eating and fitness to improve your health.''',
                        ),
                        const Divider(),
                        _buildBmiDescription(
                          'Notice:',
                          '''Individuals who fall into the BMI range of 25 to 34.9, and have a waist size of over 40 inches for men and 35 inches for women, are considered to be at especially high risk for health problems.''',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Container(
        //         margin: EdgeInsets.all(35),
        //         padding: EdgeInsets.only(top: 30, bottom: 30),
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(16),
        //         ),
        //         child: Column(
        //           children: [
        //             Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: GenderWidget(
        //                 onChange: (genderValue) {
        //                   _gender = genderValue;
        //                 },
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       const Gap(30),
        //       HeightWidget(
        //         onChange: (heightValue) {
        //           _height = heightValue;
        //         },
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           AgeWeightWidget(
        //             onChange: (ageVal) {
        //               _age = ageVal;
        //             },
        //             title: 'Age',
        //             initValue: 30,
        //             min: 0,
        //             max: 100,
        //           ),
        //           AgeWeightWidget(
        //             onChange: (weightVal) {
        //               _weight = weightVal;
        //             },
        //             title: 'Weight',
        //             initValue: 50,
        //             min: 0,
        //             max: 200,
        //           )
        //         ],
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(35.0),
        //         child: SwipeableButtonView(
        //             isFinished: _isFinished,
        //             onFinish: () async {
        //               await Navigator.of(context)
        //                   .pushNamed(BmiScoreScreen.routeName, arguments: {
        //                 'bmiScore': _bmiScore,
        //                 '_age': _age,
        //               });
        //
        //               setState(() {
        //                 _isFinished = false;
        //               });
        //             },
        //             onWaitingProcess: () {
        //               // TODO Calculate BMI here
        //               calculateBmi();
        //               Future.delayed(Duration(seconds: 1), () {
        //                 setState(() {
        //                   _isFinished = true;
        //                 });
        //               });
        //             },
        //             activeColor: Colors.grey,
        //             buttonWidget: const Icon(
        //               Icons.arrow_forward_ios_rounded,
        //               color: Colors.yellow,
        //             ),
        //             buttonText: 'CALCULATE'),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }

// void calculateBmi() {
//   _bmiScore = _weight / pow(_height / 100, 2);
// }
}

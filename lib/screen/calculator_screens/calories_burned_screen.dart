import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:toggle_switch/toggle_switch.dart' as ts;
import 'package:workout/widgets/custom_textfield_widget.dart';
import '../../res/colors.dart';
import '../../widgets/app_bar_widget.dart';

class CaloriesBurnedScreen extends StatefulWidget {
  CaloriesBurnedScreen({Key? key}) : super(key: key);

  static const routeName = '/Calculators screen --> Calories Burned screen';

  @override
  State<CaloriesBurnedScreen> createState() => _CaloriesBurnedScreenState();
}

class _CaloriesBurnedScreenState extends State<CaloriesBurnedScreen> {
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _heartRateController = TextEditingController();
  final _exerciseDurationController = TextEditingController();
  final _vo2MaxController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    _weightController.dispose();
    _heartRateController.dispose();
    _exerciseDurationController.dispose();
    _exerciseDurationController.dispose();
    _vo2MaxController.dispose();
    super.dispose();
  }

  double _cbScore = 0;
  int _genderValue = 0;
  int _vo2MaxValue = 0;

  // If VO2 max is unknown, the following formulas would apply:
  //
  // Women:
  //
  // CB = T * (0.4472*H - 0.1263*W + 0.074*A - 20.4022) / 4.184
  //
  // Men:
  //
  // CB = T * (0.6309*H + 0.1988*W + 0.2017*A - 55.0969) / 4.184
  //
  // T is the duration of exercise in minutes;
  // H is your average heart rate in beats per minute;
  // W is your weight in kilograms; and
  // A is your age in years.

  //-------------------------------------------------------------------------

  //TODO: check VO2 max formula
  // If your VO2 max is known, the following formulas would apply:
  //
  // Women:
  //
  // CB = T * (0.45*H + 0.380*V + 0.103*W + 0.274*A - 59.3954) / 4.184
  //
  // Men:
  //
  // CB = T * (0.634*H + 0.404*V + 0.394*W + 0.271*A - 95.7735) / 4.184
  //
  // Where:
  //
  // CB is the number of calories burned;
  // T is the duration of exercise in minutes;
  // H is your average heart rate in beats per minute;
  // V is your maximum rate of oxygen consumption, VO2 max, in ml/kg/min;
  // W is your weight in kilograms; and
  // A is your age in years.

  // cb: calories burned
  void calculateCb() {
    // VO2 max is UnKnown:
    // female
    if (_genderValue == 1 && _vo2MaxValue == 1) {
      _cbScore = double.parse(_exerciseDurationController.text) *
          (0.4472 * (double.parse(_heartRateController.text)) -
              0.1263 * (double.parse(_weightController.text)) +
              0.074 * (double.parse(_ageController.text)) -
              20.4022) /
          4.184;
    } else if (_genderValue == 0 && _vo2MaxValue == 1) {
      //male:
      _cbScore = double.parse(_exerciseDurationController.text) *
          (0.6309 * (double.parse(_heartRateController.text)) +
              0.1988 * (double.parse(_weightController.text)) +
              0.2017 * (double.parse(_ageController.text)) -
              55.0969) /
          4.184;
      //TODO: fix formula when vo2 max is known (result is incorrect)
      // VO2 max is known:
    } else if (_genderValue == 1 && _vo2MaxValue == 0) {
      //female:
      // CB = T * (0.45*H + 0.380*V + 0.103*W + 0.274*A - 59.3954) / 4.184
      _cbScore = double.parse(_exerciseDurationController.text) *
          (0.45 * (double.parse(_heartRateController.text)) +
              0.380 * (double.parse(_vo2MaxController.text)) +
              0.103 *
                  (double.parse(_weightController.text) +
                      0.274 * (double.parse(_ageController.text))) -
              59.3954) /
          4.184;
    } else if (_genderValue == 0 && _vo2MaxValue == 0) {
      //male:
      // CB = T * (0.634*H + 0.404*V + 0.394*W + 0.271*A - 95.7735) / 4.184
      _cbScore = double.parse(_exerciseDurationController.text) *
          (0.634 * (double.parse(_heartRateController.text)) +
              0.404 * (double.parse(_vo2MaxController.text)) +
              0.394 *
                  (double.parse(_weightController.text) +
                      0.271 * (double.parse(_ageController.text))) -
              95.7735) /
          4.184;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const AppBarWidget(title: 'Calorie Burned'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(0),
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Text(
                '''Burning more calories become easier with a better knowledge of the connection between the heart rate and the metabolism process.''',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyColors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ),
            const Gap(5),
            const Divider(indent: 30, endIndent: 30),
            const Gap(5),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
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
                          // minWidth: MediaQuery.of(context).size.width / 2,
                          customWidths: [size.width / 6, size.width / 6],
                          minHeight: 40.0,
                          fontSize: 16.0,
                          initialLabelIndex: _genderValue,
                          activeBgColor: const  [MyColors.mainColor],
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
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Vo2 Max',
                        style: TextStyle(color: MyColors.grey, fontSize: 17),
                      ),
                      const Gap(10),
                      Align(
                        alignment: Alignment.center,
                        child: ts.ToggleSwitch(
                          // minWidth: MediaQuery.of(context).size.width / 2,
                          minHeight: 40.0,
                          fontSize: 16.0,
                          customWidths: [size.width / 4, size.width / 4],
                          initialLabelIndex: _vo2MaxValue,
                          activeBgColor: const  [MyColors.mainColor],
                          activeFgColor: MyColors.black,
                          inactiveBgColor: Theme.of(context).primaryColorDark,
                          inactiveFgColor: MyColors.grey,
                          totalSwitches: 2,
                          labels: const ['is Known', 'is UnKnown'],
                          onToggle: (index) {
                            _vo2MaxValue = index!;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(25),
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
              controller: _heartRateController,
              hintText: 'Heart Rate (BPM)',
            ),
            const Gap(20),
            CustomTextFieldWidget(
              controller: _exerciseDurationController,
              hintText: 'Exercise Duration (min)',
            ),
            const Gap(20),
            //Todo: show when just if its known
            CustomTextFieldWidget(
              controller: _vo2MaxController,
              hintText: 'VO2 max (mL/kg/min)',
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
                        // cb: calories burned
                        calculateCb();
                      });
                    },
                    style: ButtonStyle(
                      maximumSize: MaterialStatePropertyAll(
                        Size(size.width / 4, 40),
                      ),
                    ),
                    child: const Text('Calculate'),
                  ),
                  Text(
                    // cb: calories burned
                    'CALORIES BURNED : ${_cbScore.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: MyColors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 15, right: 15, bottom: 10),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width / 4,
                            child:  Text(
                              '30 MINUTES OF\nEXERCISE',
                              style:  TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width / 4,
                            child:  Text(
                              'FAT CALORIES\nBURNED',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: size.width / 4,
                            child:  Text(
                              'GLYCOGEN CALORIES BURNED',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: size.width / 4,
                            child:  Text(
                              'TOTAL CALORIES\nBURNED',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width / 4,
                            child:  Text(
                              'Low Intensity\nGroup (50%)',
                              style:  TextStyle(
                                color:Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width / 4,
                            child: const Text(
                              '120',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: MyColors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width / 4,
                            child: const Text(
                              '80',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: MyColors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width / 4,
                            child: const Text(
                              '200',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: MyColors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width / 4,
                            child:  Text(
                              'High Intensity\nGroup (75%)',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width / 4,
                            child: const Text(
                              '140',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: MyColors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width / 4,
                            child: const Text(
                              '260',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: MyColors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width / 4,
                            child: const Text(
                              '400',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: MyColors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
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

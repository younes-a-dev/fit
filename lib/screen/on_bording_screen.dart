import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart' as ts;
import 'package:workout/widgets/toggle_switch_widget.dart';

import '../provider/user_setting.dart';
import '../res/colors.dart';
import '../widgets/hexagon_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static const routeName = '/ Auth Screen --> Onboarding screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  final TextEditingController _userCurrentWeightController =
      TextEditingController();
  final TextEditingController _userTargetWeightController =
      TextEditingController();
  final TextEditingController _userHeightController = TextEditingController();
  final TextEditingController _userAgeController = TextEditingController();

  // final bool isActive = false;
  int _initPageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _userAgeController.dispose();
    _userCurrentWeightController.dispose();
    _userHeightController.dispose();
    _userTargetWeightController.dispose();
    super.dispose();
  }

  var _editedUser = User(
    id: DateTime.now().toString(),
    username: null,
    userCurrentWeight: null,
    userTargetWeight: null,
    userHeight: null,
    userAge: null,
    userGender: UserGender.male,
    userMainGoal: null,
    userWorkoutLocation: null,
    userDailyWalk: null,
    userPushUps: null,
    userBodyType: null,
    userTargetBodyType: null,
    userFocusArea: null,
    userFirstDay: FirstWeekDay.monday,
    weeklyTrainingDaysCount: 3,
    //daysPlan: null,
    //userWorkoutDays: [WeekDay.monday, WeekDay.wednesday, WeekDay.friday],
  );

  // Widget _buildToggleButton(String title, int totalSwitches,
  //     List<String> labels, bool isVertical, void Function(int?) onToggle) {
  //   return Container(
  //     color: Theme.of(context).scaffoldBackgroundColor,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Gap(Get.size.height / 10),
  //         Text(
  //           title,
  //           style: const TextStyle(
  //             fontWeight: FontWeight.bold,
  //             color: Color(0xff212121),
  //             fontSize: 20,
  //           ),
  //         ),
  //         const Gap(30),
  //         Align(
  //           alignment: Alignment.center,
  //           child: ts.ToggleSwitch(
  //             minHeight: 60.0,
  //             minWidth: Get.size.width / 2.5,
  //             fontSize: 16.0,
  //             isVertical: isVertical,
  //             initialLabelIndex: 0,
  //             activeBgColor: [Theme.of(context).primaryColor],
  //             activeFgColor: Colors.black,
  //             inactiveBgColor: const Color(0xfff5f5f5),
  //             inactiveFgColor: Colors.grey,
  //             totalSwitches: totalSwitches,
  //             labels: labels,
  //             customTextStyles: const [
  //               TextStyle(
  //                   color: Colors.black,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 15)
  //             ],
  //             onToggle: onToggle,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildTextField(
    String title,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(10),
        TextField(
          controller: controller,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
          cursorColor: MyColors.mainColor,
          textAlign: TextAlign.start,
          textAlignVertical: const TextAlignVertical(y: -1),
          decoration: InputDecoration(
            //hintText: 'Plan Name',
            filled: true,
            fillColor: Theme.of(context).primaryColorDark,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.transparent, style: BorderStyle.none, width: 0),
            ),
            hintStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            suffixIconColor: MyColors.mainColor,
            prefixIconColor: MyColors.mainColor,
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.transparent, style: BorderStyle.none, width: 0),
            ),
            disabledBorder: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.transparent, style: BorderStyle.none, width: 0),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildWeeklyGoalSc(Size size) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(Get.size.height / 10),
          Text(
            'SET YOUR WEEKLY GOAL',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
          const Gap(15),
          Text(
            'We recommend training at least 3 days\n weekly for a better'
            ' result',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          Gap(size.height / 4),
          Text(
            'WEEKLY TRAINING DAYS',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
          const Gap(20),
          Align(
            alignment: Alignment.center,
            child: ts.ToggleSwitch(
              minWidth: Get.size.width / 3,
              minHeight: 60.0,
              fontSize: 16.0,
              initialLabelIndex: 2,
              activeBgColor: const [MyColors.mainColor],
              activeFgColor: MyColors.black,
              inactiveBgColor: Theme.of(context).primaryColorDark,
              inactiveFgColor: MyColors.grey,
              totalSwitches: 7,
              labels: const ['1', '2', '3', '4', '5', '6', '7'],
              onToggle: (index) {
                if (index == 0) {
                  _editedUser.weeklyTrainingDaysCount = 1;
                } else if (index == 1) {
                  _editedUser.weeklyTrainingDaysCount = 2;
                } else if (index == 2) {
                  _editedUser.weeklyTrainingDaysCount = 3;
                } else if (index == 3) {
                  _editedUser.weeklyTrainingDaysCount = 4;
                } else if (index == 4) {
                  _editedUser.weeklyTrainingDaysCount = 5;
                } else if (index == 5) {
                  _editedUser.weeklyTrainingDaysCount = 6;
                } else if (index == 6) {
                  _editedUser.weeklyTrainingDaysCount = 7;
                }
              },
            ),
          ),
          // const Gap(100),
          // const Text(
          //   'FIRST DAYS OF WEEK',
          //   style: TextStyle(
          //       color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          // ),
          // const Gap(25),
          // Align(
          //   alignment: Alignment.center,
          //   child: ts.ToggleSwitch(
          //     minWidth: Get.size.width / 3,
          //     minHeight: 60.0,
          //     fontSize: 16.0,
          //     isVertical: true,
          //     initialLabelIndex: 1,
          //     activeBgColor: const [Colors.yellow],
          //     activeFgColor: Colors.black,
          //     inactiveBgColor: const Color(0xfff5f5f5),
          //     inactiveFgColor: Colors.grey,
          //     totalSwitches: 3,
          //     labels: const ['Sunday', 'Monday', 'Saturday'],
          //     customTextStyles: const [
          //       TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 15)
          //     ],
          //     onToggle: (index) {
          //       if (index == 0) {
          //         _editedUser.userFirstDay = WeekDay.sunday;
          //       } else if (index == 1) {
          //         _editedUser.userFirstDay = WeekDay.monday;
          //       } else if (index == 2) {
          //         _editedUser.userFirstDay = WeekDay.saturday;
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildQuestions(List<InlineSpan> txts, int initValue,
      List<String> labels, int totalSwitches, Function function) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Raleway',
                color: Theme.of(context).primaryColor),
            children: txts,
          ),
        ),
        ToggleSwitchWidget(
            initialValue: initValue,
            labels: labels,
            totalSwitches: totalSwitches,
            isVertical: true,
            function: () {
              function();
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _initPageIndex = index;
                });
              },
              children: [
                // _buildToggleButton(
                //   'WHATS YOUR GENDER?',
                //   2,
                //   ['Male', 'Female'],
                //   false,
                //       (index) {
                //     index == 0
                //         ? _editedUser.userGender = UserGender.male
                //         : _editedUser.userGender = UserGender.female;
                //   },
                // ),
                // 1th Slid
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(Get.size.height / 10),
                        Text(
                          'LET US KNOW YOU\n BETTER',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        Gap(size.height / 7),
                        _buildTextField(
                          'WHAT IS YOUR CURRENT WEIGHT?',
                          _userCurrentWeightController,
                        ),
                        _buildTextField(
                          'HOW TALL ARE YOU?',
                          _userHeightController,
                        ),
                        _buildTextField(
                          'WHAT IS YOUR AGE?',
                          _userAgeController,
                        ),
                        _buildTextField(
                          'WHAT IS YOUR TARGET WEIGHT?',
                          _userTargetWeightController,
                        ),
                      ],
                    ),
                  ),
                ),
                // 2th slid
                _buildWeeklyGoalSc(size),
                // 3th slid
                Column(
                  children: [
                    Gap(size.height / 5),
                    _buildQuestions(
                      [
                        const TextSpan(
                          text: 'WHAT\nARE\nYOUR\n\n',
                        ),
                        const TextSpan(
                          text: 'MAIN GOALS ',
                          style: TextStyle(
                            color: MyColors.mainColor,
                          ),
                        ),
                        const TextSpan(
                          text: '?',
                        ),
                      ],
                      1,
                      ['Lose Weight', 'BUILD MUSCLE', 'KEEP FIT'],
                      3,
                      (index) {
                        if (index == 0) {
                          _editedUser.userMainGoal = UserMainGoal.loseWeight;
                        } else if (index == 1) {
                          _editedUser.userMainGoal = UserMainGoal.buildMuscle;
                        } else if (index == 2) {
                          _editedUser.userMainGoal = UserMainGoal.keepFit;
                        }
                      },
                    ),
                    Gap(size.height / 14),
                    const Divider(
                      indent: 25,
                      endIndent: 25,
                      color: MyColors.grey,
                    ),
                    Gap(size.height / 14),
                    _buildQuestions(
                      [
                        const TextSpan(
                          text: 'CHOOSE\nYOUR\nWORKOUT\n\n',
                        ),
                        const TextSpan(
                          text: 'Location',
                          style: TextStyle(
                            color: MyColors.mainColor,
                          ),
                        ),
                      ],
                      0,
                      ['GYM', 'HOME'],
                      2,
                      (index) {
                        index == 0
                            ? _editedUser.userWorkoutLocation =
                                UserWorkoutLocation.gym
                            : _editedUser.userWorkoutLocation =
                                UserWorkoutLocation.home;
                      },
                    ),
                  ],
                ),
                //
                // 4th slid
                //
                Column(
                  children: [
                    Gap(size.height / 5),
                    _buildQuestions(
                      [
                        const TextSpan(
                          text: 'HOW MUCH\nDO YOU\n\n',
                        ),
                        const TextSpan(
                          text: 'WALK\n\n',
                          style: TextStyle(
                            color: MyColors.mainColor,
                          ),
                        ),
                        const TextSpan(
                          text: 'DAILY?',
                        ),
                      ],
                      0,
                      [
                        'LESS THAN 1 HOUR',
                        '1-2 HOUR',
                        'MORE THAN 2 '
                            'HOUR'
                      ],
                      3,
                      (index) {
                        if (index == 0) {
                          _editedUser.userDailyWalk =
                              UserDailyWalk.lessThan1Hour;
                        } else if (index == 1) {
                          _editedUser.userDailyWalk = UserDailyWalk.b1_2hour;
                        } else if (index == 2) {
                          _editedUser.userDailyWalk =
                              UserDailyWalk.moreThan2Hour;
                        }
                      },
                    ),
                    Gap(size.height / 14),
                    const Divider(
                      indent: 25,
                      endIndent: 25,
                      color: MyColors.grey,
                    ),
                    Gap(size.height / 14),
                    _buildQuestions(
                      [
                        const TextSpan(
                          text: 'HOW MANY\n\n',
                        ),
                        const TextSpan(
                          text: 'PUSH_UPS\n\n',
                          style: TextStyle(
                            color: MyColors.mainColor,
                          ),
                        ),
                        const TextSpan(
                          text: 'CAN YOU\nDO AT\nONE TIME?',
                        ),
                      ],
                      1,
                      const [
                        '3_5 PUSH_UPS',
                        '5_10 PUSH_UPS',
                        '10_20 PUSH_UPS',
                        'MORE THAN 20'
                      ],
                      4,
                      (index) {
                        if (index == 0) {
                          _editedUser.userPushUps = UserPushUps.b3_5PushUps;
                        } else if (index == 1) {
                          _editedUser.userPushUps = UserPushUps.b5_10PushUps;
                        } else if (index == 2) {
                          _editedUser.userPushUps = UserPushUps.b10_20PushUps;
                        } else if (index == 3) {
                          _editedUser.userPushUps = UserPushUps.moreThan20;
                        }
                      },
                    ),
                  ],
                ),
                //
                // 5th slid
                //
                Column(
                  children: [
                    Gap(size.height / 5),
                    _buildQuestions(
                      [
                        const TextSpan(
                          text: 'CHOOSE\nYOUR\n\n',
                        ),
                        const TextSpan(
                          text: 'BODY TYPE',
                          style: TextStyle(
                            color: MyColors.mainColor,
                          ),
                        ),
                      ],
                      1,
                      ['SKINNY', 'AVERAGE', 'HEAVIER'],
                      3,
                      (index) {
                        if (index == 0) {
                          _editedUser.userBodyType = UserBodyType.skinny;
                        } else if (index == 1) {
                          _editedUser.userBodyType = UserBodyType.average;
                        } else if (index == 2) {
                          _editedUser.userBodyType = UserBodyType.heavier;
                        }
                      },
                    ),
                    Gap(size.height / 14),
                    const Divider(
                      indent: 25,
                      endIndent: 25,
                      color: MyColors.grey,
                    ),
                    Gap(size.height / 14),
                    _buildQuestions(
                      [
                        //   'CHOOSE YOUR TARGET BODY TYPE',
                        const TextSpan(
                          text: 'CHOOSE\nYOUR\n\n',
                        ),
                        const TextSpan(
                          text: 'TARGET BODY TYPE',
                          style: TextStyle(
                            color: MyColors.mainColor,
                          ),
                        ),
                      ],
                      1,
                      ['CUT', 'BULK', 'EXTRA BULK'],
                      3,
                      (index) {
                        if (index == 0) {
                          _editedUser.userTargetBodyType =
                              UserTargetBodyType.cut;
                        } else if (index == 1) {
                          _editedUser.userTargetBodyType =
                              UserTargetBodyType.bulk;
                        } else if (index == 2) {
                          _editedUser.userTargetBodyType =
                              UserTargetBodyType.extraBulk;
                        }
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildQuestions(
                      [
                        //   'CHOOSE YOUR FOCUS AREA',
                        const TextSpan(
                          text: 'CHOOSE\nYOUR\n\n',
                        ),
                        const TextSpan(
                          text: 'FOCUS AREA',
                          style: TextStyle(color: MyColors.mainColor),
                        ),
                      ],
                      0,
                      ['FULL BODY', 'ARM', 'CHEST', 'ABS', 'LEG'],
                      5,
                      (index) {
                        if (index == 0) {
                          _editedUser.userFocusArea = UserFocusArea.fullBody;
                        } else if (index == 1) {
                          _editedUser.userFocusArea = UserFocusArea.arm;
                        } else if (index == 2) {
                          _editedUser.userFocusArea = UserFocusArea.chest;
                        } else if (index == 3) {
                          _editedUser.userFocusArea = UserFocusArea.abs;
                        } else if (index == 4) {
                          _editedUser.userFocusArea = UserFocusArea.leg;
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(color: MyColors.grey,),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 40, top: 40),
            child: Row(
              children: [
                const Gap(20),
                ...List.generate(
                  6,
                  (index) => Row(
                    children: [
                      Center(
                        child: ClipPath(
                          clipper: HexagonWidget(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: index <= _initPageIndex
                                  ? MyColors.mainColor
                                  : Colors.grey,
                            ),
                            width: 12,
                            height: 12,
                          ),
                        ),
                      ),
                      const Gap(6),
                    ],
                  ),
                ),
                const Spacer(),
                Material(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      if (_initPageIndex == 5) {
                        User user = User(
                          id: DateTime.now().toString(),
                          username: null,
                          userCurrentWeight: double.tryParse(
                              _userCurrentWeightController.text),
                          userTargetWeight:
                              double.tryParse(_userTargetWeightController.text),
                          userHeight:
                              double.tryParse(_userHeightController.text),
                          userAge: int.tryParse(_userAgeController.text),
                          userGender: _editedUser.userGender,
                          userMainGoal: _editedUser.userMainGoal,
                          userWorkoutLocation: _editedUser.userWorkoutLocation,
                          userDailyWalk: _editedUser.userDailyWalk,
                          userPushUps: _editedUser.userPushUps,
                          userBodyType: _editedUser.userBodyType,
                          userTargetBodyType: _editedUser.userTargetBodyType,
                          userFocusArea: _editedUser.userFocusArea,
                          userFirstDay: _editedUser.userFirstDay,
                          weeklyTrainingDaysCount:
                              _editedUser.weeklyTrainingDaysCount,
                          workoutHistory: [],
                          //daysPlan: null,
                          //userWorkoutDays: [WeekDay.monday, WeekDay.wednesday, WeekDay.friday],
                        );
                        Provider.of<User>(context, listen: false)
                            .updateUserWeeklyGoalInfo(user);
                        Navigator.of(context).pop();
                      }
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 7, bottom: 7),
                      child: Text(
                        _initPageIndex == 5 ? 'Create Plan' : 'Next',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart' as ts;
import 'package:workout/bottom_navigator.dart';
import '../provider/user_setting.dart';
import '../res/colors.dart';

class InitUserInfo extends StatefulWidget {
  const InitUserInfo({Key? key}) : super(key: key);

  static const routeName = '/intro slider --> Init User Info';

  @override
  State<InitUserInfo> createState() => _InitUserInfoState();
}

class _InitUserInfoState extends State<InitUserInfo> {
  int _selectedGenderIndex = 0;

  var _editedUser = User(
    userGender: UserGender.male,
    userFirstDay: FirstWeekDay.monday,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(size.height / 8),
            Text(
              'Select Your Gender',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Gap(size.height / 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedGenderIndex = 0;
                      _editedUser.userGender = UserGender.male;
                    });
                  },
                  child: Container(
                      height: size.height / 5,
                      width: size.width / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.transparent,
                        border: Border.all(
                          width: _selectedGenderIndex == 0 ? 2 : 1,
                          color: _selectedGenderIndex == 0
                              ? MyColors.mainColor
                              : MyColors.grey.withOpacity(.2),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            flex: 5,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(14),
                                  topLeft: Radius.circular(14),
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/Male_User2.png',
                                color: _selectedGenderIndex == 0
                                    ? MyColors.mainColor
                                    : MyColors.grey.withOpacity(.2),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                'Male',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: _selectedGenderIndex == 0
                                      ? MyColors.mainColor
                                      : MyColors.grey,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                const Gap(50),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedGenderIndex = 1;
                      _editedUser.userGender = UserGender.female;
                    });
                  },
                  child: Container(
                      height: size.height / 5,
                      width: size.width / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.transparent,
                        border: Border.all(
                          width: _selectedGenderIndex == 1 ? 2 : 1,
                          color: _selectedGenderIndex == 1
                              ? MyColors.mainColor
                              : MyColors.grey.withOpacity(.2),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            flex: 5,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(14),
                                  topLeft: Radius.circular(14),
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/Female_User2.png',
                                color: _selectedGenderIndex == 1
                                    ? MyColors.mainColor
                                    : Colors.grey.withOpacity(.2),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                'Female',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: _selectedGenderIndex == 1
                                      ? MyColors.mainColor
                                      : MyColors.grey,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
            Gap(size.height / 14),
            Divider(
              indent: 50,
              endIndent: 50,
              color: Theme.of(context).primaryColor,
            ),
            Gap(size.height / 14),
            Text(
              'FIRST DAYS OF WEEK',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const Gap(25),
            Align(
              alignment: Alignment.center,
              child: ts.ToggleSwitch(
                minWidth: size.width / 4,
                minHeight: 60.0,
                fontSize: 16.0,
                isVertical: false,
                initialLabelIndex: 1,
                activeBgColor: const  [MyColors.mainColor],
                activeFgColor: MyColors.black,
                inactiveBgColor: Theme.of(context).primaryColorDark,
                inactiveFgColor: MyColors.grey,
                totalSwitches: 3,
                labels: const ['Sunday', 'Monday', 'Saturday'],
                // customTextStyles:  [
                //   TextStyle(
                //       color: Theme.of(context).primaryColorLight,
                //       fontSize: 15)
                // ],
                onToggle: (index) {
                  if (index == 0) {
                    _editedUser.userFirstDay = FirstWeekDay.sunday;
                  } else if (index == 1) {
                    _editedUser.userFirstDay = FirstWeekDay.monday;
                  } else if (index == 2) {
                    _editedUser.userFirstDay = FirstWeekDay.saturday;
                  }
                },
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                User user = User(
                  id: DateTime.now().toString(),
                  username: null,
                  userCurrentWeight: null,
                  userTargetWeight: null,
                  userHeight: null,
                  userAge: null,
                  userGender: _editedUser.userGender,
                  userMainGoal: null,
                  userWorkoutLocation: null,
                  userDailyWalk: null,
                  userPushUps: null,
                  userBodyType: null,
                  userTargetBodyType: null,
                  userFocusArea: null,
                  userFirstDay: _editedUser.userFirstDay,
                  weeklyTrainingDaysCount: null,
                  workoutHistory: [],
                  //daysPlan: null,
                  //userWorkoutDays: [WeekDay.monday, WeekDay.wednesday, WeekDay.friday],
                );
                Provider.of<User>(context, listen: false)
                    .updateUserWeeklyGoalInfo(user);
                Navigator.of(context).pushNamed(BottomNavigator.routeName);
              },
              style: ButtonStyle(
                maximumSize:
                    MaterialStatePropertyAll(Size(size.width * .8, 50)),
              ),
              child: const Text('START'),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}

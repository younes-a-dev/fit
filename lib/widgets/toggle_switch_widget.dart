import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart' as ts;

import '../res/colors.dart';

class ToggleSwitchWidget extends StatelessWidget {
   ToggleSwitchWidget({this.initialValue,required this
       .labels,
     required
  this.totalSwitches,required this.isVertical,required this.function});

  int? initialValue;
  final List<String> labels;
  final int totalSwitches;
  final bool isVertical;
  final Function function;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: ts.ToggleSwitch(
        minWidth: MediaQuery.of(context).size.width / 2 - 50,
        minHeight: 50.0,
        fontSize: 16.0,
        isVertical: isVertical,
        customWidths: [size.width/5,size.width/5],
        initialLabelIndex: initialValue,
        activeBgColor: const  [MyColors.mainColor],
        activeFgColor: MyColors.black,
        inactiveBgColor: Theme.of(context).primaryColorDark,
        inactiveFgColor: MyColors.grey,
        totalSwitches: totalSwitches,
        labels: labels,
        onToggle: (index) {
          // initialValue = index!;
          function();
        },
      ),
    );
  }
}

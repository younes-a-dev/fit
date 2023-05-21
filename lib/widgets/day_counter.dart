import 'package:flutter/material.dart';

import '../res/colors.dart';

class DayCounter extends StatefulWidget {
  DayCounter(this.planStartDate, {Key? key}) : super(key: key);

  DateTime? planStartDate;

  @override
  State<DayCounter> createState() => _DayCounterState();
}

class _DayCounterState extends State<DayCounter> {
  Duration? _duration;

  @override
  void initState() {
    _duration = DateTime.now().difference(widget.planStartDate as DateTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Day ${_duration!.inDays}',
      style: const TextStyle(
        color: MyColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

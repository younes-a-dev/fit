import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class BmiScoreScreen extends StatelessWidget {
  static const routeName = '/from body mass index screen --> bmi score screen';

  const BmiScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final bmiScore = routeArgs['bmiScore'];
    // final age = routeArgs['age'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Score'),
      ),
      body: Column(
        children: [
          PrettyGauge(
            gaugeSize: 300,
            minValue: 0,
            maxValue: 40,
            segments: [
              GaugeSegment('Under Weight', 18.5, Colors.red),
              GaugeSegment('Normal', 6.4, Colors.green),
              GaugeSegment('Over Weight', 5, Colors.orange),
              GaugeSegment('Obese', 10.1, Colors.pink),
            ],
            valueWidget: Text(bmiScore.toStringAsFixed(1)),
            currentValue: bmiScore.toDouble(),
          ),
        ],
      ),
    );

  }
}

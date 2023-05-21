import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:workout/widgets/app_bar_widget.dart';
import '../provider/measure.dart';
import '../res/colors.dart';
import 'log_measurement_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

enum MuscleTypeMeasure {
  bodyWeight,
  waist,
  bodyFat,
  neck,
  shoulder,
  chest,
  leftBicep,
  rightBicep,
  leftForearm,
  rightForearm,
  abdomen,
  hips,
  leftThigh,
  rightThigh,
  leftCalf,
  rightCalf,
}

class MeasuresScreen extends StatefulWidget {
  const MeasuresScreen({Key? key}) : super(key: key);

  static const routeName = '/Profile Screen --> Measures Screen';

  @override
  State<MeasuresScreen> createState() => _MeasuresScreenState();
}

class _MeasuresScreenState extends State<MeasuresScreen> {
  TooltipBehavior? _tooltipBehavior;
  MuscleTypeMeasure selectedMuscle = MuscleTypeMeasure.bodyWeight;
  List<Measure> measureList = [];
  final List<String> _muscleNames = [];

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final measures = Provider.of<Measures>(context).items;
    measureList = measures;
    for (var element in measureList) {
      if (element.bodyWeight != null && !_muscleNames.contains('Body Weight')) {
        _muscleNames.add('Body Weight');
      }
      if (element.waist != null && !_muscleNames.contains('Waist')) {
        _muscleNames.add('Waist');
      }
      if (element.bodyFat != null && !_muscleNames.contains('Body Fat')) {
        _muscleNames.add('Body Fat');
      }
      if (element.neck != null && !_muscleNames.contains('Neck')) {
        _muscleNames.add('Neck');
      }
      if (element.shoulder != null && !_muscleNames.contains('Shoulder')) {
        _muscleNames.add('Shoulder');
      }
      if (element.chest != null && !_muscleNames.contains('Chest')) {
        _muscleNames.add('Chest');
      }
      if (element.leftBicep != null && !_muscleNames.contains('Left Bicep')) {
        _muscleNames.add('Left Bicep');
      }
      if (element.rightBicep != null && !_muscleNames.contains('Right Bicep')) {
        _muscleNames.add('Right Bicep');
      }
      if (element.leftForearm != null &&
          !_muscleNames.contains('Left Forearm')) {
        _muscleNames.add('Left Forearm');
      }
      if (element.rightForearm != null &&
          !_muscleNames.contains('Right Forearm')) {
        _muscleNames.add('Right Forearm');
      }
      if (element.abdomen != null && !_muscleNames.contains('Abdomen')) {
        _muscleNames.add('Abdomen');
      }
      if (element.hips != null && !_muscleNames.contains('Hips')) {
        _muscleNames.add('Hips');
      }
      if (element.leftThigh != null && !_muscleNames.contains('Left Thigh')) {
        _muscleNames.add('Left Thigh');
      }
      if (element.rightThigh != null && !_muscleNames.contains('Right Thigh')) {
        _muscleNames.add('Right Thigh');
      }
      if (element.leftCalf != null && !_muscleNames.contains('Left Calf')) {
        _muscleNames.add('Left Calf');
      }
      if (element.rightCalf != null && !_muscleNames.contains('Right Calf')) {
        _muscleNames.add('Right Calf');
      }
    }
    _muscleNames.toSet();
    super.didChangeDependencies();
  }

  void _selectedMuscle(String muscleName) {
    if (muscleName == 'Body Weight') {
      selectedMuscle = MuscleTypeMeasure.bodyWeight;
    } else if (muscleName == 'Waist') {
      selectedMuscle = MuscleTypeMeasure.waist;
    } else if (muscleName == 'Body Fat') {
      selectedMuscle = MuscleTypeMeasure.bodyFat;
    } else if (muscleName == 'Neck') {
      selectedMuscle = MuscleTypeMeasure.neck;
    } else if (muscleName == 'Shoulder') {
      selectedMuscle = MuscleTypeMeasure.shoulder;
    } else if (muscleName == 'Chest') {
      selectedMuscle = MuscleTypeMeasure.chest;
    } else if (muscleName == 'Left Bicep') {
      selectedMuscle = MuscleTypeMeasure.leftBicep;
    } else if (muscleName == 'Right Bicep') {
      selectedMuscle = MuscleTypeMeasure.rightBicep;
    } else if (muscleName == 'Left Forearm') {
      selectedMuscle = MuscleTypeMeasure.leftForearm;
    } else if (muscleName == 'Right Forearm') {
      selectedMuscle = MuscleTypeMeasure.rightForearm;
    } else if (muscleName == 'Abdomen') {
      selectedMuscle = MuscleTypeMeasure.abdomen;
    } else if (muscleName == 'Hips') {
      selectedMuscle = MuscleTypeMeasure.hips;
    } else if (muscleName == 'Left Thigh') {
      selectedMuscle = MuscleTypeMeasure.leftThigh;
    } else if (muscleName == 'Right Thigh') {
      selectedMuscle = MuscleTypeMeasure.rightThigh;
    } else if (muscleName == 'Left Calf') {
      selectedMuscle = MuscleTypeMeasure.leftCalf;
    } else if (muscleName == 'Right Calf') {
      selectedMuscle = MuscleTypeMeasure.rightCalf;
    }
  }

  num? yValues(Measure measure) {
    num? yValue;
    switch (selectedMuscle) {
      case MuscleTypeMeasure.bodyWeight:
        yValue = measure.bodyWeight;
        break;
      case MuscleTypeMeasure.waist:
        yValue = measure.waist;
        break;
      case MuscleTypeMeasure.bodyFat:
        yValue = measure.bodyFat;
        break;
      case MuscleTypeMeasure.neck:
        yValue = measure.neck;
        break;
      case MuscleTypeMeasure.shoulder:
        yValue = measure.shoulder;
        break;
      case MuscleTypeMeasure.chest:
        yValue = measure.chest;
        break;
      case MuscleTypeMeasure.leftBicep:
        yValue = measure.leftBicep;
        break;
      case MuscleTypeMeasure.rightBicep:
        yValue = measure.rightBicep;
        break;
      case MuscleTypeMeasure.leftForearm:
        yValue = measure.leftForearm;
        break;
      case MuscleTypeMeasure.rightForearm:
        yValue = measure.rightForearm;
        break;
      case MuscleTypeMeasure.abdomen:
        yValue = measure.abdomen;
        break;
      case MuscleTypeMeasure.hips:
        yValue = measure.hips;
        break;
      case MuscleTypeMeasure.leftThigh:
        yValue = measure.leftThigh;
        break;
      case MuscleTypeMeasure.rightThigh:
        yValue = measure.rightThigh;
        break;
      case MuscleTypeMeasure.leftCalf:
        yValue = measure.leftCalf;
        break;
      case MuscleTypeMeasure.rightCalf:
        yValue = measure.rightCalf;
        break;
    }
    return yValue;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // AppBar
      appBar: AppBarWidget(
        title: 'Measurement',
        icon: Icons.add,
        onPress: () {
          Navigator.of(context)
              .pushNamed(LogMeasurementScreen.routeName)
              //     .then((value) {
              //   measureId = value as String;
              // })
              .then((_) => setState(() {}));
        },
      ),

      body: measureList.isEmpty
          // place Holder
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(size.height * .2),
                  const Icon(
                    Icons.accessibility,
                    color: MyColors.mainColor,
                    size: 35,
                  ),
                  const Gap(16),
                  const Text(
                    'Start Tracking The Progress Of Your Body\n Measurement',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: MyColors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  const Gap(16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(LogMeasurementScreen.routeName);
                    },
                    style: ButtonStyle(
                      maximumSize: MaterialStatePropertyAll(
                        Size(size.width * .5, 40),
                      ),
                    ),
                    child: const Text(
                      'ADD MEASUREMENT',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Muscle name
                Container(
                  padding: const EdgeInsets.only(left: 25, top: 20),
                  child: Text(
                    selectedMuscle.name,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                // Chart
                Container(
                    height: size.height * .25,
                    padding: const EdgeInsets.only(
                        left: 5, right: 10, top: 5, bottom: 5),
                    alignment: AlignmentDirectional.center,
                    child: SfCartesianChart(
                      // title: ChartTitle(text:'Body Weight(Kg)'),
                      // legend: Legend(isVisible: true),
                      tooltipBehavior: _tooltipBehavior,
                      margin: const EdgeInsets.all(20),
                      plotAreaBackgroundColor: Colors.transparent,
                      // palette: [Colors.transparent],
                      primaryXAxis: DateTimeAxis(
                        dateFormat: DateFormat.Md('en_US'),
                        interval: 1,
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                        majorGridLines: const MajorGridLines(width: 0),
                        majorTickLines:
                            const MajorTickLines(color: Colors.transparent),
                        isVisible: true,
                        tickPosition: TickPosition.inside,
                      ),
                      primaryYAxis: NumericAxis(
                        axisLine: const AxisLine(width: 0),
                        majorTickLines:
                            const MajorTickLines(color: Colors.transparent),
                      ),
                      series: <ChartSeries>[
                        LineSeries<Measure, DateTime>(
                          // name: 'Body Weight',
                          dataSource: measureList,
                          xValueMapper: (Measure measure, _) =>
                              measure.dateTime,
                          yValueMapper: (Measure measure, _) =>
                              yValues(measure),
                          markerSettings: const MarkerSettings(
                            isVisible: true,
                            color: MyColors.mainColor,
                            borderWidth: .5,
                          ),
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                          ),
                          enableTooltip: true,
                          color: Theme.of(context).primaryColor,
                          //Todo:  null valuee
                          //emptyPointSettings: EmptyPointSettings(mode:)
                          // sortingOrder: SortingOrder.descending
                          //xAxisName: 'Body Weight',
                        )
                      ],
                    )),

                // Horizontal grid
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 20, right: 20),
                  height: size.height * .06,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: _muscleNames.length,
                    itemBuilder: (ctx, i) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedMuscle(_muscleNames[i]);
                          // print(measureList[0].bodyWeight);
                          // _selectedMuscleList();
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        margin: const EdgeInsets.only(right: 5),
                        height: 40,
                        decoration: BoxDecoration(
                          color: MyColors.black,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            _muscleNames[i],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: MyColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //List view
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: measureList.length,
                    //TODO: reverse the list
                    // reverse: true,
                    itemBuilder: (ctx, i) => Column(
                      children: [
                        yValues(measureList[i]) != null
                            ? Column(
                                children: [
                                  ListTile(
                                    title: ListTile(
                                      title: Text(
                                        (DateFormat.yMMMMd('en_US')
                                            .format(measureList[i].dateTime!)),
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 16),
                                      ),
                                      trailing: Text(
                                          '${yValues(measureList[i])}',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                    ),
                                  ),
                                  const Divider(
                                    indent: 30,
                                    endIndent: 30,
                                    color: MyColors.grey,
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

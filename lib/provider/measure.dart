import 'package:fluent_ui/fluent_ui.dart';

class Measure {
  final String? id;
  final DateTime? dateTime;
  final double? bodyWeight;
  final double? waist;
  final double? bodyFat;
  final double? neck;
  final double? shoulder;
  final double? chest;
  final double? leftBicep;
  final double? rightBicep;
  final double? leftForearm;
  final double? rightForearm;
  final double? abdomen;
  final double? hips;
  final double? leftThigh;
  final double? rightThigh;
  final double? leftCalf;
  final double? rightCalf;

  Measure({
    this.id,
    this.dateTime,
    this.bodyWeight,
    this.waist,
    this.bodyFat,
    this.neck,
    this.shoulder,
    this.chest,
    this.leftBicep,
    this.rightBicep,
    this.leftForearm,
    this.rightForearm,
    this.abdomen,
    this.hips,
    this.leftThigh,
    this.rightThigh,
    this.leftCalf,
    this.rightCalf,
  });
}

class Measures with ChangeNotifier {
  final List<Measure> _items = [
    // Measure(
    //   id: '1',
    //   dateTime: DateTime.utc(2022,2,10),
    //   bodyWeight: '55',
    //   waist: '22',
    //   bodyFat: '22',
    //   neck: '22',
    //   shoulder: '22',
    //   chest: '22',
    //   leftBicep: '22',
    //   rightBicep: '22',
    //   leftForearm: '22',
    //   rightForearm: '22',
    //   abdomen: '22',
    //   hips: '35',
    //   leftThigh: '22',
    //   rightThigh: '22',
    //   leftCalf: '22',
    //   rightCalf: '22',
    // ),
    // Measure(
    //   id: '2',
    //   dateTime: DateTime.utc(2022,4,20),
    //   bodyWeight: '65',
    //   waist: '22',
    //   bodyFat: '22',
    //   neck: '22',
    //   shoulder: '22',
    //   chest: '22',
    //   leftBicep: '22',
    //   rightBicep: '22',
    //   leftForearm: '22',
    //   rightForearm: '22',
    //   abdomen: '22',
    //   hips: '55',
    //   leftThigh: '22',
    //   rightThigh: '22',
    //   leftCalf: '22',
    //   rightCalf: '22',
    // ),
    // Measure(
    //   id:'3',
    //   dateTime: DateTime.utc(2022,7,15),
    //   bodyWeight: '75',
    //   waist: '22',
    //   bodyFat: '22',
    //   neck: '22',
    //   shoulder: '22',
    //   chest: '22',
    //   leftBicep: '22',
    //   rightBicep: '22',
    //   leftForearm: '22',
    //   rightForearm: '22',
    //   abdomen: '22',
    //   hips: '44',
    //   leftThigh: '22',
    //   rightThigh: '22',
    //   leftCalf: '22',
    //   rightCalf: '22',
    // ),
    // Measure(
    //   id: '4',
    //   dateTime: DateTime.utc(2022,11,12),
    //   bodyWeight: '78',
    //   waist: '22',
    //   bodyFat: '22',
    //   neck: '22',
    //   shoulder: '22',
    //   chest: '22',
    //   leftBicep: '22',
    //   rightBicep: '22',
    //   leftForearm: '22',
    //   rightForearm: '22',
    //   abdomen: '22',
    //   hips: '30',
    //   leftThigh: '22',
    //   rightThigh: '22',
    //   leftCalf: '22',
    //   rightCalf: '22',
    // ),
  ];

  List<Measure> get items {
    return [..._items];
  }



  void addMeasurement(Measure measure,DateTime dateTime) {
    final newMeasurement = Measure(
      id: dateTime.toString(),
      dateTime: dateTime,
      bodyWeight: measure.bodyWeight,
      waist: measure.waist,
      bodyFat: measure.bodyFat,
      neck: measure.neck,
      shoulder: measure.shoulder,
      chest: measure.chest,
      leftBicep: measure.leftBicep,
      rightBicep: measure.rightBicep,
      leftForearm: measure.leftForearm,
      rightForearm: measure.rightForearm,
      abdomen: measure.abdomen,
      hips: measure.hips,
      leftThigh: measure.leftThigh,
      rightThigh: measure.rightThigh,
      leftCalf: measure.leftCalf,
      rightCalf: measure.rightCalf,
    );
    _items.insert(0, newMeasurement);
    notifyListeners();
  }
}

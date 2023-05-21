import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:workout/widgets/app_bar_widget.dart';
import 'package:workout/widgets/custom_textfield_widget.dart';

import '../provider/measure.dart';
import '../res/colors.dart';

class LogMeasurementScreen extends StatefulWidget {
  LogMeasurementScreen({Key? key}) : super(key: key);

  static const routeName = '/Measures screen --> log measurement screen';

  @override
  State<LogMeasurementScreen> createState() => _LogMeasurementScreenState();
}

class _LogMeasurementScreenState extends State<LogMeasurementScreen> {
  final _form = GlobalKey<FormState>();
  final _bodyWeightFocusNode = FocusNode();
  final _waistFocusNode = FocusNode();
  final _bodyFatFocusNode = FocusNode();
  final _neckFocusNode = FocusNode();
  final _shoulderFocusNode = FocusNode();
  final _chestFocusNode = FocusNode();
  final _leftBicepFocusNode = FocusNode();
  final _rightBicepFocusNode = FocusNode();
  final _leftForearmFocusNode = FocusNode();
  final _rightForeArmFocusNode = FocusNode();
  final _abdomenFocusNode = FocusNode();
  final _hipsFocusNode = FocusNode();
  final _leftThighFocusNode = FocusNode();
  final _rightThighFocusNode = FocusNode();
  final _leftCalfFocusNode = FocusNode();
  final _rightCalfFocusNode = FocusNode();

  @override
  void dispose() {
    _bodyWeightFocusNode.dispose();
    _waistFocusNode.dispose();
    _bodyFatFocusNode.dispose();
    _neckFocusNode.dispose();
    _shoulderFocusNode.dispose();
    _chestFocusNode.dispose();
    _leftBicepFocusNode.dispose();
    _rightBicepFocusNode.dispose();
    _leftForearmFocusNode.dispose();
    _rightForeArmFocusNode.dispose();
    _abdomenFocusNode.dispose();
    _hipsFocusNode.dispose();
    _leftThighFocusNode.dispose();
    _rightThighFocusNode.dispose();
    _leftCalfFocusNode.dispose();
    _rightCalfFocusNode.dispose();
    super.dispose();
  }

  var _editedMeasurement = Measure(
    id: null,
    dateTime: null,
    bodyWeight: null,
    waist: null,
    bodyFat: null,
    neck: null,
    shoulder: null,
    chest: null,
    leftBicep: null,
    rightBicep: null,
    leftForearm: null,
    rightForearm: null,
    abdomen: null,
    hips: null,
    leftThigh: null,
    rightThigh: null,
    leftCalf: null,
    rightCalf: null,
  );

  void _saveForm() {
    // final isValid = _form.currentState!.validate();
    // if(!isValid){
    //   return;
    // }
    // var time = DateFormat('dd.mm.yyy').format(DateTime.now());
    _form.currentState!.save();
    //TODO: fix date time problem
    Provider.of<Measures>(context, listen: false)
        .addMeasurement(_editedMeasurement, DateTime.now());
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
          title: 'Log Measurements', icon: Icons.save, onPress: _saveForm),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: Form(
          key: _form,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Current Date
                       Text(
                        'Date',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
                      ),
                      const Spacer(),
                      Text(
                        DateFormat.yMMMEd().format(DateTime.now()),
                        style:  TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  const Divider(color: MyColors.mainColor,),
                  const Gap(15),
                   Text(
                    'Measurements',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(15),
                ],
              ),
              // TextFormField List
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      CustomTextFormFieldWidget(
                        label: 'Body weight',
                        units: (' '
                            '(Kg)'),
                        focusNodeFunction: () {
                          FocusScope.of(context).requestFocus(_waistFocusNode);
                        },
                        focusNode: _bodyWeightFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: value == ''
                                ? null
                                : double.parse(value as String),
                            waist: _editedMeasurement.waist,
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: _editedMeasurement.neck,
                            shoulder: _editedMeasurement.shoulder,
                            chest: _editedMeasurement.chest,
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: _editedMeasurement.abdomen,
                            hips: _editedMeasurement.hips,
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Waist',
                        units: (' (cm)'),
                        focusNodeFunction: () {
                          FocusScope.of(context)
                              .requestFocus(_bodyFatFocusNode);
                        },
                        focusNode: _waistFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: value == ''
                                ? null
                                : double.parse(value as String),
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: _editedMeasurement.neck,
                            shoulder: _editedMeasurement.shoulder,
                            chest: _editedMeasurement.chest,
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: _editedMeasurement.abdomen,
                            hips: _editedMeasurement.hips,
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Body fat',
                        units: (' (%)'),
                        focusNodeFunction: () {
                          FocusScope.of(context).requestFocus(_neckFocusNode);
                        },
                        focusNode: _bodyFatFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: _editedMeasurement.waist,
                            bodyFat: value == ''
                                ? null
                                : double.parse(value as String),
                            neck: _editedMeasurement.neck,
                            shoulder: _editedMeasurement.shoulder,
                            chest: _editedMeasurement.chest,
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: _editedMeasurement.abdomen,
                            hips: _editedMeasurement.hips,
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Neck',
                        units: (' (cm)'),
                        focusNodeFunction: () {
                          FocusScope.of(context)
                              .requestFocus(_shoulderFocusNode);
                        },
                        focusNode: _neckFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: _editedMeasurement.waist,
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: value == ''
                                ? null
                                : double.parse(value as String),
                            shoulder: _editedMeasurement.shoulder,
                            chest: _editedMeasurement.chest,
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: _editedMeasurement.abdomen,
                            hips: _editedMeasurement.hips,
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Shoulder',
                        units: (' (cm)'),
                        focusNodeFunction: () {
                          FocusScope.of(context).requestFocus(_chestFocusNode);
                        },
                        focusNode: _shoulderFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: _editedMeasurement.waist,
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: _editedMeasurement.neck,
                            shoulder: value == ''
                                ? null
                                : double.parse(value as String),
                            chest: _editedMeasurement.chest,
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: _editedMeasurement.abdomen,
                            hips: _editedMeasurement.hips,
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Chest',
                        units: (' (cm)'),
                        focusNodeFunction: () {
                          FocusScope.of(context)
                              .requestFocus(_leftBicepFocusNode);
                        },
                        focusNode: _chestFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: _editedMeasurement.waist,
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: _editedMeasurement.neck,
                            shoulder: _editedMeasurement.shoulder,
                            chest: value == ''
                                ? null
                                : double.parse(value as String),
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: _editedMeasurement.abdomen,
                            hips: _editedMeasurement.hips,
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Left bicep',
                        units: (' (cm)'),
                        focusNodeFunction: () {
                          FocusScope.of(context)
                              .requestFocus(_rightBicepFocusNode);
                        },
                        focusNode: _leftBicepFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: _editedMeasurement.waist,
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: _editedMeasurement.neck,
                            shoulder: _editedMeasurement.shoulder,
                            chest: _editedMeasurement.chest,
                            leftBicep: value == ''
                                ? null
                                : double.parse(value as String),
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: _editedMeasurement.abdomen,
                            hips: _editedMeasurement.hips,
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Right bicep',
                        units: (' (cm)'),
                        focusNodeFunction: () {
                          FocusScope.of(context)
                              .requestFocus(_leftForearmFocusNode);
                        },
                        focusNode: _rightBicepFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: _editedMeasurement.waist,
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: _editedMeasurement.neck,
                            shoulder: _editedMeasurement.shoulder,
                            chest: _editedMeasurement.chest,
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: value == ''
                                ? null
                                : double.parse(value as String),
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: _editedMeasurement.abdomen,
                            hips: _editedMeasurement.hips,
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Left forearm',
                        units: (' (cm)'),
                        focusNodeFunction: () {
                          FocusScope.of(context)
                              .requestFocus(_rightForeArmFocusNode);
                        },
                        focusNode: _leftForearmFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: _editedMeasurement.waist,
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: _editedMeasurement.neck,
                            shoulder: _editedMeasurement.shoulder,
                            chest: _editedMeasurement.chest,
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: value == ''
                                ? null
                                : double.parse(value as String),
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: _editedMeasurement.abdomen,
                            hips: _editedMeasurement.hips,
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Right foreArm',
                        units: (' (cm)'),
                        focusNodeFunction: () {
                          FocusScope.of(context)
                              .requestFocus(_abdomenFocusNode);
                        },
                        focusNode: _rightForeArmFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: _editedMeasurement.waist,
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: _editedMeasurement.neck,
                            shoulder: _editedMeasurement.shoulder,
                            chest: _editedMeasurement.chest,
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: value == ''
                                ? null
                                : double.parse(value as String),
                            abdomen: _editedMeasurement.abdomen,
                            hips: _editedMeasurement.hips,
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Abdomen',
                        units: (' (cm)'),
                        focusNodeFunction: () {
                          FocusScope.of(context).requestFocus(_hipsFocusNode);
                        },
                        focusNode: _abdomenFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: _editedMeasurement.waist,
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: _editedMeasurement.neck,
                            shoulder: _editedMeasurement.shoulder,
                            chest: _editedMeasurement.chest,
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: value == ''
                                ? null
                                : double.parse(value as String),
                            hips: _editedMeasurement.hips,
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Hips',
                        units: (' (cm)'),
                        focusNodeFunction: () {
                          FocusScope.of(context)
                              .requestFocus(_leftThighFocusNode);
                        },
                        focusNode: _hipsFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: _editedMeasurement.waist,
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: _editedMeasurement.neck,
                            shoulder: _editedMeasurement.shoulder,
                            chest: _editedMeasurement.chest,
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: _editedMeasurement.abdomen,
                            hips: value == ''
                                ? null
                                : double.parse(value as String),
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Left thigh',
                        units: (' (cm)'),
                        focusNodeFunction: () {
                          FocusScope.of(context)
                              .requestFocus(_rightThighFocusNode);
                        },
                        focusNode: _leftThighFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: _editedMeasurement.waist,
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: _editedMeasurement.neck,
                            shoulder: _editedMeasurement.shoulder,
                            chest: _editedMeasurement.chest,
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: _editedMeasurement.abdomen,
                            hips: _editedMeasurement.hips,
                            leftThigh: value == ''
                                ? null
                                : double.parse(value as String),
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Right thigh',
                        units: (' (cm)'),
                        focusNodeFunction: () {
                          FocusScope.of(context)
                              .requestFocus(_leftCalfFocusNode);
                        },
                        focusNode: _rightThighFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: _editedMeasurement.waist,
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: _editedMeasurement.neck,
                            shoulder: _editedMeasurement.shoulder,
                            chest: _editedMeasurement.chest,
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: _editedMeasurement.abdomen,
                            hips: _editedMeasurement.hips,
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: value == ''
                                ? null
                                : double.parse(value as String),
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Left calf',
                        units: (' (cm)'),
                        focusNodeFunction: () {
                          FocusScope.of(context)
                              .requestFocus(_rightCalfFocusNode);
                        },
                        focusNode: _leftCalfFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: _editedMeasurement.waist,
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: _editedMeasurement.neck,
                            shoulder: _editedMeasurement.shoulder,
                            chest: _editedMeasurement.chest,
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: _editedMeasurement.abdomen,
                            hips: _editedMeasurement.hips,
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: value == ''
                                ? null
                                : double.parse(value as String),
                            rightCalf: _editedMeasurement.rightCalf,
                          );
                        },
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Right calf',
                        units: (' (cm)'),
                        focusNodeFunction: () {},
                        focusNode: _rightCalfFocusNode,
                        onSaveFunction: (value) {
                          _editedMeasurement = Measure(
                            bodyWeight: _editedMeasurement.bodyWeight,
                            waist: _editedMeasurement.waist,
                            bodyFat: _editedMeasurement.bodyFat,
                            neck: _editedMeasurement.neck,
                            shoulder: _editedMeasurement.shoulder,
                            chest: _editedMeasurement.chest,
                            leftBicep: _editedMeasurement.leftBicep,
                            rightBicep: _editedMeasurement.rightBicep,
                            leftForearm: _editedMeasurement.leftForearm,
                            rightForearm: _editedMeasurement.rightForearm,
                            abdomen: _editedMeasurement.abdomen,
                            hips: _editedMeasurement.hips,
                            leftThigh: _editedMeasurement.leftThigh,
                            rightThigh: _editedMeasurement.rightThigh,
                            leftCalf: _editedMeasurement.leftCalf,
                            rightCalf: value == ''
                                ? null
                                : double.parse(value as String),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

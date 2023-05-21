import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';

import '../../model/menu_item_model.dart';
import '../../provider/exercise.dart';
import '../../widgets/menu_item.dart' as menu_item;

class AddExerciseScreen extends StatefulWidget {
  const AddExerciseScreen({Key? key}) : super(key: key);

  static const routeName = '/Create PlanScreen->AddExerciseScreen';

  @override
  State<AddExerciseScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  final _searchTxtController = TextEditingController();
  final _planNameController = TextEditingController();

  List<Exercise>? _exercises = [];
  List<Exercise> _filteredExercises = [];
  final List<Exercise> _selectedExercises = [];
  EquipmentType? _selectedEquipmentType;
  Muscle? _selectedMuscle;
  bool _allEquipment = false;
  bool _allMuscle = false;
  bool _validate = false;
  bool _isInit = true;
  String? _dropDownValue;

  //
  // var _editedPlan = Plan(
  //   id: null,
  //   name: '',
  //   workoutType: null,
  //   image: null,
  //   planExercises: [],
  // );
  //
  // var _initValue = {
  //   'name' : '',
  //   'image' : '',
  // };

  @override
  void didChangeDependencies() {
    final exerciseData = Provider.of<Exercises>(context).items;
    _exercises = exerciseData;
    // if (_isInit) {
    //   final routeArgs =
    //       ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    //   final planId = routeArgs['planId'];
    //   final planExercises = routeArgs['planExercises'];
    //   for(var element in planExercises){
    //     element.isSelected = true;
    //   }
    //  _exercises.where((ex)=>ex.id == )
    // }
    // if (_isInit) {
    //   final planId = ModalRoute.of(context)?.settings.arguments as String?;
    //   if (planId != null) {
    //       _editedPlan =
    //         Provider.of<Plans>(context, listen: false).findPlanById(planId);
    //     _initValue = {
    //       'name' : '',
    //       'image' : _editedPlan.image as String,
    //     };
    //     _planNameController.text = _editedPlan.name as String;
    //   }
    // }
    //  _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchTxtController.dispose();
    _planNameController.dispose();
    super.dispose();
  }

  _onSelectedEquipment(BuildContext context, CreatePlanMenuItemModel item) {
    setState(() {
      switch (item) {
        case menu_item.MenuItem.allEquipments:
          _allEquipment = true;
          _selectedEquipmentType = null;
          break;
        case menu_item.MenuItem.noEquipment:
          _selectedEquipmentType = EquipmentType.NoEquipment;
          break;
        case menu_item.MenuItem.barbell:
          _selectedEquipmentType = EquipmentType.Barbell;
          break;
        case menu_item.MenuItem.dumbbell:
          _selectedEquipmentType = EquipmentType.Dumbbell;
          break;
        case menu_item.MenuItem.kettlebell:
          _selectedEquipmentType = EquipmentType.Kettlebell;
          break;
        case menu_item.MenuItem.machine:
          _selectedEquipmentType = EquipmentType.Machine;
          break;
        case menu_item.MenuItem.plate:
          _selectedEquipmentType = EquipmentType.Plate;
          break;
        case menu_item.MenuItem.resistanceBand:
          _selectedEquipmentType = EquipmentType.ResistanceBand;
          break;
        case menu_item.MenuItem.suspensionBand:
          _selectedEquipmentType = EquipmentType.SuspensionBand;
          break;
        case menu_item.MenuItem.other:
          _selectedEquipmentType = EquipmentType.Other;
          break;
      }
    });
  }

  _onSelectedMuscle(BuildContext context, CreatePlanMenuItemModel item) {
    setState(() {
      switch (item) {
        case menu_item.MenuItem.allMuscles:
          _allMuscle = true;
          _selectedMuscle = null;
          break;
        case menu_item.MenuItem.abdominals:
          _selectedMuscle = Muscle.Abdominals;
          break;
        case menu_item.MenuItem.abductors:
          _selectedMuscle = Muscle.Abductors;
          break;
        case menu_item.MenuItem.adductors:
          _selectedMuscle = Muscle.Adductors;
          break;
        case menu_item.MenuItem.lowerBack:
          _selectedMuscle = Muscle.LowerBack;
          break;
        case menu_item.MenuItem.upperBack:
          _selectedMuscle = Muscle.UpperBack;
          break;
        case menu_item.MenuItem.biceps:
          _selectedMuscle = Muscle.Biceps;
          break;
        case menu_item.MenuItem.cardio:
          _selectedMuscle = Muscle.Cardio;
          break;
        case menu_item.MenuItem.chest:
          _selectedMuscle = Muscle.Chest;
          break;
        case menu_item.MenuItem.calves:
          _selectedMuscle = Muscle.Calves;
          break;
        case menu_item.MenuItem.forearms:
          _selectedMuscle = Muscle.Forearms;
          break;
        case menu_item.MenuItem.glutes:
          _selectedMuscle = Muscle.Glutes;
          break;
        case menu_item.MenuItem.hamstrings:
          _selectedMuscle = Muscle.Hamstrings;
          break;
        case menu_item.MenuItem.lats:
          _selectedMuscle = Muscle.Lats;
          break;
        case menu_item.MenuItem.shoulders:
          _selectedMuscle = Muscle.Shoulders;
          break;
        case menu_item.MenuItem.traps:
          _selectedMuscle = Muscle.Traps;
          break;
        case menu_item.MenuItem.triceps:
          _selectedMuscle = Muscle.Triceps;
          break;
        case menu_item.MenuItem.quadriceps:
          _selectedMuscle = Muscle.Quadriceps;
          break;
        case menu_item.MenuItem.olympic:
          _selectedMuscle = Muscle.Olympic;
          break;
        case menu_item.MenuItem.fullBody:
          _selectedMuscle = Muscle.FullBody;
          break;
        case menu_item.MenuItem.others:
          _selectedMuscle = Muscle.Other;
          break;
      }
    });
  }

  void _filterExercises(value) {
    setState(() {
      if (_searchTxtController.text.isEmpty &&
          _selectedEquipmentType == null &&
          _selectedMuscle == null) {
        _filteredExercises = _exercises!;
      } else if (_searchTxtController.text.isEmpty &&
          _selectedEquipmentType != null &&
          _selectedMuscle == null) {
        _filteredExercises = _exercises!
            .where((exItem) => exItem.equipmentType == _selectedEquipmentType)
            .toList();
      } else if (_searchTxtController.text.isEmpty &&
          _selectedEquipmentType != null &&
          _selectedMuscle != null &&
          _selectedEquipmentType != EquipmentType.AllEquipments &&
          _selectedMuscle != Muscle.AllMuscles) {
        _filteredExercises = _exercises!
            .where((exItem) =>
        exItem.equipmentType == _selectedEquipmentType &&
            exItem.muscle == _selectedMuscle)
            .toList();
      } else if (_searchTxtController.text.isEmpty &&
          _selectedEquipmentType == null &&
          _selectedMuscle != null) {
        _filteredExercises = _exercises!
            .where((exItem) => exItem.muscle == _selectedMuscle)
            .toList();
      } else if (_searchTxtController.text.isNotEmpty &&
          _selectedEquipmentType == null &&
          _selectedMuscle == null) {
        _filteredExercises = _exercises!
            .where((exItem) =>
            exItem.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      } else if (_searchTxtController.text.isNotEmpty &&
          _selectedEquipmentType != null &&
          _selectedMuscle == null) {
        _filteredExercises = _exercises!
            .where((exItem) =>
        exItem.name.toLowerCase().contains(value.toLowerCase()) &&
            exItem.equipmentType == _selectedEquipmentType)
            .toList();
      } else if (_searchTxtController.text.isNotEmpty &&
          _selectedEquipmentType != null &&
          _selectedMuscle != null &&
          _selectedEquipmentType != EquipmentType.AllEquipments &&
          _selectedMuscle != Muscle.AllMuscles) {
        _filteredExercises = _exercises!
            .where((exItem) =>
        exItem.name.toLowerCase().contains(value.toLowerCase()) &&
            exItem.equipmentType == _selectedEquipmentType &&
            exItem.muscle == _selectedMuscle)
            .toList();
      } else if (_searchTxtController.text.isNotEmpty &&
          _selectedEquipmentType == null &&
          _selectedMuscle != null) {
        _filteredExercises = _exercises!
            .where((exItem) =>
        exItem.name.toLowerCase().contains(value.toLowerCase()) &&
            exItem.muscle == _selectedMuscle)
            .toList();
        //####
      } else if (_searchTxtController.text.isEmpty &&
          _allEquipment &&
          _allMuscle) {
        _filteredExercises = _exercises!;
      } else if (_searchTxtController.text.isNotEmpty &&
          _allEquipment &&
          _allMuscle) {
        _filteredExercises = _exercises!
            .where((exItem) =>
            exItem.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      } else if (_searchTxtController.text.isEmpty &&
          _allEquipment &&
          _selectedMuscle != null) {
        _filteredExercises = _exercises!
            .where((exItem) => exItem.muscle == _selectedMuscle)
            .toList();
      } else if (_searchTxtController.text.isEmpty &&
          _selectedEquipmentType != null &&
          _allMuscle) {
        _filteredExercises = _exercises!
            .where((exItem) => exItem.equipmentType == _selectedEquipmentType)
            .toList();
      }
    });
  }

  PopupMenuItem<CreatePlanMenuItemModel> _buildPupItem(
      CreatePlanMenuItemModel item) =>
      PopupMenuItem<CreatePlanMenuItemModel>(
        value: item,
        child: Text(
          item.text,
        ),
      );

  Widget _buildButton(Function function, String title) {
    return
      //   Flexible(
      //   flex: 1,
      //   fit: FlexFit.tight,
      //   child: InkWell(
      //     onTap: () {
      //       function();
      //     },
      //     borderRadius: BorderRadius.circular(8),
      //     splashColor: Colors.yellow,
      //     child: Container(
      //       height: 45,
      //       margin: const EdgeInsets.only(left: 10, right: 10),
      //       padding: const EdgeInsets.only(left: 10, right: 10),
      //       decoration: BoxDecoration(
      //           color: const Color(0xfff5cb5c),
      //           borderRadius: BorderRadius.circular(8)),
      //       child: Center(
      //         child: Text(
      //           title,
      //           style: const TextStyle(
      //               color: Color(0xff242423),
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //     ),
      //   ),
      // );
      Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: ElevatedButton(
          onPressed: () {
            function();
          },
          child: Text(title),
        ),
      );
  }

  Widget _buildListItem(List? items, int i, bool selected) {
    return GestureDetector(
      onTap: () {
        if (items != null) {
          setState(() {
            items[i].isSelected = !items[i].isSelected;
            if (items[i].isSelected == true) {
              _selectedExercises.add(Exercise(
                  items[i].id,
                  items[i].name,
                  items[i].image,
                  items[i].needEquipment,
                  true,
                  items[i].equipmentType,
                  items[i].muscle,
                  items[i].difficulty));
            } else if (items[i].isSelected == false) {
              _selectedExercises
                  .removeWhere((element) => element.id == items[i].id);
            }
          });
        }
      },
      child: Container(
          height: MediaQuery.of(context).size.height / 11,
          width: MediaQuery.of(context).size.width / 1.5,
          padding: EdgeInsets.only(
              left: selected ? 0 : 15,
              right: 15,
              top: selected ? 0 : 10,
              bottom: selected ? 0 : 10),
          margin: EdgeInsets.only(left: selected ? 30 : 15, right: 15, top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 11,
                width: 10,
                decoration: BoxDecoration(
                  color: selected ? Colors.yellow : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
              ),
              Gap(selected ? 10 : 0),
              Container(
                height: MediaQuery.of(context).size.height / 11 - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image.asset(
                    items![i].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[i].name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Muscle: ${items[i].muscle.toString().substring(7)}',
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    //const Spacer(),
                    Text(
                      'Equipment: ${items[i].equipmentType.toString().substring(14)}',
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final planId =
    ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Column(
        children: [
          // AppBar
          Container(
            height: (Get.size.height) / 11,
            width: Get.size.width,
            padding: const EdgeInsets.only(
              //top: MediaQuery.of(context).padding.top,
              top: 30,
              left: 20,
              right: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    flu.FluentIcons.back,
                    size: 20,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    children: [
                      TextSpan(
                        text: 'Add ',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      TextSpan(
                        text: 'Exercise ',
                      ),
                    ],
                  ),
                ),
                //TODO: Create one appBar item!!!!!!
                const Gap(50),
                // TextButton(child: Text('save',style:TextStyle(color: Colors
                //     .black,fontSize: 16)),onPressed:
                // _savePlan,)
                // const Icon(
                //   flu.FluentIcons.accept,
                //   size: 20,
                // ),
              ],
            ),
          ),

          //Text Field (Plan title)
          // if (planId == null)
          //   Padding(
          //     padding: const EdgeInsets.only(left: 15, right: 15),
          //     child: Container(
          //       alignment: Alignment.centerLeft,
          //       decoration: BoxDecoration(
          //         color: const Color(0xfff5f5f5),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       height: 45,
          //       padding: const EdgeInsets.only(left: 10, right: 35),
          //       child: TextField(
          //         controller: _planNameController,
          //         maxLines: 1,
          //         maxLength: 35,
          //         keyboardType: TextInputType.text,
          //         //cursorHeight: 22,
          //         cursorColor: Colors.yellow,
          //         style: const TextStyle(
          //           color: Colors.black54,
          //         ),
          //         decoration: InputDecoration(
          //           errorText: _validate ? 'Value Can\'t Be Empty' : null,
          //           // border: InputBorder.none,
          //           hintText: 'Plan title',
          //           // hintStyle: TextStyle(
          //           //   color: Colors.black38,
          //           // ),
          //         ),
          //       ),
          //     ),
          //   ),
          // const Gap(10),

          // Search TextField
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              controller: _searchTxtController,
              cursorColor: Colors.yellow,
              keyboardType: TextInputType.text,
              style: const TextStyle(
                  fontWeight: FontWeight.normal, fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Search Exercise',
                filled: true,
                fillColor: Colors.black12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Colors.transparent,
                      style: BorderStyle.none,
                      width: 0),
                ),
                hintStyle: const TextStyle(
                  color: Color(0xff2e2e2e),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                suffixIconColor: const Color(0xfff1f123),
                prefixIconColor: const Color(0xfff1f123),
                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Colors.transparent,
                      style: BorderStyle.none,
                      width: 0),
                ),
                disabledBorder: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Colors.transparent,
                      style: BorderStyle.none,
                      width: 0),
                ),
                prefixIcon: const Icon(
                  flu.FluentIcons.search,
                  size: 20,
                ),
              ),
              onChanged: (value) {
                _filterExercises(value);
              },
            ),
          ),

          // Row of button
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // All Equipment popup menu button
                Flexible(
                  flex: 1,
                  child: PopupMenuButton<CreatePlanMenuItemModel>(
                    elevation: 10,
                    position: PopupMenuPosition.under,
                    //initialValue: menItem.MenuItem.allEquipments,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    constraints: BoxConstraints(minWidth: size.width / 2),
                    offset: const Offset(5, 10),
                    onSelected: (item) {
                      _onSelectedEquipment(context, item);
                      _filterExercises(_searchTxtController.text.isEmpty
                          ? null
                          : _searchTxtController.text);
                    },
                    itemBuilder: ((context) => [
                      ...menu_item.MenuItem.selectEquipmentItems
                          .map(_buildPupItem)
                          .toList(),
                    ]),
                    child: Container(
                      width: size.width / 2.5,
                      height: 45,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xfff1f1f1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          _selectedEquipmentType == null
                              ? 'Equipment'
                              : _selectedEquipmentType.toString().substring(14),
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
                // All Equipment popup menu button
                Flexible(
                  flex: 1,
                  child: PopupMenuButton<CreatePlanMenuItemModel>(
                    elevation: 10,
                    position: PopupMenuPosition.under,
                    //initialValue: menItem.MenuItem.allMuscles,
                    constraints: BoxConstraints(minWidth: size.width / 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    offset: const Offset(-5, 10),
                    onSelected: (item) {
                      _onSelectedMuscle(context, item);
                      _filterExercises(_searchTxtController.text.isEmpty
                          ? null
                          : _searchTxtController.text);
                    },
                    itemBuilder: ((context) => [
                      ...menu_item.MenuItem.selectMuscleItems
                          .map(_buildPupItem)
                          .toList(),
                    ]),
                    child: Container(
                      width: size.width / 2.5,
                      height: 45,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xfff1f1f1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          _selectedMuscle == null
                              ? 'Muscle'
                              : _selectedMuscle.toString().substring(7),
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ListView (Exercise)
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _filteredExercises.isNotEmpty
                  ? _filteredExercises.length
                  : _exercises!.length,
              itemBuilder: (ctx, i) => _buildListItem(
                  _filteredExercises.isNotEmpty
                      ? _filteredExercises
                      : _exercises,
                  i,
                  _filteredExercises.isNotEmpty
                      ? _filteredExercises[i].isSelected
                      : _exercises![i].isSelected),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 15,
              left: 10,
              right: 10,
            ),
            padding: const EdgeInsets.only(top: 5),
            height: size.height / 19,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(() {},
                    'Delete All  (${_selectedExercises.length.toString()})'),
                const Gap(15),
                _buildButton(() {
                  if (planId != null) {
                    for (var element in _exercises!) {
                      if (element.isSelected == true) {
                        element.isSelected = false;
                      }
                    }
                    Navigator.of(context).pop(_selectedExercises);
                    return;
                  }
                  if (_planNameController.text.isEmpty) {
                    setState(() {
                      _validate = true;
                    });
                    return;
                  }
                  // Provider.of<Plans>(context, listen: false).addCustomPlan(
                  //     _selectedExercises, _planNameController.text);
                  //TODO: check these codes
                  for (var element in _exercises!) {
                    if (element.isSelected == true) {
                      element.isSelected = false;
                    }
                  }
                  Navigator.of(context).pop();
                }, planId != null ? 'Add Exercises' : 'Save Plan')
              ],
            ),
          )
        ],
      ),
    );
  }
}

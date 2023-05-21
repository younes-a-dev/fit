import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart' as ts;
import 'package:workout/model/session_model.dart';
import '../../model/menu_item_model.dart';
import '../../provider/plan.dart';
import '../../res/colors.dart';
import '../../widgets/custom_textfield_widget.dart';
import '../../widgets/menu_item.dart' as menu_item;
import 'package:fluent_ui/fluent_ui.dart' as flu;

import '../../provider/exercise.dart';

class CreatePlanScreen extends StatefulWidget {
  const CreatePlanScreen({Key? key}) : super(key: key);

  static const routeName = '/ Create Custom plan screen --> creeate plan '
      'screen';

  @override
  State<CreatePlanScreen> createState() => _CreatePlanScreenState();
}

class _CreatePlanScreenState extends State<CreatePlanScreen> {
  final _planNameController = TextEditingController();
  final _searchTxtController = TextEditingController();
  final List<TextEditingController> _controllers = [];
  late PageController _pageController;
  final GlobalKey<FormState> _formKey = GlobalKey();

  List<String> _sessionNames = [];
  List<SessionModel> _sessions = [];
  List<Exercise>? _exercises = [];
  List<Exercise> _filteredExercises = [];
  List<Exercise> _selectedExercises = [];
  EquipmentType? _selectedEquipmentType;
  Muscle? _selectedMuscle;
  bool _allEquipment = false;
  bool _allMuscle = false;
  bool _validate = false;
  bool? _canSwipePage;
  int toggleButtonInitIndex = 2;
  int? textFieldCount = 3;
  PlanSessionType? planSessionType;
  int _currentSession = 0;

  void _createSessionNames(int textFieldCount) {
    _sessionNames =
        List.generate(textFieldCount, (index) => _controllers[index].text);
    if (textFieldCount == 1) {
      planSessionType = PlanSessionType.singleSession;
    } else {
      planSessionType = PlanSessionType.multiSession;
    }
  }

  void _canNavigate() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      _canSwipePage = false;
    } else {
      _canSwipePage = true;
    }
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    for (int i = 0; i < 6; i++) {
      _controllers.add(TextEditingController());
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final exerciseData = Provider.of<Exercises>(context).items;
    _exercises = exerciseData;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _planNameController.dispose();
    _searchTxtController.dispose();
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
        height: 35,
        child: Center(
          child: Text(
            item.text,
            //textAlign: TextAlign.center,
            style:  TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      );

  Widget _buildButton(int flex, Function function, String title) {
    return Flexible(
      flex: flex,
      fit: FlexFit.tight,
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
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
          margin: EdgeInsets.only(left: selected ? 25 : 15, right: 15, top: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 11,
                width: 10,
                decoration: BoxDecoration(
                  color:
                      selected ? MyColors.mainColor : Theme.of(context).primaryColorDark,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
              ),
              Gap(selected ? 5 : 0),
              Container(
                height: MediaQuery.of(context).size.height / 11 - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(color: MyColors.grey, width: 1),
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
                      style:  TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Muscle: ${items[i].muscle.toString().substring(7)}',
                      style: const TextStyle(color: MyColors.grey, fontSize:
                      16),
                    ),
                    //const Spacer(),
                    Text(
                      'Equipment: ${items[i].equipmentType.toString().substring(14)}',
                      style: const TextStyle(color: MyColors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildTextField(
    String title,
    TextEditingController controller,
    // double height,
  ) {
    return SizedBox(
      // height: height,
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
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Provide a value';
            }
            return null;
          },
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final planId = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      // AppBAr
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Create Plan',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: PageView(
        physics: _canSwipePage == true
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            // TODO: check this code
            // if (_sessionNames.isEmpty) {
            //   _createSessionNames(textFieldCount!);
            // }
          });
        },
        children: [
          // First Page
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(25),
                  // Plan name TextField
                  _buildTextField(
                    'Plan Name',
                    _planNameController,
                  ),
                  const Gap(35),
                  // Toggle Button ( Session count )
                  Text(
                    'How many sessions a week do you want to train?',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(15),
                  Align(
                    alignment: Alignment.center,
                    child: ts.ToggleSwitch(
                      minWidth: size.width / 3,
                      minHeight: 60.0,
                      fontSize: 16.0,
                      initialLabelIndex: toggleButtonInitIndex,
                      activeBgColor: const [MyColors.mainColor],
                      activeFgColor: MyColors.black,
                      inactiveBgColor: Theme.of(context).primaryColorDark,
                      inactiveFgColor: MyColors.grey,
                      totalSwitches: 6,
                      labels: const [
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                      ],
                      onToggle: (i) {
                        setState(() {
                          if (i == 0) {
                            toggleButtonInitIndex = 0;
                            textFieldCount = 1;
                          } else if (i == 1) {
                            toggleButtonInitIndex = 1;
                            textFieldCount = 2;
                          } else if (i == 2) {
                            toggleButtonInitIndex = 2;
                            textFieldCount = 3;
                          } else if (i == 3) {
                            toggleButtonInitIndex = 3;
                            textFieldCount = 4;
                          } else if (i == 4) {
                            toggleButtonInitIndex = 4;
                            textFieldCount = 5;
                          } else if (i == 5) {
                            toggleButtonInitIndex = 5;
                            textFieldCount = 6;
                          }
                          if (_sessionNames.isNotEmpty) {
                            _sessionNames.clear();
                          }
                          _createSessionNames(textFieldCount!);
                        });
                      },
                    ),
                  ),
                  const Gap(35),
                  // List of TextField ( for Session name )
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: List.generate(
                          textFieldCount!,
                          (index) => Column(
                            children: [
                              _buildTextField(
                                '${index + 1}th Session Name',
                                _controllers[index],
                              ),
                              const Gap(10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Button ( for add exercise to sessions )
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _canNavigate();
                        if (_canSwipePage!) {
                          _pageController.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut);
                        }
                        _createSessionNames(textFieldCount!);
                      });
                    },
                    child: const Text('Add Exercise To Sessions'),
                  )
                ],
              ),
            ),
          ),

          // Second Page
          Column(children: [
            CustomTextFieldWidget(
              controller: _searchTxtController,
              hintText: 'Search exercise',
              prefixIcon: flu.FluentIcons.search,
              onChangeFunction: (value) {
                _filterExercises(value);
              },
            ),
            //current Session
            Container(
              height: 35,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: _sessionNames.isEmpty
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You are on  ',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          _sessionNames[_currentSession],
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '  Session',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
            ),
            // Row of button ( for choose muscles in equipments )
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: Row(
                children: [
                  //All Equipment popup menu button
                  Flexible(
                    flex: 1,
                    child: PopupMenuButton<CreatePlanMenuItemModel>(
                      //elevation: 5,
                      color: Theme.of(context).primaryColorDark,
                      position: PopupMenuPosition.under,
                      //initialValue: menItem.MenuItem.allEquipments,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      constraints: BoxConstraints(
                          minWidth: size.width / 3 - 70,
                          maxWidth: size.width / 2.9),
                      offset: const Offset(0, 10),
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
                        width: double.infinity,
                        height: 35,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            _selectedEquipmentType == null
                                ? 'Equipment'
                                : _selectedEquipmentType
                                    .toString()
                                    .substring(14),
                            style: const TextStyle(
                                color: MyColors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // All Muscle popup menu button
                  Flexible(
                    flex: 1,
                    child: PopupMenuButton<CreatePlanMenuItemModel>(
                      // elevation: 10,
                      color: Theme.of(context).primaryColorDark,
                      position: PopupMenuPosition.under,
                      //initialValue: menItem.MenuItem.allMuscles,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      constraints: BoxConstraints(
                          minWidth: size.width / 3 - 70,
                          maxWidth: size.width / 2.9),
                      offset: const Offset(0, 20),
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
                        width: double.infinity,
                        height: 35,
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            _selectedMuscle == null
                                ? 'Muscle'
                                : _selectedMuscle.toString().substring(7),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: MyColors.grey,
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
            // Row of Button ( for delete an save session )
            Container(
              margin: const EdgeInsets.only(
                bottom: 15,
                left: 10,
                right: 10,
                top: 5,
              ),
              padding: const EdgeInsets.only(top: 5),
              height: size.height / 19,
              color: Colors.transparent,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Delete  All selected Exercise
                  _buildButton(1, () {
                    setState(() {
                      for (var element in _exercises!) {
                        if (element.isSelected == true) {
                          element.isSelected = false;
                        }
                      }
                      _selectedExercises = [];
                    });
                  }, 'Delete All  (${_selectedExercises.length.toString()})'),
                  const Gap(5),
                  // _buildButton(() {
                  //   if (planId != null) {
                  //     for (var element in _exercises!) {
                  //       if (element.isSelected == true) {
                  //         element.isSelected = false;
                  //       }
                  //     }
                  //     Navigator.of(context).pop(_selectedExercises);
                  //     return;
                  //   }
                  //   if (_planNameController.text.isEmpty) {
                  //     setState(() {
                  //       _validate = true;
                  //     });
                  //     return;
                  //   }
                  //   // Provider.of<Plans>(context, listen: false).addCustomPlan(
                  //   //     _selectedExercises, _planNameController.text);
                  //   //TODO: check these codes
                  //   for (var element in _exercises!) {
                  //     if (element.isSelected == true) {
                  //       element.isSelected = false;
                  //     }
                  //   }
                  //   Navigator.of(context).pop();
                  // }, planId != null ? 'Add Exercises' : 'Save Plan'),
                  // save session button
                  _buildButton(
                    2,
                    () {
                      // _createPlanSessions(_currentSession,
                      //     _sessionNames[_currentSession], _selectedExercises);

                      if (_sessionNames.length != _sessions.length) {
                        var session = SessionModel(
                          id: DateTime.now().toString(),
                          sessionName: _sessionNames[_currentSession],
                          sessionExercises: _selectedExercises,
                        );
                        _sessions.insert(_currentSession, session);
                        // print('session count:  ' + _sessions[0]
                        //     .sessionExercises!.length.toString());
                      }

                      if (_currentSession < _sessionNames.length - 1) {
                        setState(() {
                          _currentSession++;
                        });
                      }
                      _selectedExercises = [];

                      if (_sessions.length == _sessionNames.length) {
                        Provider.of<Plans>(context, listen: false)
                            .addCustomPlan(_sessions, _planNameController.text,
                                planSessionType!);

                        for (var element in _exercises!) {
                          if (element.isSelected == true) {
                            element.isSelected = false;
                          }
                        }
                        Navigator.of(context).pop();
                      }

                      for (var element in _exercises!) {
                        if (element.isSelected == true) {
                          element.isSelected = false;
                        }
                      }
                    },
                    _currentSession + 1 == textFieldCount
                        ? 'Create Plan'
                        : 'Save '
                            'this '
                            'Session',
                  ),
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:workout/screen/main/add_exercise_screen.dart';

import '../../provider/exercise.dart';
import '../../provider/plan.dart';
import '../../res/colors.dart';

class EditCustomPlanScreen extends StatefulWidget {
  const EditCustomPlanScreen({Key? key}) : super(key: key);

  static const routeName = '/Selected Custom plan --> edit plan screen';

  @override
  State<EditCustomPlanScreen> createState() => _EditCustomPlanScreenState();
}

class _EditCustomPlanScreenState extends State<EditCustomPlanScreen> {
  final _planNameController = TextEditingController();

  late final Plan plan;

  //late final List<SessionModel> sessions;
  List<Exercise>? selectedSessionExercise;
  List<Exercise> addedList = [];
  List<String> planIds = [];
  bool _isInit = true;
  String? _dropDownValue;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final routeArgs = ModalRoute.of(context)!.settings.arguments as Plan;
      plan = routeArgs;
      final planName = plan.name;
      _planNameController.text = planName!;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  // List of Exercise for selected session
  void _getExerciseList(String selectedValue) {
    var session = plan.planSessions!
        .firstWhere((element) => element.sessionName == _dropDownValue);
    selectedSessionExercise = session.sessionExercises;
  }

  // update specific session when new exercise add to that
  void _createNewSession() {
    var editedSessionIndex = plan.planSessions!
        .indexWhere((element) => element.sessionName == _dropDownValue);
    plan.planSessions![editedSessionIndex].sessionExercises =
        selectedSessionExercise;
  }

  void _removeSingleExercise(
    String exerciseId,
  ) {
    var exerciseSessionsIndex = plan.planSessions!
        .indexWhere((element) => element.sessionName == _dropDownValue);
    plan.planSessions![exerciseSessionsIndex].sessionExercises!
        .removeWhere((element) => element.id == exerciseId);
  }

  Widget _buildListItem(
    List? items,
    String planId,
    int i,
    // bool selected,
  ) {
    return GestureDetector(
      child: Dismissible(
        key: ValueKey(items![i].id),
        direction: DismissDirection.endToStart,
        background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            margin: const EdgeInsets.only(right: 25, top: 5),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(16)),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            )),
        onDismissed: (direction) {
          // Provider.of<Plans>(context, listen: false)
          //     .removeSingleExerciseFromCustomPlan(planId, items[i].id, i);
          _removeSingleExercise(selectedSessionExercise![i].id);
        },
        child: Container(
            height: MediaQuery.of(context).size.height / 11,
            // width: MediaQuery.of(context).size.width / 1.5,
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            margin: const EdgeInsets.only(left: 25, right: 25, top: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 11,
                  width: 10,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 11 - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset(
                      items[i].image,
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
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      //const Spacer(),
                      Text(
                        'Equipment: ${items[i].equipmentType.toString().substring(14)}',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildTextField(
    String title,
    TextEditingController controller,
    //Function function,
    // double height,
  ) {
    return SizedBox(
      // height: height,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Plan Name',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(10),
        TextFormField(
          controller: controller,
          // validator: (value) {
          //   if (value!.isEmpty) {
          //     return 'Please Provide a value';
          //   }
          //   return null;
          // },
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
          //onChanged: function(),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: (size.height) / 12,
            width: size.width,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 15,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  'Edit Plan',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),

                // Update Button
                TextButton(
                  onPressed: () {
                    var editedPlan = Plan(
                      planSessions: plan.planSessions,
                      name: _planNameController.text,
                      id: plan.id,
                      workoutType: WorkoutType.customPlan,
                      // exerciseCount: sessionExercise.length,
                    );
                    Provider.of<Plans>(context, listen: false)
                        .updateCustomPlan(plan.id as String, editedPlan);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'UPDATE',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ),

          // TextField for edit plan name
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: _buildTextField(plan.name as String, _planNameController),
          ),
          const Gap(15),
          // Popup Button
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            margin: const EdgeInsets.only(left: 25, right: 25),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              items: plan.planSessions!
                  .map(
                    (e) => DropdownMenuItem<String>(
                      value: e.sessionName,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        e.sessionName as String,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              value: _dropDownValue,
              onChanged: (value) {
                setState(() {
                  _dropDownValue = value as String;
                  _getExerciseList(value);
                });
              },
              hint: Text(
                'Choose Session',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              elevation: 1,
              dropdownColor: Theme.of(context).primaryColorDark,
              alignment: Alignment.center,
              borderRadius: BorderRadius.circular(5),
              isExpanded: true,
              underline: const SizedBox(),
              iconEnabledColor: MyColors.mainColor,
              focusColor: Colors.red,
            ),
          ),
          const Gap(20),

          // Exercise ListView
          selectedSessionExercise == null
              ? const Center(child: SizedBox())
              : Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: selectedSessionExercise!.length,
                    itemBuilder: (ctx, i) => _buildListItem(
                        selectedSessionExercise, plan.id as String, i),
                  ),
                ),
          // const Spacer(),

          // Add Exercise button
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(
                AddExerciseScreen.routeName,
                arguments: plan.id,
              )
                  .then((value) {
                selectedSessionExercise!.addAll(value as List<Exercise>);
                // // TODO: i don`t know why its work!!!!!!!
                final ids = Set();
                selectedSessionExercise!.retainWhere((x) => ids.add(x.id));
              }).then((_) => setState(() {}));
              _createNewSession();
            },
            style: ButtonStyle(
              maximumSize: MaterialStatePropertyAll(
                Size(size.width * .9, 40),
              ),
            ),
            child: Text('ADD EXERCISE'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:gap/gap.dart';
import 'package:workout/model/menu_item_model.dart';
import 'package:workout/screen/on_bording_screen.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import '../../provider/plan.dart';
import '../../res/colors.dart';
import '../../widgets/custom_plans_item.dart';
import 'create_plan_screen.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../widgets/menu_item.dart' as menItem;

class CreateCustomPlanScreen extends StatefulWidget {
  const CreateCustomPlanScreen({Key? key}) : super(key: key);

  static const routeName = '/Create custom plan Screen';

  @override
  State<CreateCustomPlanScreen> createState() => _CreateCustomPlanScreenState();
}

class _CreateCustomPlanScreenState extends State<CreateCustomPlanScreen> {
  Future<void> _refreshPlans(BuildContext context) async {
    Provider.of<Plans>(context, listen: false).items;
  }

  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var mini = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);
  var selectedfABLocation = FloatingActionButtonLocation.endDocked;
  var items = [
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.centerTop,
    FloatingActionButtonLocation.endTop,
  ];

  @override
  Widget build(BuildContext context) {
    final allPlans = Provider.of<Plans>(context).items;
    final customPlans = allPlans
        .where((plans) => plans.workoutType == WorkoutType.customPlan)
        .toList();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          // Appbar
          Container(
            height: (size.height) / 10,
            width: size.width,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 20,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                    ),
                    children: const [
                      TextSpan(
                        text: 'Create\n',
                      ),
                      TextSpan(
                        text: 'Custom ',
                        style: TextStyle(
                          color: MyColors.mainColor,
                        ),
                      ),
                      TextSpan(
                        text: 'plan',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Gap(5),
                PopupMenuButton<CreateCustomPlanMenuItemModel>(
                  color: Theme.of(context).primaryColorDark,
                  icon: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: MyColors.mainColor,
                      size: 20,
                    ),
                  ),
                  iconSize: MediaQuery.of(context).size.height / 22,
                  offset: const Offset(-30, 30),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: ((context) => [
                        //PopupMenuDivider(),
                        ...menItem.MenuItem.createPlanKind
                            .map(buildItem)
                            .toList(),
                        //PopupMenuDivider(),
                      ]),
                )
              ],
            ),
          ),

          // Add exercise section ( image-text-button)
          Expanded(
            child: customPlans.isNotEmpty
                ? RefreshIndicator(
                    onRefresh: () => _refreshPlans(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: customPlans.length,
                        itemBuilder: (ctx, i) =>
                            CustomPlansItem(id: customPlans[i].id as String),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Gap(size.height / 4),
                      Image.asset(
                        height: 30,
                        width: 30,
                        'assets/images/dumbbell.png',
                        color: MyColors.mainColor,
                      ),
                      const Gap(10),
                      const Text(
                        'get started by create custom plan or take from us a plan according to your specification',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
      floatingActionButtonLocation: selectedfABLocation,
      floatingActionButton: SpeedDial(
        // animatedIcon: AnimatedIcons.menu_close,
        // animatedIconTheme: IconThemeData(size: 22.0),
        // / This is ignored if animatedIcon is non null
        // child: Text("open"),
        // activeChild: Text("close"),
        // activeBackgroundColor: Colors.transparent,
        // activeForegroundColor: Theme.of(context).primaryColorDark,
        overlayColor: Colors.transparent,
        overlayOpacity: 0,
        icon: Icons.add,
        activeIcon: Icons.close,
        spacing: 3,
        mini: mini,
        openCloseDial: isDialOpen,
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 4,
        dialRoot: customDialRoot
            ? (ctx, open, toggleChildren) {
                return ElevatedButton(
                  onPressed: toggleChildren,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 18),
                  ),
                  child: const Text(
                    "Custom Dial Root",
                    style: TextStyle(fontSize: 17),
                  ),
                );
              }
            : null,
        buttonSize: buttonSize,
        // it's the SpeedDial size which defaults to 56 itself
        // iconTheme: IconThemeData(size: 22),
        label: extend ? const Text("Open") : null,
        // The label of the main button.
        /// The active label of the main button, Defaults to label if not specified.
        activeLabel: extend ? const Text("Close") : null,

        /// Transition Builder between label and activeLabel, defaults to FadeTransition.
        // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
        /// The below button size defaults to 56 itself, its the SpeedDial childrens size
        childrenButtonSize: childrenButtonSize,
        visible: visible,
        direction: speedDialDirection,
        switchLabelPosition: switchLabelPosition,

        /// If true user is forced to close dial manually
        closeManually: closeManually,

        /// If false, backgroundOverlay will not be rendered.
        renderOverlay: renderOverlay,
        // overlayColor: Colors.black,
        // overlayOpacity: 0.5,
        onOpen: () => debugPrint('OPENING DIAL'),
        onClose: () => debugPrint('DIAL CLOSED'),
        useRotationAnimation: useRAnimation,
        tooltip: 'Open Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        foregroundColor: MyColors.mainColor,
        backgroundColor: Theme.of(context).primaryColorDark,
        // activeForegroundColor: Colors.red,
        // activeBackgroundColor: Colors.blue,
        elevation: 0,
        animationCurve: Curves.easeInOut,
        isOpenOnStart: false,
        shape: customDialRoot
            ? const RoundedRectangleBorder()
            : const StadiumBorder(),
        // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          SpeedDialChild(
            child: !rmicons ? const Icon(Icons.add) : null,
            elevation: 0,
            // labelShadow: [
            //   const BoxShadow(
            //     spreadRadius: 0,
            //     blurRadius: 0,
            //     offset: Offset(0, 0), // changes position of shadow
            //   ),
            // ],
            // shape: RoundedRectangleBorder(
            //   side: BorderSide(
            //     color: Colors.greenAccent,
            //   ),
            // ),
            labelWidget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(5),
              ),
              child:  Text(
                'Create Plan',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            backgroundColor: Theme.of(context).primaryColorDark,
            foregroundColor: MyColors.mainColor,
            //label: 'Create Plan',
            onTap: ()
                // => setState(() => rmicons = !rmicons),
                {
              Navigator.of(context).pushNamed(CreatePlanScreen.routeName);
            },
            // onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child: !rmicons ? const Icon(flu.FluentIcons.hexagon) : null,
            elevation: 0,
            labelWidget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(5),
              ),
              child:  Text('Take Plan',style:TextStyle(color:Theme.of(context).primaryColor)),
            ),
            backgroundColor: Theme.of(context).primaryColorDark,
            foregroundColor: MyColors.mainColor,
            // label: 'Take Plan',
            onTap: ()
                //=> debugPrint('SECOND CHILD'),
                {
              Navigator.of(context).pushNamed(OnBoardingScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  PopupMenuItem<CreateCustomPlanMenuItemModel> buildItem(
          CreateCustomPlanMenuItemModel item) =>
      PopupMenuItem<CreateCustomPlanMenuItemModel>(
        value: item,
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 5, right: 5),
          horizontalTitleGap: 0,
          leading: Icon(
            item.icon,
            color: MyColors.mainColor,
          ),
          title: Text(
            item.text,
            style:  TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
        ),
      );

  void onSelected(BuildContext context, CreateCustomPlanMenuItemModel item) {
    switch (item) {
      case menItem.MenuItem.createPlan:
        Navigator.of(context).pushNamed(CreatePlanScreen.routeName);
        break;
      case menItem.MenuItem.takePlan:
        Navigator.of(context).pushNamed(OnBoardingScreen.routeName);
        break;
    }
  }
}

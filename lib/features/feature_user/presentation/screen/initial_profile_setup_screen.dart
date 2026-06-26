import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:toggle_switch/toggle_switch.dart' as ts;

import '../../../../../bottom_navigator.dart';
import '../../../../common/params/complete_initial_setup_params.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/responsive/responsive_context.dart';
import '../../../../core/utils/dialog_helper.dart';
import '../../../../core/widgets/custom_textfield_widget.dart';
import '../../../../core/widgets/initial_button.dart';
import '../../../../core/widgets/loading_button.dart';
import '../../../../res/colors.dart';
import '../cubit/complete_initial_setup_status.dart';
import '../cubit/user_cubit.dart';

class InitialProfileSetupScreen extends StatefulWidget {
  const InitialProfileSetupScreen({super.key});

  static const routeName = 'InitUserInfo';

  @override
  State<InitialProfileSetupScreen> createState() => _InitialProfileSetupScreenState();
}

class _InitialProfileSetupScreenState extends State<InitialProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  Gender _selectedGender = Gender.male;
  WeekStartDay _selectedWeekStartDay = WeekStartDay.saturday;

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  bool _validateAndSubmit() {
    return _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {

        if (state.completeInitialSetupStatus is CompleteInitialSetupCompleted) {
          context.read<UserCubit>().resetStatus();
          Navigator.of(context).pushReplacementNamed(BottomNavigator.routeName);
        }

        if (state.completeInitialSetupStatus is CompleteInitialSetupError) {
          final error =
              (state.completeInitialSetupStatus as CompleteInitialSetupError)
                  .errorMessage;
          DialogHelper.showErrorDialog(
            context,
            title: 'Error',
            content: error,
          );
          context.read<UserCubit>().resetStatus();
        }
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.responsive(
                        mobile: 24,
                        tablet: 32,
                        desktop: 40,
                      ),
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildHeader(),
                          const Gap(40),
                          _buildUsernameField(),
                          const Gap(32),
                          _buildGenderSection(),
                          const Gap(32),
                          _buildWeekDaySection(),
                          const SizedBox(height: 40),
                          _buildContinueButton(),
                          const Gap(20),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome!',
          style: TextStyle(
            fontSize: context.responsive(
              mobile: 28,
              tablet: 32,
              desktop: 36,
            ),
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            fontFamily: 'Raleway',
          ),
        ),
        const Gap(8),
        Text(
          'Let\'s set up your profile',
          style: TextStyle(
            fontSize: context.responsive(
              mobile: 15,
              tablet: 16,
              desktop: 18,
            ),
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildUsernameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username',
          style: TextStyle(
            fontSize: context.responsive(
              mobile: 14,
              tablet: 15,
              desktop: 16,
            ),
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const Gap(8),
        CustomTextFormFieldWidget(
          controller: _usernameController,
          hintText: 'Enter your username',
          prefixIcon: Icons.person_outline_rounded,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Username is required';
            }
            if (value.trim().length < 5) {
              return 'Minimum 5 characters';
            }
            return null;
          },
          onChangeFunction: (_) {},
        ),
      ],
    );
  }

  Widget _buildGenderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: TextStyle(
            fontSize: context.responsive(
              mobile: 14,
              tablet: 15,
              desktop: 16,
            ),
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const Gap(12),
        Row(
          children: [
            Expanded(
              child: _genderCard(
                label: 'Male',
                icon: Icons.male_rounded,
                gender: Gender.male,
                isSelected: _selectedGender == Gender.male,
              ),
            ),
            const Gap(16),
            Expanded(
              child: _genderCard(
                label: 'Female',
                icon: Icons.female_rounded,
                gender: Gender.female,
                isSelected: _selectedGender == Gender.female,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Please select your gender',
          style: TextStyle(
            fontSize: context.responsive(
              mobile: 12,
              tablet: 13,
              desktop: 14,
            ),
            color: Colors.grey[500],
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _genderCard({
    required String label,
    required IconData icon,
    required Gender gender,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? MyColors.mainColor.withOpacity(0.08)
              : Colors.grey[50],
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            width: isSelected ? 2 : 1.5,
            color: isSelected ? MyColors.mainColor : Colors.grey[300]!,
          ),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: MyColors.mainColor.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ]
              : null,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: context.responsive(
                mobile: 32,
                tablet: 36,
                desktop: 40,
              ),
              color: isSelected ? MyColors.mainColor : Colors.grey[400],
            ),
            const Gap(8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: context.responsive(
                  mobile: 14,
                  tablet: 15,
                  desktop: 16,
                ),
                color: isSelected ? MyColors.mainColor : Colors.grey[600],
              ),
            ),
            if (isSelected) ...[
              const Gap(4),
              Container(
                width: 20,
                height: 3,
                decoration: BoxDecoration(
                  color: MyColors.mainColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildWeekDaySection() {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'First Day of Week',
          style: TextStyle(
            fontSize: context.responsive(
              mobile: 14,
              tablet: 15,
              desktop: 16,
            ),
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const Gap(12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ts.ToggleSwitch(
            key: ValueKey(_selectedWeekStartDay),
            minWidth: size.width / 3.2,
            minHeight: 48.0,
            fontSize: context.responsive(
              mobile: 13,
              tablet: 14,
              desktop: 15,
            ),
            isVertical: false,
            initialLabelIndex: _getInitialDayIndex(),
            activeBgColor: const [MyColors.mainColor],
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey[200]!,
            inactiveFgColor: Colors.grey[600]!,
            totalSwitches: 3,
            labels: const ['Sat', 'Sun', 'Mon'],
            onToggle: (index) {
              setState(() {
                if (index == 0) {
                  _selectedWeekStartDay = WeekStartDay.saturday;
                } else if (index == 1) {
                  _selectedWeekStartDay = WeekStartDay.sunday;
                } else {
                  _selectedWeekStartDay = WeekStartDay.monday;
                }
              });
            },
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Selected: ${_selectedWeekStartDay.name.toUpperCase()}',
          style: TextStyle(
            fontSize: context.responsive(
              mobile: 12,
              tablet: 13,
              desktop: 14,
            ),
            color: MyColors.mainColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  int _getInitialDayIndex() {
    switch (_selectedWeekStartDay) {
      case WeekStartDay.saturday:
        return 0;
      case WeekStartDay.sunday:
        return 1;
      case WeekStartDay.monday:
        return 2;
      default:
        return 0;
    }
  }

  Widget _buildContinueButton() {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state.completeInitialSetupStatus is CompleteInitialSetupLoading) {
          return const LoadingButton();
        }
        return SizedBox(
          width: double.infinity,
          child: InitialButton(
            onTap: () {
              if (_validateAndSubmit()) {
                final params = CompleteInitialSetupParams(
                  username: _usernameController.text.trim(),
                  gender: _selectedGender,
                  weekStartDay: _selectedWeekStartDay,
                );
                context.read<UserCubit>().completeInitialSetupEvent(params);
              }
            },
            title: 'Get Started',
          ),
        );
      },
    );
  }
}
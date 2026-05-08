import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/enums.dart';
import '../../../../res/colors.dart';
import '../../../feature_startup/presentation/screens/intro_slider.dart';
import '../cubit/language_cubit.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  static const String routeName = '/language_selection';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<LanguageCubit, LanguageState>(
      listener: (context, state) {
        if (state.saveLanguageStatus is SaveLanguageCompleted) {
          Navigator.pushReplacementNamed(context, IntroSlider.routeName);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(size.height / 9.5),

              // Logo
              SizedBox(
                height: size.height * .2,
                width: size.width * .7,
                child: Image.asset(
                  'assets/images/HexFit Logo.png',
                  color: MyColors.mainColor,
                ),
              ),

              const Gap(30),

              // Title
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                  ),
                  children: const [
                    TextSpan(text: 'CHOOSE'),
                    TextSpan(
                      text: ' LANGUAGE',
                      style: TextStyle(
                        color: MyColors.mainColor,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(10),

              // Subtitle
              Text(
                'انتخاب زبان',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).canvasColor,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const Gap(50),

              // Language Buttons
              BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, state) {
                  final isLoading = state.saveLanguageStatus is SaveLanguageLoading;
                  final selectedLanguage = state.saveLanguageStatus;

                  return Column(
                    children: [
                      // English Button
                      _LanguageButton(
                        title: 'English',
                        languageCode: 'EN',
                        isSelected: selectedLanguage == Language.english,
                        isLoading: isLoading,
                        onTap: () {
                          context
                              .read<LanguageCubit>()
                              .saveLanguageEvent(Language.english);
                        },
                      ),

                      const Gap(20),

                      // Persian Button
                      _LanguageButton(
                        title: 'فارسی',
                        languageCode: 'FA',
                        isSelected: selectedLanguage == Language.persian,
                        isLoading: isLoading,
                        onTap: () {
                          context
                              .read<LanguageCubit>()
                              .saveLanguageEvent(Language.persian);
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String title;
  final String languageCode;
  final bool isSelected;
  final bool isLoading;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.title,
    required this.languageCode,
    required this.isSelected,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: size.width * 0.35,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? MyColors.mainColor.withOpacity(0.05) : Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? MyColors.mainColor : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: MyColors.mainColor.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          children: [
            // Language Code Circle
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isSelected ? MyColors.mainColor : Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  languageCode,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : MyColors.mainColor,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 15),

            // Language Name
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? MyColors.mainColor : Colors.black87,
                ),
              ),
            ),

            // Checkmark when selected
            if (isSelected && !isLoading)
              Icon(
                Icons.check_circle,
                color: MyColors.mainColor,
                size: 28,
              ),

            // Loading indicator
            if (isLoading)
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(MyColors.mainColor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
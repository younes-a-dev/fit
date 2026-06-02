import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout/core/constants/app_fonts.dart';

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
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    SizedBox(height: size.height * .08),

                    SizedBox(
                      height: size.height * .18,
                      child: Image.asset(
                        'assets/images/HexFit Logo.png',
                        color: MyColors.mainColor,
                      ),
                    ),

                    const SizedBox(height: 32),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'CHOOSE',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const TextSpan(
                            text: ' LANGUAGE',
                            style: TextStyle(
                              color: MyColors.mainColor,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width < 360 ? 28 : 36,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.raleway,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'انتخاب زبان',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: AppFonts.vazir,
                        color: Theme.of(context).canvasColor,
                      ),
                    ),

                    const SizedBox(height: 50),

                    BlocBuilder<LanguageCubit, LanguageState>(
                      builder: (context, state) {
                        final isLoading =
                        state.saveLanguageStatus
                        is SaveLanguageLoading;

                        return Column(
                          children: [
                            _LanguageButton(
                              title: 'English',
                              languageCode: 'EN',
                              isSelected:
                              state.currentLanguage ==
                                  Language.english,
                              isLoading: isLoading,
                              onTap: () {
                                context
                                    .read<LanguageCubit>()
                                    .saveLanguageEvent(
                                  Language.english,
                                );
                              },
                            ),

                            const SizedBox(height: 16),

                            _LanguageButton(
                              title: 'فارسی',
                              languageCode: 'FA',
                              isSelected:
                              state.currentLanguage ==
                                  Language.persian,
                              isLoading: isLoading,
                              onTap: () {
                                context
                                    .read<LanguageCubit>()
                                    .saveLanguageEvent(
                                  Language.persian,
                                );
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: isLoading ? null : onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: isSelected
                ? MyColors.mainColor.withOpacity(.08)
                : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? MyColors.mainColor
                  : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? MyColors.mainColor
                      : Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  languageCode,
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : MyColors.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: title == 'فارسی'
                        ? AppFonts.vazir
                        : AppFonts.raleway,
                  ),
                ),
              ),

              if (isLoading)
                const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              else if (isSelected)
                const Icon(
                  Icons.check_circle_rounded,
                  color: MyColors.mainColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
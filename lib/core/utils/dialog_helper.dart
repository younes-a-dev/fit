import 'package:flutter/material.dart';
import '../../res/colors.dart';
import '../responsive/responsive_context.dart';

class DialogHelper {
  static Future<void> showCustomDialog({
    required BuildContext context,
    required String title,
    required String content,
    required Color contentColor,
    String buttonText = 'OK',
  }) async {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 26,
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: context.responsive(
              mobile: 18,
              tablet: 20,
              desktop: 22,
            ),
          ),
        ),
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: context.responsive(
              mobile: 14,
              tablet: 15,
              desktop: 16,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              height: context.responsive(
                mobile: 48,
                tablet: 50,
                desktop: 52,
              ),
              width: context.responsive(
                mobile: 282,
                tablet: 300,
                desktop: 320,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: MyColors.mainColor,
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: context.responsive(
                    mobile: 14,
                    tablet: 15,
                    desktop: 16,
                  ),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Success dialog (green/teal color)
  static Future<void> showSuccessDialog(
      BuildContext context, {
        required String title,
        required String content,
      }) async {
    await showCustomDialog(
      context: context,
      title: title,
      content: content,
      contentColor: MyColors.mainColor,
    );
  }

  // Error dialog (red color)
  static Future<void> showErrorDialog(
      BuildContext context, {
        required String title,
        required String content,
      }) async {
    await showCustomDialog(
      context: context,
      title: title,
      content: content,
      contentColor: const Color(0xffe63230),
    );
  }

  // Info dialog (blue/grey)
  static Future<void> showInfoDialog(
      BuildContext context, {
        required String title,
        required String content,
      }) async {
    await showCustomDialog(
      context: context,
      title: title,
      content: content,
      contentColor: Colors.blueGrey,
    );
  }
}
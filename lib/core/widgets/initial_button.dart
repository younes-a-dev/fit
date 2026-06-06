import 'package:flutter/material.dart';

import '../responsive/responsive_context.dart';

class InitialButton extends StatelessWidget {
  const InitialButton({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.responsive(
        mobile: 65,
        tablet: 70,
        desktop: 75,
      ),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: context.responsive(
              mobile: 15,
              tablet: 16,
              desktop: 18,
            ),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

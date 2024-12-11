import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({required this.imageUrl,super.key});

  final String imageUrl;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(70),
      child: Column(
        children: [
          SvgPicture.asset(imageUrl,fit: BoxFit.contain),
        ],
      ),
    );
  }
}

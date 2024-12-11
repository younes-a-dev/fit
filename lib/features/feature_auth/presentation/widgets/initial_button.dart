import 'package:flutter/material.dart';

class InitialButton extends StatelessWidget {
  InitialButton({required this.title, required this.onTap, super.key});
  final String title;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35, top: 40),
      height: 60,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          title,
        ),
      ),
    );
  }
}

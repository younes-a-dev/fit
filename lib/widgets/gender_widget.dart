import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:gap/gap.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({Key? key, required this.onChange}) : super(key: key);

  final Function(int) onChange;

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _gender = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip3D(
          border: Border.all(color: Colors.yellow),
          onSelected: () {
            setState(() {
              _gender = 1;
            });
            widget.onChange(_gender);
          },
          onUnSelected: () {},
          selected: _gender == 1,
          child: Column(
            children: [
              Container(
                  height: 50,
                  child: Image.asset(
                    'assets/images/male.jpg',
                    fit: BoxFit.cover,
                  )),
              const Gap(5),
              const Text('male'),
            ],
          ),
        ),
        const Gap(30),
        ChoiceChip3D(
          border: Border.all(color: Colors.yellow),
          onSelected: () {
            setState(() {
              _gender = 2;
            });
            widget.onChange(_gender);
          },
          onUnSelected: () {},
          selected: _gender == 2,
          child: Column(
            children: [
              Container(
                  height: 50,
                  child: Image.asset(
                    'assets/images/female.jpg',
                    fit: BoxFit.cover,
                  )),
              const Gap(5),
              const Text('female'),
            ],
          ),
        ),
      ],
    );
  }
}

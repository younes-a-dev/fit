import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';

class HeightWidget extends StatefulWidget {
  HeightWidget({Key? key, required this.onChange}) : super(key: key);

  Function(int) onChange;

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int _height = 150;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 7,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.only(left: 35, right: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Height',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          Row(
            children: [
              Text(
                _height.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 22),
              ),
              const Gap(5),
              const Text(
                'cm',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Slider(
            min: 0,
            max: 240,
            value: _height.toDouble(),
            thumbColor: Colors.yellow,
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
            onChanged: (value) {
              setState(() {
                _height = value.toInt();
              });
              widget.onChange(_height);
            },
          )
        ],
      ),
    );
  }
}

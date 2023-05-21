import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';

class AgeWeightWidget extends StatefulWidget {
  const AgeWeightWidget({
    Key? key,
    required this.onChange,
    required this.title,
    required this.initValue,
    required this.min,
    required this.max,
  }) : super(key: key);

  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;

  @override
  State<AgeWeightWidget> createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(color: Colors.black),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (counter > widget.min) {
                        counter--;
                      }
                    });
                    widget.onChange(counter);
                  },
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.remove,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                const Gap(15),
                Text(counter.toString(),textAlign: TextAlign.center,),
                const Gap(15),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (counter < widget.max) {
                        counter++;
                      }
                    });
                    widget.onChange(counter);
                  },
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.add,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

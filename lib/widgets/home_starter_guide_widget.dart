import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;

import '../res/colors.dart';

class HomeStarterGuideWidget extends StatelessWidget {
  const HomeStarterGuideWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        //margin: EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(size.height / 12),
            const Gap(10),
             Text(
              'GET STARTED BY',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Raleway',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const Gap(25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    width: 5,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: MyColors.mainColor,
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                  const Gap(15),
                  RichText(
                    maxLines: 3,
                    //textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    text: const TextSpan(
                      style: TextStyle(
                          color: MyColors.grey,
                          fontFamily: 'Raleway',
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: 'Choose a program for yourself from the\n',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              color: MyColors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: 'Discover  ',
                          style: TextStyle(
                              color: MyColors.mainColor,
                              fontFamily: 'Raleway',
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          style: TextStyle(
                              color: MyColors.grey,
                              fontSize: 13,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.normal),
                          text: 'section .',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    flu.FluentIcons.compass_n_w,
                    color: MyColors.mainColor,
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 25,
              endIndent: 25,
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    width: 5,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: MyColors.mainColor,
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                  const Gap(10),
                  RichText(
                    //textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                          color: MyColors.grey,
                          fontFamily: 'Raleway',
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: 'Create a program for yourself '
                              'from the  ',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              color: MyColors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          style: TextStyle(
                              color:MyColors.mainColor,
                              fontFamily: 'Raleway',
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          text: 'create\n custom plan  ',
                        ),
                        TextSpan(
                          style: TextStyle(
                              color: MyColors.grey,
                              fontSize: 13,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.normal),
                          text: 'section .',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    flu.FluentIcons.add_event,
                    color:MyColors.mainColor,
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 25,
              endIndent: 25,
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    width: 5,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: MyColors.mainColor,
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                  const Gap(10),
                  RichText(
                    //textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                          color: MyColors.grey,
                          fontFamily: 'Raleway',
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: 'From the custom plan section, press the\n',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              color: MyColors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          style: TextStyle(
                              color: MyColors.mainColor,
                              fontFamily: 'Raleway',
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          text: 'HexFit Plan +  ',
                        ),
                        TextSpan(
                          style: TextStyle(
                              color: MyColors.grey,
                              fontSize: 13,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.normal),
                          text: 'button\nand fill the form according to your '
                              'specifications\n',
                        ),
                        TextSpan(
                          style: TextStyle(
                              color: MyColors.grey,
                              fontSize: 13,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.normal),
                          text: 'and receive the plan .',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    flu.FluentIcons.add_event,
                    color: MyColors.mainColor,
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 25,
              endIndent: 25,
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    width: 5,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: MyColors.mainColor,
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                  const Gap(10),
                  RichText(
                    //textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                          color: MyColors.grey,
                          fontFamily: 'Raleway',
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: 'Note: ',
                          style: TextStyle(
                              color:MyColors.mainColor,
                              fontFamily: 'Raleway',
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          style: TextStyle(
                              color: MyColors.grey,
                              fontSize: 13,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.normal),
                          text: 'To select any of the programs,\nactivate ',
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.star_rounded,
                            size: 14,
                            color: MyColors.mainColor,
                          ),
                        ),
                        TextSpan(
                          style: TextStyle(
                              color: MyColors.grey,
                              fontSize: 13,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.normal),
                          text: ' icon in it .',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star_rounded,
                    color: MyColors.mainColor,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

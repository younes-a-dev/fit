import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:workout/widgets/app_bar_widget.dart';

import '../res/colors.dart';

class ManageSubscriptionScreen extends StatefulWidget {
  ManageSubscriptionScreen({Key? key}) : super(key: key);

  static const routeName = '/ EditProfileScreen --> Manage SubscriptionScreen';

  @override
  State<ManageSubscriptionScreen> createState() =>
      _ManageSubscriptionScreenState();
}

class _ManageSubscriptionScreenState extends State<ManageSubscriptionScreen> {
  int _value = 1;

  Widget _buildRadioButton(String title, String description, String price, int value,
      int groupValue) {
    return Container(
      height: 65,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      padding: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Radio(
              value: value,
              groupValue: groupValue,
              activeColor: MyColors.mainColor,
              onChanged: (value) {
                setState(() {
                  _value = value as int;
                });
              }),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:  TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const Gap(5),
              Text(
                description,
                style: const TextStyle(
                    color: MyColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          const Spacer(),
          RichText(
            text: TextSpan(
              style:  TextStyle(
                color:Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: price,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const TextSpan(
                  text: 'Toman',
                  style: TextStyle(
                    fontSize: 12,
                    color: MyColors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String? text, IconData? freeIcon,
      IconData proIcon, Color proIconColor) {
    return Column(
      children: [
        const Gap(10),
        Row(
          children: [
            Text(
              title,
              style:  TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 17),
            ),
            const Spacer(),
            text != null
                ? Text(
                    text,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Icon(
                    freeIcon,
                    color: Colors.green,
                  ),
            const Gap(25),
            Icon(
              proIcon,
              color: proIconColor,
            ),
            const Gap(5),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  const AppBarWidget(title:'Subscription'),
      body: Column(
        children: [
          SizedBox(
            height: size.height / 8,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Text(
                      'HEX',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'FIT',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Gap(10),
                 Text(
                  'PR',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 70,
                      fontWeight: FontWeight.bold),
                ),
                const Icon(
                  flu.FluentIcons.hexagon,
                  size: 40,
                  color: MyColors.mainColor,
                ),
              ],
            ),
          ),
          const Divider(
            endIndent: 30,
            indent: 30,
          ),
          const Gap(10),
           Text(
            'Full Access',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          const Gap(5),
          const Text(
            'Get access to all PRO feature\n and take training to the '
            'next level',
            textAlign: TextAlign.center,
            style: TextStyle(color: MyColors.grey, fontSize: 16),
          ),
          const Gap(15),
          _buildRadioButton(
            'Monthly',
            'Pay monthly',
            '50/',
            1,
            _value,
          ),
          _buildRadioButton(
            'Yearly',
            'Pay yearly, cancel any time',
            '450/',
            2,
            _value,
          ),
          const Gap(40),
           Text(
            'Compare Subscriptions',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              children: [
                const Gap(30),
                Row(
                  children:  [
                    Text(
                      '',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const Spacer(),
                    Text(
                      'Free',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const Gap(20),
                    const Text(
                      'PRO',
                      style: TextStyle(
                          color: MyColors.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
                const Gap(10),
                _buildRow('Create Unlimited Plan', 'Two', Icons.check,
                    Icons.check, Colors.green),
                _buildRow('Measurement Tracking', 'One', Icons.check,
                    Icons.check, Colors.green),
                _buildRow('Access All Hex fit Plans', '3 Plan', Icons.check,
                    Icons.check, Colors.green),
                _buildRow(
                    'Ads', null, Icons.check, Icons.close_rounded, Colors.red),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20,),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Purchase'),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../res/colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.onChangeFunction,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final void Function(String value)? onChangeFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        cursorColor: MyColors.mainColor,
        autofocus: true,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: Color(0xff2e2e2e),
        ),
        decoration: prefixIcon != null
            ? InputDecoration(
                prefixIcon: Icon(
                  prefixIcon,
                  size: 20,
                ),
                hintText: hintText,
              )
            : InputDecoration(
                hintText: hintText,
              ),
        onChanged: onChangeFunction,
      ),
    );
  }
}

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget(
      {required this.label,
      required this.units,
      required this.focusNodeFunction,
      required this.focusNode,
      required this.onSaveFunction});

  final String label;
  final String units;
  final Function focusNodeFunction;
  final FocusNode focusNode;
  final void Function(String?)? onSaveFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          textAlign: TextAlign.end,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          maxLines: 1,
          focusNode: focusNode,
          cursorColor: MyColors.mainColor,
          autofocus: true,
          textAlignVertical: TextAlignVertical.center,
          style:  TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color:Theme.of(context).primaryColor,
          ),
          // validator: (value) {
          //   if (value!.isEmpty) {
          //     return 'Please provide a value';
          //   }
          //   return null;
          // },
          onFieldSubmitted: (_) {
            focusNodeFunction();
          },
          onSaved: onSaveFunction,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: MyColors.grey),
            suffixText: units,
            prefixText: label,
          ),
        ),
        const Gap(8),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../responsive/responsive_context.dart';
import '../../res/colors.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.onChangeFunction,
    this.obscureText = false,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final void Function(String value)? onChangeFunction;
  final bool obscureText;
  final String? errorText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: MyColors.mainColor,
      autofocus: false,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        fontSize: context.responsive(mobile: 16, tablet: 18, desktop: 20),
        fontWeight: FontWeight.normal,
        color: const Color(0xff2e2e2e),
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: context.responsive(mobile: 14, tablet: 16, desktop: 18),
          color: Colors.grey,
        ),
        errorText: widget.errorText,
        errorMaxLines: 2,
        errorStyle: const TextStyle(fontSize: 12),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.symmetric(
          vertical: context.responsive(mobile: 18, tablet: 20, desktop: 22),
          horizontal: context.responsive(mobile: 12, tablet: 14, desktop: 16),
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                size: context.responsive(mobile: 18, tablet: 20, desktop: 22),
                color: Colors.grey.shade600,
              )
            : null,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  size: context.responsive(mobile: 18, tablet: 20, desktop: 22),
                  color: Colors.grey.shade600,
                ),
                onPressed: () => setState(() => _obscureText = !_obscureText),
              )
            : null,
        border: _border(12, side: BorderSide.none),
        enabledBorder: _border(12, side: BorderSide.none),
        focusedBorder: _border(12, side: BorderSide.none),
        errorBorder: _border(12, side: BorderSide.none),
        focusedErrorBorder: _border(12, side: BorderSide.none),
      ),
      onChanged: widget.onChangeFunction,
    );
  }
}

class CustomTextFormFieldWidget extends StatefulWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.onChangeFunction,
    this.obscureText = false,
    this.errorText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textAlign,
    this.maxLen,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final void Function(String value)? onChangeFunction;
  final bool obscureText;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextAlign? textAlign;
  final int? maxLen;

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: MyColors.mainColor,
      maxLength: widget.maxLen,
      autofocus: false,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textAlignVertical: TextAlignVertical.center,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlign: widget.textAlign ?? TextAlign.start,
      style: TextStyle(
        fontSize: context.responsive(mobile: 16, tablet: 18, desktop: 20),
        fontWeight: FontWeight.normal,
        color: const Color(0xff2e2e2e),
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: context.responsive(mobile: 14, tablet: 16, desktop: 18),
          color: Colors.grey,
        ),
        errorText: widget.errorText,
        errorMaxLines: 2,
        errorStyle: const TextStyle(fontSize: 10),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.symmetric(
          vertical: context.responsive(mobile: 18, tablet: 20, desktop: 22),
          horizontal: context.responsive(mobile: 12, tablet: 14, desktop: 16),
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                size: context.responsive(mobile: 18, tablet: 20, desktop: 22),
                color: Colors.grey.shade600,
              )
            : null,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  size: context.responsive(mobile: 18, tablet: 20, desktop: 22),
                  color: Colors.grey.shade600,
                ),
                onPressed: () => setState(() => _obscureText = !_obscureText),
              )
            : null,
        border: _border(12, side: BorderSide.none),
        enabledBorder: _border(12, side: BorderSide.none),
        focusedBorder: _border(12, side: BorderSide.none),
        errorBorder: _border(12, side: BorderSide.none),
        focusedErrorBorder: _border(12, side: BorderSide.none),
      ),
      onChanged: widget.onChangeFunction,
    );
  }
}

OutlineInputBorder _border(double radius, {BorderSide side = BorderSide.none}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: side,
  );
}

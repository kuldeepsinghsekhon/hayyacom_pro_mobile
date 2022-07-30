import 'package:flutter/material.dart';
import 'package:hayyacom/utils/utils.dart';

class TextFieldWidget extends StatelessWidget {

  final TextEditingController? controller;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final double? suffixIconSize;
  final String? hintText;
  final Color? hintTextColor;
  final String? labelText;
  final Color? labelTextColor;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onSuffixIconTap;


  const TextFieldWidget({
    Key? key,
    this.controller,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconSize,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixIconSize,
    this.hintText,
    this.hintTextColor,
    this.labelText,
    this.labelTextColor,
    this.keyboardType,
    this.validator,
    this.onSuffixIconTap,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: prefixIconColor ?? AppTheme.themeColors.darkGray,
          size: prefixIconSize ?? 25,
        ),
        hintText: hintText,
        labelText: labelText,
        hintStyle: TextStyle(
          color: hintTextColor ?? AppTheme.themeColors.darkGray,
        ),
        suffixIcon: Material(
          child: InkWell(
            onTap: onSuffixIconTap,
            child: Icon(
              suffixIcon,
              color: suffixIconColor ?? AppTheme.themeColors.darkGray,
              size:  suffixIconSize ?? 25,
            ),
          ),
        ),
      ),
      style: TextStyle(
        color: labelTextColor ?? AppTheme.themeColors.darkGray,
      ),
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator
    );
  }
}

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
  final bool? obscureText;
  final Color? labelTextColor;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final FormFieldValidator<String>? onSaved;
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
    this.obscureText,
    this.keyboardType,
    this.validator,
    this.onSaved,
    this.onSuffixIconTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      onSaved: onSaved,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: IconButtonWidget(
          icon: prefixIcon,
          iconColor: prefixIconColor,
          iconSize: prefixIconSize,
        ),
        hintText: hintText,
        labelText: labelText,
        hintStyle: TextStyle(
          color: hintTextColor ?? AppTheme.themeColors.text,
        ),
        labelStyle: TextStyle(
          color: hintTextColor ?? AppTheme.themeColors.text,
          fontWeight: FontWeight.bold
        ),
        suffixIcon: suffixIcon != null
          ? IconButtonWidget(
              onTap: onSuffixIconTap,
              icon: suffixIcon,
              iconColor: suffixIconColor,
              iconSize: suffixIconSize,
            ) : null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.themeColors.text),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.themeColors.text),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.themeColors.secondary),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.themeColors.secondary),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      style: TextStyle(
        color: labelTextColor ?? AppTheme.themeColors.text,
      ),

    );
  }
}

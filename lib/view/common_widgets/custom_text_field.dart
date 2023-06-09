import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifiqrcode/app_constants/constants.dart';
import 'package:wifiqrcode/utils/size_config.dart';
import 'package:wifiqrcode/utils/style_utils.dart';

class CustomTextField extends StatelessWidget {
  final Function onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final bool enabled;
  final String? initialValue;
  final int? maxLines;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final Function? validator;
  final Function? onTap;
  final Function? onSaved;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final List<TextInputFormatter>? textInputFormatter;

  const CustomTextField({
    Key? key,
    required this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.hintText,
    this.enabled = true,
    this.initialValue,
    this.maxLines = 1,
    this.keyboardType,
    this.maxLength,
    this.textCapitalization,
    this.labelText,
    this.prefixIcon,
    this.validator,
    this.onTap,
    this.textInputAction,
    this.controller,
    this.onSaved,
    this.textInputFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: StyleUtil.primaryShadow(),
      ),
      child: TextFormField(
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        inputFormatters: textInputFormatter,
        maxLines: maxLines,
        maxLength: maxLength,
        initialValue: initialValue,
        keyboardAppearance: Brightness.light,
        keyboardType: keyboardType,
        controller: controller,
        onSaved: (value) {
          if (onSaved != null) {
            onSaved!(value);
          }
        },
        onChanged: (value) {
          onChanged(value);
        },
        validator: validator == null
            ? null
            : (value) {
                return validator!(value);
              },
        onTap: onTap == null
            ? null
            : () {
                onTap!();
              },
        cursorColor: Constants.black,
        textInputAction: textInputAction ?? TextInputAction.next,
        obscureText: obscureText,
        enabled: enabled,
        decoration: InputDecoration(
          filled: true,
          fillColor: Constants.primaryInputBgColor,
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(),
          prefixIcon: prefixIcon,
          prefixIconConstraints: const BoxConstraints(),
          counterText: '',
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          labelText: labelText,
          labelStyle: TextStyle(color: Constants.textGrey, fontSize: 1.6.t),
          alignLabelWithHint: true,
          // hintText: hintText ?? labelText,
          hintStyle: TextStyle(color: Constants.textGrey, fontSize: 1.6.t),
          focusedBorder: StyleUtil.formTextFieldInputBorder(),
          enabledBorder: StyleUtil.formTextFieldInputBorder(),
          border: StyleUtil.formTextFieldInputBorder(),
          errorBorder: StyleUtil.formTextFieldInputBorder(),
          disabledBorder: StyleUtil.formTextFieldInputBorder(),
        ),
      ),
    );
  }
}

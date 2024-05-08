import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/themes/texts_theme.dart';

class CustomIconTextField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final Widget icon;
  const CustomIconTextField(
      {super.key,
      required this.hintText,
      required this.obsecureText,
      required this.textEditingController,
      this.validator,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator,
        obscureText: obsecureText,
        controller: textEditingController,
        style: const TextStyle(color: AppColor.PRIMARY),
        decoration: InputDecoration(
          prefixIcon: icon,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.PRIMARY)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.PRIMARY)),
          fillColor: Colors.white,
          filled: obsecureText,
          hintText: hintText,
          hintStyle: AppTexts.robotoTextFieldsStyle,
        ));
  }
}

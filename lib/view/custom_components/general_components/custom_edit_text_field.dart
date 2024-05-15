import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class CustomEditTextField extends StatelessWidget {
  final String labelName;
  final bool obsecureText;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final IconData icon;
  const CustomEditTextField(
      {super.key,
      required this.labelName,
      required this.textEditingController,
      this.validator,
      required this.icon,
      required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obsecureText,
      controller: textEditingController,
      style: const TextStyle(color: AppColor.PRIMARY),
      decoration: InputDecoration(
        label: Text(
          labelName,
          style: const TextStyle(color: AppColor.PRIMARY, fontSize: 16),
        ),
        prefixIcon: Icon(
          icon,
          color: AppColor.PRIMARY,
          size: 40,
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.PRIMARY)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.PRIMARY)),
        fillColor: Colors.white,
      ),
    );
  }
}

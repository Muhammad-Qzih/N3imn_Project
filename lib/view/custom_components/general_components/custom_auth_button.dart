import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class CsutomAuthButton extends StatelessWidget {
  
  final void Function()? onPressed;
  final String buttonText;
  final Color backgroundColor;
  final TextStyle? textStyle;
  const CsutomAuthButton({
    super.key,
   required this.buttonText,
    this.onPressed,
    this.backgroundColor = AppColor.PRIMARY,
    this.textStyle = const TextStyle(
      color: AppColor.TEXT_SECONDARY,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
});

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50), 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
        onPressed: onPressed,
        child: Text(buttonText, style: textStyle),
      ),
    );
  }
}
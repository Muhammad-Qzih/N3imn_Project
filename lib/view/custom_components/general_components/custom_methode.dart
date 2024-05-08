import 'package:flutter/material.dart';

class CustomMethode extends StatelessWidget {
  final String imagePath;
  final void Function()? onPressed;
  const CustomMethode({super.key, required this.imagePath, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(imagePath, width: 30, height: 30),
        ),
      ),
    );
  }
}

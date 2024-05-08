// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ApplicationLogo extends StatelessWidget {
  final double width;
  final double height;
  final Color? color; 

  const ApplicationLogo({
    super.key,
    required this.width,
    required this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'Images/logo.png',
        width: width,
        height: height,
      ),
    );
  }
}
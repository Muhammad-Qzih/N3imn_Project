import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class BarberEditServicesScreen extends StatefulWidget {
  const BarberEditServicesScreen({super.key});

  @override
  State<BarberEditServicesScreen> createState() => _BarberEditServicesScreenState();
}

class _BarberEditServicesScreenState extends State<BarberEditServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: AppColor.TEXT_SECONDARY,
      appBar: AppBar(),
      body: const Center(
        child: Text("Barber Services "),
      ),);
  }
}
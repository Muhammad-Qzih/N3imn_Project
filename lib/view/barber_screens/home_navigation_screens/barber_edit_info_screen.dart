import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class BarberEditInfoScreen extends StatefulWidget {
  const BarberEditInfoScreen({super.key});

  @override
  State<BarberEditInfoScreen> createState() => _BarberEditInfoScreenState();
}

class _BarberEditInfoScreenState extends State<BarberEditInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColor.TEXT_SECONDARY,
      body: const Center(
        child: Text("Barber Edit Info "),
      ),
    );
  }
}
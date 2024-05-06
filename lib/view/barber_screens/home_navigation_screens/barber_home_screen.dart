import 'package:flutter/material.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/drawer-menu.dart';

class BarberHomeScreen extends StatefulWidget {
  const BarberHomeScreen({super.key});

  @override
  State<BarberHomeScreen> createState() => _BarberHomeScreenState();
}

class _BarberHomeScreenState extends State<BarberHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(),
      body: DrawerMenu(),
    );
  }
}
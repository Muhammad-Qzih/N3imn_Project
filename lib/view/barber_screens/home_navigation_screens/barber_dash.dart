import 'package:flutter/material.dart';

class BarberDashbored extends StatefulWidget {
  const BarberDashbored({super.key});

  @override
  State<BarberDashbored> createState() => _BarberDashboredState();
}

class _BarberDashboredState extends State<BarberDashbored> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          backgroundColor: Colors.white,
      body:  Center(
        child: Text(
          'Barber Dashboerd',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
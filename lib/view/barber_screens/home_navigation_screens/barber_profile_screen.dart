import 'package:flutter/material.dart';

class BarberProfile extends StatefulWidget {
  const BarberProfile({super.key});

  @override
  State<BarberProfile> createState() => _BarberProfileState();
}

class _BarberProfileState extends State<BarberProfile> {
  @override
  Widget build(BuildContext context) {
  return  const Scaffold(
        backgroundColor: Colors.white,
      body:  Center(
        child: Text(
          'Barber Profile',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  
  }
}

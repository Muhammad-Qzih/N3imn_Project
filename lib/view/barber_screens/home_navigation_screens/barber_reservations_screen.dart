import 'package:flutter/material.dart';

class BarberReservatons extends StatefulWidget {
  const BarberReservatons({super.key});

  @override
  State<BarberReservatons> createState() => _BarberReservatonsState();
}

class _BarberReservatonsState extends State<BarberReservatons> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Barber reservatons',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}

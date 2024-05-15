import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MakeBookingScreen extends StatefulWidget {
  const MakeBookingScreen({super.key});

  @override
  State<MakeBookingScreen> createState() => _MakeBookingScreenState();
}

class _MakeBookingScreenState extends State<MakeBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: const Center(
        child: Text("Make a Reservation"),
      ),
    );
  }
}

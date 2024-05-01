import 'package:flutter/material.dart';

class SignUpBarber extends StatefulWidget {
  const SignUpBarber({super.key});

  @override
  State<SignUpBarber> createState() => _SignUpBarberState();
}

class _SignUpBarberState extends State<SignUpBarber> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Signup Barber"),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ResetPassowrd extends StatefulWidget {
  const ResetPassowrd({super.key});

  @override
  State<ResetPassowrd> createState() => _ResetPassowrdState();
}

class _ResetPassowrdState extends State<ResetPassowrd> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text("Reset Password Screen"),),
    );
  }
}
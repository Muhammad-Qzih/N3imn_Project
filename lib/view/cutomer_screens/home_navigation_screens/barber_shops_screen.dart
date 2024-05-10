// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/tab_bar.dart';

class BarbershopsScreen extends StatefulWidget {
  const BarbershopsScreen({super.key});

  @override
  _BarbershopsScreenState createState() => _BarbershopsScreenState();
}

class _BarbershopsScreenState extends State<BarbershopsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Barbershops Screen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // bottomNavigationBar: CustomerTabBarr(),
    );
  }
}

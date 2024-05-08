import 'package:flutter/material.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/drawer-menu.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    body: const Center(
      child: Text('Customer Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ,color: Colors.white),), 
    ),
    drawer: DrawerMenu(), 
  );
}
}
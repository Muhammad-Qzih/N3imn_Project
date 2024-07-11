// ignore_for_file: unused_field, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/cutomer_screens/home_navigation_screens/barber_shops_screen.dart';
import 'package:n3imn_project_team/view/cutomer_screens/home_navigation_screens/customer_booking_screen.dart';
import 'package:n3imn_project_team/view/cutomer_screens/home_navigation_screens/customer_home_screen.dart';
import 'package:n3imn_project_team/view/cutomer_screens/home_navigation_screens/profile_screen%20.dart';

class CustomerTabBarr extends StatefulWidget {
  const CustomerTabBarr({super.key});

  @override
  _CustomerTabBarrState createState() => _CustomerTabBarrState();
}

class _CustomerTabBarrState extends State<CustomerTabBarr> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const CustomerHomeScreen(),
    const CustomerBookingsScreen(),
    const BarbershopsScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
      
    BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_cut),
            label: 'Barbershops',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        backgroundColor: AppColor.PRIMARY,
        onTap: _onItemTapped,
      );
    
  }
}

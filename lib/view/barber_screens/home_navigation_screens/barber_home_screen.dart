import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/barber_screens/home_navigation_screens/barber_dash.dart';
import 'package:n3imn_project_team/view/barber_screens/home_navigation_screens/barber_profile_screen.dart';
import 'package:n3imn_project_team/view/barber_screens/home_navigation_screens/barber_reservations_screen.dart';
import 'package:n3imn_project_team/view/barber_screens/home_navigation_screens/home.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/drawer-menu.dart';

class BarberHomeScreen extends StatefulWidget {
  const BarberHomeScreen({super.key});

  @override
  State<BarberHomeScreen> createState() => _BarberHomeScreenState();
}

class _BarberHomeScreenState extends State<BarberHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const BarberHome(),
    const BarberReservatons(),
    const BarberDashbored(),
    const BarberProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        drawer: DrawerMenu(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? Image.asset('Images/icons8-home-48.png', height: 30)
                  : Image.asset('Images/icons8-home-48-white.png', height: 30),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.groups_rounded,
                size: 38,
              ),
              label: 'Reservations',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.incomplete_circle,
                size: 38,
              ),
              label: 'Dashbored',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 38,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          backgroundColor: AppColor.PRIMARY,
          onTap: _onItemTapped,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/drawer-menu.dart';
import 'package:n3imn_project_team/view/cutomer_screens/home_navigation_screens/barber_shops_screen.dart';
import 'package:n3imn_project_team/view/cutomer_screens/home_navigation_screens/customer_booking_screen.dart';
import 'package:n3imn_project_team/view/cutomer_screens/home_navigation_screens/home.dart';
import 'package:n3imn_project_team/view/cutomer_screens/home_navigation_screens/profile_screen%20.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        drawer: DrawerMenu(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
             BottomNavigationBarItem(
              icon:    _selectedIndex == 0
                  ? Image.asset('Images/icons8-home-48.png', height: 30)
                  : Image.asset('Images/icons8-home-48-white.png',
                      height: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? Image.asset('Images/icons8-booking-48.png', height: 30)
                  : Image.asset('Images/icons8-booking-48-white.png',
                      height: 30),
              label: 'Bookings',
            ),
             BottomNavigationBarItem(
                            icon: _selectedIndex == 2
                  ? Image.asset('Images/icons8-barber-48.png', height: 30)
                  : Image.asset('Images/icons8-barber-48-white.png',
                      height: 30),
              label: 'Barbershops',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 33,),
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

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/view/barber_screens/auth_screens/signup_barber_screen.dart';
import 'package:n3imn_project_team/view/barber_screens/home_navigation_screens/barber_home_screen.dart';
import 'package:n3imn_project_team/view/cutomer_screens/auth_screens/signup_customer_screen.dart';
import 'package:n3imn_project_team/view/cutomer_screens/home_navigation_screens/customer_home_screen.dart';
import 'package:n3imn_project_team/view/general_screens/login_screen.dart';
import 'package:n3imn_project_team/view/general_screens/reset_password_screen.dart';

class CustomerRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      "customersignup": (context) => const SignUpCustomer(),
      "customerlogin": (context) => const LoginScreen(),
      "customerhomepage": (context) => const CustomerHomeScreen(),
      "customerresetpassword": (context) => const ResetPassowrd()
    };
  }
}

class BarberRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      "barbersignup": (context) => const SignUpBarber(),
      "barberlogin": (context) => const LoginScreen(),
      "barberhomepage": (context) => const BarberHomeScreen(),
      "barberresetpassword": (context) => const ResetPassowrd()
    };
  }
}
class Routes {
  static Map<String, WidgetBuilder> getAllRoutes() {
    final Map<String, WidgetBuilder> allRoutes = {};
    
    // Add Customer routes
    allRoutes.addAll(CustomerRoutes.getRoutes());
    
    // Add Barber routes
    allRoutes.addAll(BarberRoutes.getRoutes());
    
    return allRoutes;
  }
}
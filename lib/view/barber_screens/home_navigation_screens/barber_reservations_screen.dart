import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/reservation_card.dart';

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReservationCard(
                customerName: 'Maher',
                bookedServices: 'Haircut, Shaving',
                reservationDate: '12/15/2001',
                services: ['Haircut', 'Shaving'],
                reservationTime: '10:00 AM',
                duration: '30m',
              ),
              ReservationCard(
                customerName: 'Ali',
                bookedServices: 'Haircut',
                reservationDate: '12/16/2001',
                services: ['Haircut'],
                reservationTime: '11:00 AM',
                duration: '30m',
              ),
              ReservationCard(
                customerName: 'Sara',
                bookedServices: 'Haircut, Coloring',
                reservationDate: '12/17/2001',
                services: ['Haircut', 'Coloring'],
                reservationTime: '12:00 PM',
                duration: '1h',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
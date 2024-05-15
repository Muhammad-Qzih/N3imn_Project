import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class BarberAppointmentCard extends StatelessWidget {
  final String date;
  final String cusotmerName;
  final List<String> services;
  final String customerPhoneNumber;
  final String timeRequired;

  const BarberAppointmentCard(
      {super.key,
      required this.date,
      required this.cusotmerName,
      required this.services,
      required this.customerPhoneNumber,
      required this.timeRequired});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 255, 255),
      elevation: 5,
      margin: const EdgeInsets.all(8),
      child: Container(
        width: 340,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(9)),
          boxShadow: [
            BoxShadow(
                color: AppColor.PRIMARY.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(3, 3)),
          ],
        ),
        padding: const EdgeInsets.all(9),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Feb 23, 9:30 PM',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.TEXT_PRIMARY),
            ),
            Divider(color: AppColor.PRIMARY),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Customer:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Amjad Samer',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Services:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Haircut & Beard Style',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Time Required:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '1 h',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phone:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '0599234237',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class ReservationCard extends StatelessWidget {
  final String reservationDate;
  final String customerName;
  final String bookedServices;
  final List<String> services;
  final String reservationTime;
  final String duration;

  const ReservationCard({
    super.key,
    required this.customerName,
    required this.bookedServices,
    required this.reservationDate,
    required this.services,
    required this.reservationTime,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      color: const Color(0xFFFFFFFF),
      elevation: 5,
      margin: const EdgeInsets.all(8),
      child: Container(
        width: 350,
        height: 310,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(9)),
          boxShadow: [
            BoxShadow(
              color: AppColor.PRIMARY.withOpacity(0.4),
              spreadRadius: 1.5,
              blurRadius: 1,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Reservation Details',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColor.TEXT_PRIMARY,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(color: AppColor.PRIMARY, thickness: 1),
            const SizedBox(height: 8),
            Text(
              'Customer Name: $customerName',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColor.TEXT_PRIMARY,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Service Time Required: $duration',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColor.TEXT_PRIMARY,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Services: ${services.join(", ")}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColor.TEXT_PRIMARY,
              ),
            ),
            const SizedBox(height: 5.0),
            Text('Booked Services: $bookedServices'),
            Text('Date: $reservationDate'), 
            Text('Time: $reservationTime'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Accept action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.PRIMARY,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Accept',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Reject action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 216, 19, 5),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Reject',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_add_model.dart';
import 'package:n3imn_project_team/repositories/booking_repo/booking_repo.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class ReservationCard extends StatelessWidget {
  final BookingModel booking;
  final String customerName;
  final String customerPhone;

  const ReservationCard({
    super.key,
    required this.booking,
    required this.customerName,
    required this.customerPhone,
  });

  @override
  Widget build(BuildContext context) {
    final bookingRepository = BookingRepository();
    ThemeData theme = Theme.of(context);
    return Card(
      color: const Color.fromARGB(255, 255, 255, 255),
      elevation: 5,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
            Text(
              'Customer phone: $customerPhone',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColor.TEXT_PRIMARY,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              // ignore: prefer_interpolation_to_compose_strings
              'Date : ' +
                  booking.date +
                  "  " +
                  booking.startBookingTime +
                  " - " +
                  booking.endBookingTime,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColor.TEXT_PRIMARY,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Services: ${booking.services.join(", ")}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColor.TEXT_PRIMARY,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    bookingRepository.accepctBooking(
                        booking.barberId,
                        booking.customerId,
                        booking.date,
                        booking.startBookingTime,
                        booking.endBookingTime);
                    Navigator.of(context)
                        .pushReplacementNamed("barberhomepage");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.PRIMARY,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
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
                    bookingRepository.rejectBooking(
                        booking.barberId,
                        booking.customerId,
                        booking.date,
                        booking.startBookingTime,
                        booking.endBookingTime);
                          Navigator.of(context)
                        .pushReplacementNamed("barberhomepage");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 216, 19, 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
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

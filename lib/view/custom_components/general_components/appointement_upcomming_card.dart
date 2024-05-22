import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_model.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/utils/helper/date_fortmater.dart/date_formatter.dart';

class UpCommeingAppointmentCard extends StatefulWidget {
  final Booking booking;
  const UpCommeingAppointmentCard({super.key, required this.booking});

  @override
  State<UpCommeingAppointmentCard> createState() =>
      _UpCommeingAppointmentCardState();
}

class _UpCommeingAppointmentCardState extends State<UpCommeingAppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.TEXT_SECONDARY,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.TEXT_SECONDARY,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          boxShadow: [
            BoxShadow(
              color: AppColor.PRIMARY.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormatter.timestampToString(
                          widget.booking.startBookingTime),
                      style: const TextStyle(
                        color: AppColor.TEXT_PRIMARY,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Remind-me',
                          style: TextStyle(
                            color: AppColor.TEXT_PRIMARY,
                            fontSize: 16,
                          ),
                        ),
                        Switch(
                          value: true,
                          onChanged: (bool newValue) {},
                          activeTrackColor: AppColor.PRIMARY,
                          activeColor: AppColor.TEXT_SECONDARY,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColor.PRIMARY,
              ),
               Text(
                  widget.booking.barberSalonName,
                style: const TextStyle(
                  color: AppColor.TEXT_PRIMARY,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  text: 'Services: ',
                  style: const TextStyle(
                    color: AppColor.TEXT_PRIMARY,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: widget.booking.services.join(' | '),
                      style: const TextStyle(
                        color: AppColor.TEXT_SECONDARY_LIGHT,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "Time Required: ${DateFormatter.calculateHourDifference(DateFormatter.timestampToString(widget.booking.startBookingTime),
                 DateFormatter.timestampToString(widget.booking.endBookingTime))}",
                style: const TextStyle(
                  color: AppColor.TEXT_PRIMARY,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 25,
                        color: AppColor.PRIMARY,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        widget.booking.location,
                        style: const TextStyle(
                          color: AppColor.TEXT_PRIMARY,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.PRIMARY,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: AppColor.TEXT_SECONDARY),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

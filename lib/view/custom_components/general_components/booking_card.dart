import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/user_model/booking.model.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class BookingCard extends StatelessWidget {
  final Booking booking;

  BookingCard({required this.booking});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      color: AppColor.TEXT_SECONDARY,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(16.0),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: AppColor.TEXT_SECONDARY,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          boxShadow: [
            BoxShadow(
              color: AppColor.PRIMARY.withOpacity(0.4),
              spreadRadius: 1.5,
              blurRadius: 1,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  booking.bookingDateTime,
                  style: theme.textTheme.displayMedium
                      ?.copyWith(color: AppColor.TEXT_PRIMARY),
                ),
              ),
              const Divider(
                color: AppColor.TEXT_PRIMARY,
              ),
              Text(
                booking.salonName,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: AppColor.TEXT_PRIMARY),
              ),
              const SizedBox(height: 4.0),
              RichText(
                text: TextSpan(
                  text: 'Services: ',
                  style: theme.textTheme.titleSmall
                      ?.copyWith(color: AppColor.TEXT_PRIMARY),
                  children: [
                    TextSpan(
                      text: booking.services.join(" | "),
                      style: theme.textTheme.titleSmall
                          ?.copyWith(color: AppColor.TEXT_COLOR),
                    ),
                  ],
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
                        color: AppColor.PRIMARY,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        booking.salonLocation,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: AppColor.TEXT_PRIMARY),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.PRIMARY,
                      padding: const EdgeInsets.symmetric(horizontal: 33.0),
                    ),
                    child: Text('Re-book',
                        style: (theme.textTheme.bodySmall
                            ?.copyWith(color: AppColor.TEXT_SECONDARY))),
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

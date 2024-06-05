import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_add_model.dart';
import 'package:n3imn_project_team/repositories/booking_repo/booking_repo.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class BookingCard extends StatefulWidget {
  final BookingModel booking;
  
  const BookingCard({super.key, required this.booking});

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  final _bookingRepo = BookingRepository();
        
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    String buttonText;
    VoidCallback buttonAction;

    switch (widget.booking.status) {
      case 0:
        buttonText = 'Cancel';
        buttonAction = () async {
          String? bookingId = widget.booking.id;
        await  _bookingRepo.cancelBooking(bookingId);
            Navigator.of(context).pushNamed("customerhomepage");
        };
        break;
      case 1:
        buttonText = 'Feedback';
        buttonAction = () {
          String? barberId = widget.booking.barberId;
          Navigator.of(context).pushNamed("feedback",arguments:barberId);
        };
        break;

      default:
        buttonText = '';
        buttonAction = () {};
    }

    return Card(
      color: AppColor.TEXT_SECONDARY,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5,
      margin: EdgeInsets.symmetric(
          vertical: widget.booking.status == 0 ? 8.0 : 23.0, horizontal: 10),
      child: Container(
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
                child: Container(
                  constraints: const BoxConstraints(maxWidth: double.infinity),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.booking.date} / ${widget.booking.startBookingTime}",
                        style: theme.textTheme.displayLarge
                            ?.copyWith(color: AppColor.TEXT_PRIMARY),
                      ),
                      if (widget.booking.status == 0)
                        Row(
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
                              onChanged: (bool newValue) {
                                // Handle Switch Action
                              },
                              activeTrackColor: AppColor.PRIMARY,
                              activeColor: AppColor.TEXT_SECONDARY,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const Divider(color: AppColor.PRIMARY),
              Text(
                widget.booking.barberSalonName,
                style: theme.textTheme.titleLarge
                    ?.copyWith(color: AppColor.TEXT_PRIMARY),
              ),
              const SizedBox(height: 4.0),
              RichText(
                text: TextSpan(
                  text: 'Services: ',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: AppColor.TEXT_PRIMARY),
                  children: [
                    TextSpan(
                      text: widget.booking.services.join(' | '),
                      style: theme.textTheme.displayMedium
                          ?.copyWith(color: AppColor.TEXT_SECONDARY_LIGHT),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                "Time Required: 1h",
                style: TextStyle(
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
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: AppColor.TEXT_PRIMARY),
                      ),
                    ],
                  ),
                  if(widget.booking.status != 2)
                  ElevatedButton(
                    onPressed: buttonAction,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.PRIMARY,
                      padding: const EdgeInsets.symmetric(horizontal: 33.0),
                    ),
                    child: Text(buttonText,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: AppColor.TEXT_SECONDARY)),
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

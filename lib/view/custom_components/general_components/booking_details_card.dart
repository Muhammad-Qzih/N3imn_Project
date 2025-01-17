import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/user_model/barber_model.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class BookingDetailsCard extends StatefulWidget {
  final Set<String> _selectedServices;
  final String? _selectedTime;
  final String? _selectedDate;
  final int _timeRequired;
  final BarberSalon _barberSalon;
  
  const BookingDetailsCard({
    super.key,
    required int timeRequired,
    required Set<String> selectedServices,
    required String? selectedTime,
    required String? selectedDate,
    required BarberSalon barberSalon,
  })  : _selectedServices = selectedServices,
        _selectedTime = selectedTime,
        _timeRequired = timeRequired,
        _selectedDate = selectedDate,
        _barberSalon = barberSalon;

  @override
  State<BookingDetailsCard> createState() => _BookingDetailsCardState();
}

List<String> extractStartAndEndTime(String? timeRange) {
  List<String> times = timeRange!.split(' - ');
  return times;
}

class _BookingDetailsCardState extends State<BookingDetailsCard> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      color: AppColor.TEXT_SECONDARY,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 3,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Booking Details",
                        style: theme.textTheme.displayLarge
                            ?.copyWith(color: AppColor.TEXT_PRIMARY),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(color: AppColor.PRIMARY),
              RichText(
                text: TextSpan(
                  text: 'Date: ',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: AppColor.TEXT_PRIMARY),
                  children: [
                    TextSpan(
                      text: widget._selectedDate,
                      style: theme.textTheme.displayMedium
                          ?.copyWith(color: AppColor.TEXT_SECONDARY_LIGHT),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Start Time: ',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: AppColor.TEXT_PRIMARY),
                  children: [
                    TextSpan(
                      text: extractStartAndEndTime(widget._selectedTime)[0],
                      style: theme.textTheme.displayMedium
                          ?.copyWith(color: AppColor.TEXT_SECONDARY_LIGHT),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'End Time: ',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: AppColor.TEXT_PRIMARY),
                  children: [
                    TextSpan(
                      text: extractStartAndEndTime(widget._selectedTime)[1],
                      style: theme.textTheme.displayMedium
                          ?.copyWith(color: AppColor.TEXT_SECONDARY_LIGHT),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Services: ',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: AppColor.TEXT_PRIMARY),
                  children: widget._selectedServices.map((serviceName) {
                    return WidgetSpan(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: const BoxDecoration(
                            color: AppColor.PRIMARY,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          serviceName,
                          style:
                              const TextStyle(color: AppColor.TEXT_SECONDARY),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "Time Required: ${widget._timeRequired} minutes",
                style: const TextStyle(
                  color: AppColor.TEXT_PRIMARY,
                  fontSize: 16,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Brber Shop: ',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: AppColor.TEXT_PRIMARY),
                  children: [
                    TextSpan(
                      text: "Maher Salon",
                      style: theme.textTheme.displayMedium
                          ?.copyWith(color: AppColor.TEXT_SECONDARY_LIGHT),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "Location:",
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: AppColor.TEXT_PRIMARY),
                  children: [
                    TextSpan(
                      text: widget._barberSalon.location,
                      style: theme.textTheme.displayMedium
                          ?.copyWith(color: AppColor.TEXT_SECONDARY_LIGHT),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

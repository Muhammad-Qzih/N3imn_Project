
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class BarberAppointmentCard extends StatelessWidget {
  final String date;
  final String cusotmerName;
  final Set<String> services;
  final String customerPhoneNumber;
  final String timeRequired;
  final double width;
  final double height;

  const BarberAppointmentCard({
    super.key,
    required this.date,
    required this.cusotmerName,
    required this.services,
    required this.customerPhoneNumber,
    required this.timeRequired,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        elevation: 5,
        margin: const EdgeInsets.all(8),
        child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(9)),
    boxShadow: [
    BoxShadow(
    color: AppColor.PRIMARY.withOpacity(0.4),
    spreadRadius: 1.5,
    blurRadius: 1,
    offset: const Offset(3, 3)),
    ],
    ),
    padding: const EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(date,
    style: theme.textTheme.displayLarge
        ?.copyWith(color: AppColor.TEXT_PRIMARY)),
    const Divider(color: AppColor.PRIMARY),
    Text('Customer Name: $cusotmerName',
    style: theme.textTheme.titleMedium
        ?.copyWith(color: AppColor.TEXT_PRIMARY)),
    const SizedBox(height: 2),
    RichText(
    text: TextSpan(
    text: 'Services: ',
    style: theme.textTheme.titleMedium
        ?.copyWith(color: AppColor.TEXT_PRIMARY),
    children: [
    TextSpan(
    text: services.join(" | "),
    style: theme.textTheme.titleMedium
        ?.copyWith(color: AppColor.TEXT_PRIMARY),
    ),
    ],
    ),
    ),
    const SizedBox(height: 2),
    Row(
    children: [
    Text('Time Required: $timeRequired',
    style: theme.textTheme.titleMedium
        ?.copyWith(color: AppColor.TEXT_PRIMARY)),
    ],
    ),
    const SizedBox(height: 2),
    Row(
    children: [
    Text('Customer Phone: $customerPhoneNumber',
    style: theme.textTheme.titleMedium
        ?.copyWith(color: AppColor.TEXT_PRIMARY)),
    ],
    ),
    ],
    ),
    ),
    );
  }
}

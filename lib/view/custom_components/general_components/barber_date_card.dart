import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class BarberDateCard extends StatelessWidget {
  final String date;
  final String salonName;
  final List<String> services;
  final String location;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  const BarberDateCard({
    super.key,
    required this.date,
    required this.salonName,
    required this.services,
    required this.location,
    required this.width,
    required this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      child: Card(
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
              Text(salonName,
                  style: theme.textTheme.displayMedium
                      ?.copyWith(color: AppColor.TEXT_PRIMARY)),
              RichText(
                text: TextSpan(
                  text: 'Services: ',
                  style: theme.textTheme.titleSmall
                      ?.copyWith(color: AppColor.TEXT_PRIMARY),
                  children: [
                    TextSpan(
                      text: services.join(" | "),
                      style: theme.textTheme.titleSmall
                          ?.copyWith(color: AppColor.TEXT_COLOR),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined,
                      color: AppColor.PRIMARY, size: 20),
                  const SizedBox(width: 5),
                  Text(location,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(color: AppColor.TEXT_PRIMARY)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

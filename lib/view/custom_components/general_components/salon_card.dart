// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class SalonCard extends StatelessWidget {
  final String salonName;
  final int rating;
  final VoidCallback onPressed;
  final String location;

   SalonCard({
    super.key,
    required this.salonName,
    required this.location,
    required this.rating,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Container(
          width: 147,
          height: 121,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(salonName,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(color: AppColor.TEXT_PRIMARY)),
              const Divider(color: Colors.black54),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, color: AppColor.PRIMARY),
                  const SizedBox(width: 5),
                  Text(location,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(color: AppColor.TEXT_PRIMARY)),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: List.generate(rating, (index) {
                  return const Icon(Icons.star, color: Colors.amber, size: 20);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

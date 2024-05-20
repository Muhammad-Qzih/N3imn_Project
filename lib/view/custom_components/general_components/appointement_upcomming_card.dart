import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class UpCommeingAppointmentCard extends StatefulWidget {
  const UpCommeingAppointmentCard({super.key});

  @override
  State<UpCommeingAppointmentCard> createState() => _UpCommeingAppointmentCardState();
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
                    const Text(
                      'Feb 23,2024  5:30 PM',
                      style: TextStyle(
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
                            value: true, // This should be a state variable
                            onChanged: (bool newValue) {
                              // Handle switch state change
                            },
                            
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
              const Text(
                'Tayel Salon',
                style: TextStyle(
                  color: AppColor.TEXT_PRIMARY,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              RichText(
                text: const TextSpan(
                  text: 'Services: ',
                  style: TextStyle(
                    color: AppColor.TEXT_PRIMARY,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: 'Haircut | Hair style',
                      style: TextStyle(
                        color: AppColor.TEXT_SECONDARY_LIGHT,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Time Required: 1:30 h',
                style: TextStyle(
                  color: AppColor.TEXT_PRIMARY,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 25,
                        color: AppColor.PRIMARY,
                      ),
                      SizedBox(width: 2),
                      Text(
                        'Nablus',
                        style: TextStyle(
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
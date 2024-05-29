import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/utils/Dialogs/dialgos.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/booking_details_card.dart';

class MakeBookingScreen extends StatefulWidget {
  const MakeBookingScreen({super.key});

  @override
  State<MakeBookingScreen> createState() => _MakeBookingScreenState();
}

class _MakeBookingScreenState extends State<MakeBookingScreen> {
  int _currentStep = 0;
  final Set<String> _selectedServices = {};
  int _totalTime = 0;
  String? _selectedTime;

  final List<Map<String, dynamic>> _services = [
    {'title': 'Haircut', 'time': 30},
    {'title': 'Hair Style', 'time': 30},
    {'title': 'Beard Style', 'time': 30},
  ];

  final List<Map<String, List<String>>> mergedArray = [
    {
      'times': [
        '08:00 AM - 08:30 AM',
        '09:00 AM - 09:30 AM',
        '10:00 AM - 10:30 AM',
        '03:00 PM - 03:30 PM',
        '04:00 PM - 04:30 PM',
      ]
    },
    {
      'times': [
        '08:00 AM - 08:30 AM',
        '09:00 AM - 09:30 AM',
        '10:00 AM - 10:30 AM',
        '11:00 AM - 11:30 AM',
        '12:00 PM - 12:30 PM',
        '01:00 PM - 01:30 PM',
        '02:00 PM - 02:30 PM',
        '03:00 PM - 03:30 PM',
        '04:00 PM - 04:30 PM',
      ]
    },
    {
      'times': [
        '08:00 AM - 08:30 AM',
        '09:00 AM - 09:30 AM',
        '10:00 AM - 10:30 AM',
        '11:00 AM - 11:30 AM',
        '12:00 PM - 12:30 PM',
        '01:00 PM - 01:30 PM',
        '02:00 PM - 02:30 PM',
        '03:00 PM - 03:30 PM',
        '04:00 PM - 04:30 PM',
      ]
    },
    {
      'times': [
        '02:00 PM - 02:30 PM',
        '03:00 PM - 03:30 PM',
        '04:00 PM - 04:30 PM',
      ]
    },
    {
      'times': [
        '08:00 AM - 08:30 AM',
        '09:00 AM - 09:30 AM',
        '10:00 AM - 10:30 AM',
        '11:00 AM - 11:30 AM',
        '12:00 PM - 12:30 PM',
        '01:00 PM - 01:30 PM',
        '02:00 PM - 02:30 PM',
        '03:00 PM - 03:30 PM',
        '04:00 PM - 04:30 PM',
      ]
    },
    {
      'times': [
        '08:00 AM - 08:30 AM',
        '09:00 AM - 09:30 AM',
        '10:00 AM - 10:30 AM',
        '11:00 AM - 11:30 AM',
        '12:00 PM - 12:30 PM',
        '01:00 PM - 01:30 PM',
        '02:00 PM - 02:30 PM',
        '03:00 PM - 03:30 PM',
        '04:00 PM - 04:30 PM',
      ]
    },
    {
      'times': [
        '08:00 AM - 08:30 AM',
        '09:00 AM - 09:30 AM',
        '10:00 AM - 10:30 AM',
        '11:00 AM - 11:30 AM',
        '12:00 PM - 12:30 PM',
        '01:00 PM - 01:30 PM',
        '02:00 PM - 02:30 PM',
        '03:00 PM - 03:30 PM',
        '04:00 PM - 04:30 PM',
      ]
    },
    {
      'times': [
        '08:00 AM - 08:30 AM',
        '09:00 AM - 09:30 AM',
        '10:00 AM - 10:30 AM',
        '11:00 AM - 11:30 AM',
        '12:00 PM - 12:30 PM',
        '01:00 PM - 01:30 PM',
        '02:00 PM - 02:30 PM',
        '03:00 PM - 03:30 PM',
        '04:00 PM - 04:30 PM',
      ]
    },
    {
      'times': [
        '02:00 PM - 02:30 PM',
        '03:00 PM - 03:30 PM',
        '04:00 PM - 04:30 PM',
      ]
    },
    {
      'times': [
        '02:00 PM - 02:30 PM',
        '03:00 PM - 03:30 PM',
        '04:00 PM - 04:30 PM',
      ]
    },
    {
      'times': [
        '08:00 AM - 08:30 AM',
        '09:00 AM - 09:30 AM',
        '10:00 AM - 10:30 AM',
        '11:00 AM - 11:30 AM',
        '12:00 PM - 12:30 PM',
        '01:00 PM - 01:30 PM',
        '02:00 PM - 02:30 PM',
        '03:00 PM - 03:30 PM',
        '04:00 PM - 04:30 PM',
      ]
    },
    {
      'times': [
        '02:00 PM - 02:30 PM',
        '03:00 PM - 03:30 PM',
        '04:00 PM - 04:30 PM',
      ]
    },
    {
      'times': [
        '02:00 PM - 02:30 PM',
        '03:00 PM - 03:30 PM',
        '04:00 PM - 04:30 PM',
      ]
    },
    {
      'times': [
        '08:00 AM - 08:30 AM',
        '09:00 AM - 09:30 AM',
        '10:00 AM - 10:30 AM',
        '11:00 AM - 11:30 AM',
        '12:00 PM - 12:30 PM',
        '01:00 PM - 01:30 PM',
        '02:00 PM - 02:30 PM',
        '03:00 PM - 03:30 PM',
        '04:00 PM - 04:30 PM',
      ]
    },
  ];

  final List<String> daysOfFebruary2024 = [
    'Feb 1, 2024',
    'Feb 2, 2024',
    'Feb 3, 2024',
    'Feb 4, 2024',
    'Feb 5, 2024',
    'Feb 6, 2024',
    'Feb 7, 2024',
    'Feb 8, 2024',
    'Feb 9, 2024',
    'Feb 10, 2024',
    'Feb 11, 2024',
    'Feb 12, 2024',
    'Feb 13, 2024',
    'Feb 14, 2024',
  ];

  int currentIndex = 0;

  void previousDate() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  void nextDate() {
    if (currentIndex < daysOfFebruary2024.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void _nextStep() {
    if (_currentStep == 0 && _selectedServices.isEmpty) {
      return;
    }
    if (_currentStep < 2) {
      setState(() {
        _currentStep += 1;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  void _confirmStep() {
    _nextStep();
    Navigator.of(context).pushReplacementNamed("customerhomepage");
  }

  void _toggleServiceSelection(String service, int time) {
    setState(() {
      if (_selectedServices.contains(service)) {
        _selectedServices.remove(service);
        _totalTime -= time;
      } else {
        _selectedServices.add(service);
        _totalTime += time;
      }
    });
  }

  void _selectTime(String time) {
    setState(() {
      _selectedTime = time;
    });
  }

  Widget _buildStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Row(
          children: [
            _buildStep(index),
            if (index != 2) _buildLine(),
          ],
        );
      }),
    );
  }

  Widget _buildStep(int step) {
    bool isActive = step == _currentStep;
    bool isCompleted = step < _currentStep;

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? AppColor.PRIMARY : AppColor.PRIMARY_LIGHT,
              width: isActive ? 4.0 : 2.0,
            ),
          ),
          child: CircleAvatar(
            radius: isActive ? 22 : 20,
            backgroundColor: isActive || isCompleted
                ? AppColor.PRIMARY
                : AppColor.TEXT_SECONDARY,
            child: Text(
              '0${step + 1}',
              style: TextStyle(
                  color:
                      isActive || isCompleted ? Colors.white : AppColor.PRIMARY,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLine() {
    return Container(
      width: 100,
      height: 2,
      color: AppColor.PRIMARY_LIGHT,
    );
  }

  Widget _buildContent() {
    switch (_currentStep) {
      case 0:
        return Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Choose Services:",
                style: TextStyle(
                    color: AppColor.TEXT_PRIMARY,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              ..._services.map((service) {
                return CheckboxListTile(
                  title: Text(service['title']),
                  value: _selectedServices.contains(service['title']),
                  onChanged: (bool? value) {
                    _toggleServiceSelection(service['title'], service['time']);
                  },
                );
              }),
              if (_selectedServices.isNotEmpty)
                Text(
                  'Total time: ${_totalTime ~/ 60} hour(s) and ${_totalTime % 60} minute(s)',
                  style: const TextStyle(
                    color: AppColor.TEXT_PRIMARY,
                    fontSize: 16,
                  ),
                ),
            ],
          ),
        );
      case 1:
        return Expanded(
          child: Column(
            children: [
              const Text(
                "Select a Date:",
                style: TextStyle(
                    color: AppColor.TEXT_PRIMARY,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: previousDate,
                        icon: const Icon(Icons.arrow_back_ios),
                        color: const Color.fromARGB(255, 192, 191, 199),
                        iconSize: 50,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        daysOfFebruary2024[currentIndex],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: nextDate,
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: const Color.fromARGB(255, 192, 191, 199),
                        iconSize: 50,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Select a Time:",
                style: TextStyle(
                    color: AppColor.TEXT_PRIMARY,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView(
                  children: mergedArray[currentIndex]["times"]!.map((time) {
                    bool isSelected = _selectedTime == time;
                    bool isDisabled =
                        false; // Logic to disable times (e.g., past times)

                    return GestureDetector(
                      // ignore: dead_code
                      onTap: isDisabled ? null : () => _selectTime(time),
                      child: Card(
                        color: isSelected
                            ? AppColor.PRIMARY
                            : isDisabled
                                // ignore: dead_code
                                ? Colors.grey
                                : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                time,
                                style: TextStyle(
                                  color: isSelected || isDisabled
                                      ? Colors.white
                                      : AppColor.TEXT_PRIMARY,
                                ),
                              ),
                              ElevatedButton(
                                onPressed:
                                    // ignore: dead_code
                                    isDisabled ? null : () => _selectTime(time),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: isSelected
                                      ? AppColor.PRIMARY
                                      : Colors.white,
                                  backgroundColor: isSelected
                                      ? Colors.white
                                      : AppColor.PRIMARY,
                                ),
                                child: const Text('Select'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      case 2:
        return const Expanded(
            child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            BookingDetailsCard(),
          ],
        ));
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.TEXT_SECONDARY,
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: AppColor.TEXT_SECONDARY, size: 30),
        backgroundColor: AppColor.PRIMARY,
        title: const Text(
          "Make a Booking",
          style: TextStyle(
            fontSize: 20,
            color: AppColor.TEXT_SECONDARY,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildStepper(),
            const SizedBox(height: 20),
            _buildContent(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (_currentStep != 0)
                    CustomAuthButton(
                      buttonText: 'Back',
                      onPressed: _previousStep,
                    ),
                  if (_currentStep == 2)
                    CustomAuthButton(
                      buttonText: 'Confirm',
                      onPressed: () => {
                        _confirmStep()
                      },
                    ),
                  if (_currentStep != 2)
                    CustomAuthButton(
                      buttonText: 'Next',
                      onPressed: (_currentStep == 0
                          ? _selectedServices.isNotEmpty
                              ? _nextStep
                              : null
                          : (_selectedTime != null)
                              ? _nextStep
                              : null),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  const CustomAuthButton({
    super.key,
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColor.TEXT_SECONDARY,
        backgroundColor: AppColor.PRIMARY,
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 17),
        minimumSize: const Size(100, 60),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(buttonText),
    );
  }
}

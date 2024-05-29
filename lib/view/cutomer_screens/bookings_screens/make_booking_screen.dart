import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/booking_details_card.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_auth_button.dart';

class MakeBookingScreen extends StatefulWidget {
  const MakeBookingScreen({super.key});

  @override
  State<MakeBookingScreen> createState() => _MakeBookingScreenState();
}

class _MakeBookingScreenState extends State<MakeBookingScreen> {
  int _currentStep = 0;
  final Set<String> _selectedServices = {};

  void _nextStep() {
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
      appBar:   AppBar(
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
            const SizedBox(height: 100),
            _buildStepper(),
            const SizedBox(height: 100),
            _buildContent(),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 20, top: 30), // Add bottom margin here
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (_currentStep != 0)
                    CsutomAuthButton(
                      buttonText: 'Back',
                      onPressed: _previousStep,
                    ),
                  if (_currentStep == 2)
                    const CsutomAuthButton(
                      buttonText: 'Confiem',
                    ),
                  if (_currentStep != 2)
                    CsutomAuthButton(
                      buttonText: 'Next',
                      onPressed: _nextStep,
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

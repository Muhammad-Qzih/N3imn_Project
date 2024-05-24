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
      color: AppColor.PRIMARY_LIGHT
    );
  }

  Widget _buildContent() {
    switch (_currentStep) {
      case 0:
        return Column(
          children: [
            const Text(
              "Choose Services:",
              style: TextStyle(
                  color: AppColor.TEXT_PRIMARY,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text('Haircut'),
              value: _selectedServices.contains('Haircut'),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedServices.add('Haircut');
                  } else {
                    _selectedServices.remove('Haircut');
                  }
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Hair Style'),
              value: _selectedServices.contains('Hair Style'),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedServices.add('Hair Style');
                  } else {
                    _selectedServices.remove('Hair Style');
                  }
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Beard Style'),
              value: _selectedServices.contains('Beard Style'),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedServices.add('Beard Style');
                  } else {
                    _selectedServices.remove('Beard Style');
                  }
                });
              },
            ),
          ],
        );
      case 1:
        return const Text('Content for Step 2');
      case 2:
        return const Text('Content for Step 3');
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

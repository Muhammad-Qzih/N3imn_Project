import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:provider/provider.dart';
import '../../../view_model/feedback_view_model.dart';

class RateServicePage extends StatelessWidget {
  const RateServicePage(
      {super.key});

  @override
  Widget build(BuildContext context) {
        final argment = ModalRoute.of(context)!.settings.arguments as String;

    return ChangeNotifierProvider(
      create: (_) => FeedbackViewModel(),
      child: Scaffold(
        appBar:  AppBar(
          iconTheme:
          const IconThemeData(color: AppColor.TEXT_SECONDARY, size: 30),
          backgroundColor: AppColor.PRIMARY,
          title: const Text(
            "Rate our service",
            style: TextStyle(
              fontSize: 20,
              color: AppColor.TEXT_SECONDARY,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        body: Consumer<FeedbackViewModel>(
          builder: (context, viewModel, child) {
            return Container(
              color: AppColor.PRIMARY,
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 550,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const SizedBox(
                        height: 60,
                      ),
                      const Center(
                        child: Text(
                          'How is the service?',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return IconButton(
                            icon: Icon(
                              index < viewModel.rate
                                  ? Icons.star
                                  : Icons.star_border,
                              color: const Color(0xFFDFB300),
                              size: 45,
                            ),
                            onPressed: () {
                              viewModel.setRate(index + 1);
                            },
                          );
                        }),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Is there anything else you would like to add?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 42, 40, 40),
                        ),
                      ),
                      const SizedBox(height: 20),
                        TextField(
                          onChanged: viewModel.setFeedback,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: 'Enter your notes',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 0.7,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: ElevatedButton(
                            onPressed: viewModel.isLoading
                                ? null
                                : () async {
                              await viewModel.submitFeedback(
                                  argment, FirebaseAuth.instance.currentUser!.uid);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              AppColor.PRIMARY, // Purple button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: viewModel.isLoading
                                ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white),
                            )
                                : const Padding(
                              padding: EdgeInsets.all(14),
                              child: Text(
                                'Submit Rating',
                                style: TextStyle(
                                    color: AppColor.TEXT_SECONDARY,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
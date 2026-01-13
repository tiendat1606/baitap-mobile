import 'package:flutter/material.dart';
import 'onboarding_template.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingTemplate(
      image: 'assets/image/onboarding3.png',
      title: 'Reminder Notifications',
      description: 'Never miss deadlines again.',
      buttonText: 'Get Started',
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

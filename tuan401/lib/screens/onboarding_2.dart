import 'package:flutter/material.dart';
import 'onboarding_template.dart';
import 'onboarding_3.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingTemplate(
      image: 'assets/image/onboarding2.png',
      title: 'Increase Work Effectiveness',
      description: 'Focus on what really matters.',
      buttonText: 'Next',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Onboarding3(),
          ),
        );
      },
    );
  }
}

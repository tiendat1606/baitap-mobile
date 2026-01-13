import 'package:flutter/material.dart';
import 'onboarding_template.dart';
import 'onboarding_2.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingTemplate(
      image: 'assets/image/uth.jpg',
      title: 'UTH SmartTasks',
      description: 'Easy time management for your daily tasks',
      buttonText: 'Next',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Onboarding2(),
          ),
        );
      },
    );
  }
}

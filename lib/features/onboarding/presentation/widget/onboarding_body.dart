import 'package:animal_task/core/common/custom_app_button.dart';
import 'package:animal_task/core/constants/assets.dart';
import 'package:animal_task/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreenBody extends StatelessWidget {
  const OnboardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(images.pngOnboardingImage),
            SizedBox(height: 70),
            Text(
              'Find Your Best Companion With Us',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff090909),
                fontSize: 32,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),

            Text(
              'Join & discover the best suitable pets as per your preferences in your location',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff9F9F9F),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 61),
            CustomAppButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

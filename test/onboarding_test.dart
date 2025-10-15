import 'package:animal_task/core/common/custom_app_button.dart';
import 'package:animal_task/features/home/presentation/screen/home_screen.dart';
import 'package:animal_task/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('OnboardingScreen test', (tester) async {
    await tester.pumpWidget(MaterialApp(home: const OnboardingScreen()));
    await tester.tap(find.byType(CustomAppButton));
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}

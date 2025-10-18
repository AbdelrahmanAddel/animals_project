import 'package:animal_task/features/favorites/presentation/screen/favorites_screen.dart';
import 'package:animal_task/features/home/dependency_injection.dart';
import 'package:animal_task/features/home/presentation/screen/home_screen.dart';
import 'package:animal_task/features/main/presentation/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupServiceLocator();

  group('test main screen - ', () {
    testWidgets('initial state must be home screen', (tester) async {
      await tester.pumpWidget(MaterialApp(home: const MainScreen()));
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('when press on favorites icon state must be favorites screen', (
      tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MainScreen()));
      await tester.tap(find.byKey(Key('favorites')));
      await tester.pumpAndSettle();
      expect(find.byType(FavoritesScreen), findsOneWidget);
    });
    testWidgets('when press on messages icon state must be Placeholder ', (
      tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MainScreen()));
      await tester.tap(find.byKey(Key('messages')));
      await tester.pumpAndSettle();
      expect(find.byType(Placeholder), findsOneWidget);
    });
    testWidgets('when press on profile icon state must be Placeholder ', (
      tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MainScreen()));
      await tester.tap(find.byKey(Key('profile')));
      await tester.pumpAndSettle();
      expect(find.byType(Placeholder), findsOneWidget);
    });
  });
}

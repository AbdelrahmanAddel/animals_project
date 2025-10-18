import 'package:animal_task/features/favorites/presentation/screen/favorites_screen.dart';
import 'package:animal_task/features/home/presentation/screen/home_screen.dart';
import 'package:animal_task/main.dart' as app;
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('MainScreen Bottom Navigation Test', () {
    testWidgets('should switch screens when tapping bottom nav items', (
      tester,
    ) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('home')), findsOneWidget);

      await tester.tap(find.byKey(const Key('favorites')));
      await tester.pumpAndSettle();

      expect(find.byType(FavoritesScreen), findsOneWidget);

      await tester.tap(find.byKey(const Key('messages')));
      await tester.pumpAndSettle();

      expect(find.byType(Placeholder), findsOneWidget);

      await tester.tap(find.byKey(const Key('profile')));
      await tester.pumpAndSettle();

      expect(find.byType(Placeholder), findsOneWidget);

      await tester.tap(find.byKey(const Key('home')));
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}

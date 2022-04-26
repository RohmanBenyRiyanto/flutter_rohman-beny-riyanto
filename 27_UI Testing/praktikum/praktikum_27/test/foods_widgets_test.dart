import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum_25/views/home_page.dart';
import 'package:praktikum_25/views/views_model/view_model.dart';
import 'package:provider/provider.dart';

void main() {
  group(
    'Widgets Test',
    () {
      testWidgets(
        'Foods Widgets Test',
        (WidgetTester tester) async {
          // Build our app and trigger a frame.
          await tester.pumpWidget(
            MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => FoodViewModel(),
                ),
              ],
              child: const MaterialApp(
                home: HomePage(),
              ),
            ),
          );
          await tester.pumpAndSettle(const Duration(seconds: 3));

          expect(find.text('Foods'), findsOneWidget);
        },
      );
    },
  );
}

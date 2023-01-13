import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:powerpuff_girls/components/error_loading_page.dart';
import 'package:powerpuff_girls/utils/theme/colors.dart';

void main() {
  group('Should validate the error loading page', () {
    late Widget render;

    setUp(() {
      render = MaterialApp(
        home: ErrorLoadingPage(
          onPressed: () => {},
        ),
      );
    });

    testWidgets('Should contain a Text widget with text "Failed to get tv show data" and validate the style',
        (tester) async {
      await tester.pumpWidget(render);
      Text text = tester.firstWidget(find.text('Failed to get tv show data'));

      expect(find.textContaining('Failed to get tv show data'), findsOneWidget);
      expect(text.style?.color, colorYellow);
      expect(text, isA<Text>());
    });

    testWidgets('Should contain a TextButton with text "Try again" and tap on the button', (tester) async {
      await tester.pumpWidget(render);
      TextButton textButton = tester.firstWidget(find.byType(TextButton));

      await tester.tap(find.byType(TextButton));

      await tester.pump();

      expect(find.byType(TextButton), findsOneWidget);
      expect(textButton, isA<TextButton>());
    });

    testWidgets('Should validate if contains only 1 widget of center in the widget three', (tester) async {
      await tester.pumpWidget(render);

      expect(find.byType(Center), findsOneWidget);
    });
    testWidgets('Should validate if contains Column widget and validate the MainAxisAlignment', (tester) async {
      await tester.pumpWidget(render);

      Column column = tester.firstWidget(find.byType(Column));

      expect(find.byType(Column), findsOneWidget);
      expect(column.mainAxisAlignment, MainAxisAlignment.center);
    });
  });
}

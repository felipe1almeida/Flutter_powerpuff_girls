import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:powerpuff_girls/components/episode_details_synopsis.dart';
import 'package:powerpuff_girls/utils/theme/colors.dart';
import 'package:powerpuff_girls/utils/theme/styled_text.dart';
import 'package:styled_text/styled_text.dart';

Widget buildWidgets(Widget widget) => MaterialApp(home: Column(children: [widget]));

void main() {
  group('Should validate episode details synopsis component ui', () {
    late Widget render;

    // Render a widget that displays the synopsis of an episode.
    // The summary parameter is used to display the synopsis.
    setUp(() {
      render = MaterialApp(
        home: Column(
          children: const [EpisodeDetailsSynopsis(summary: 'summary')],
        ),
      );
    });

    testWidgets(
        'Should render the StyledText widget, which contains the text that is passed as a parameter to the class and validate the tags',
        (tester) async {
      await tester.pumpWidget(render);
      StyledText styledText = tester.firstWidget(find.byType(StyledText));

      expect(find.byType(StyledText), findsOneWidget);
      expect(styledText.tags, styledTags);
    });

    testWidgets('Should render the Text widget, and validate that contains the exact text: "Synopsis"', (tester) async {
      await tester.pumpWidget(render);

      await tester.pump();

      expect(find.byType(Text), findsOneWidget);
      expect(find.text('Synopsis'), findsOneWidget);
    });

    testWidgets(
        'Should render the Column widget and validate that contains the style crossAxisAlignment: CrossAxisAlignment.start',
        (tester) async {
      await tester.pumpWidget(buildWidgets(const EpisodeDetailsSynopsis(summary: 'summary')));

      Column columnBuild = tester.firstWidget(find.byType(Column));

      expect(find.byType(Column), findsWidgets);
      expect(columnBuild.crossAxisAlignment, CrossAxisAlignment.center);
    });
    testWidgets('Should render the Padding widget', (tester) async {
      await tester.pumpWidget(buildWidgets(const EpisodeDetailsSynopsis(summary: 'summary')));

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('Should render the Sizedbox with height 16', (tester) async {
      await tester.pumpWidget(buildWidgets(const EpisodeDetailsSynopsis(summary: 'summary')));

      SizedBox sizedBox = tester.firstWidget(find.byType(SizedBox));
      expect(sizedBox.height, 16);
      expect(sizedBox, isA<SizedBox>());
    });

    testWidgets(
        'Should render a text widget and validate that matches the text style [ Fontsize 18, color: colorPrimary, FontWeight.w600 ',
        (tester) async {
      await tester.pumpWidget(buildWidgets(const EpisodeDetailsSynopsis(summary: 'summary')));

      Text text = tester.firstWidget(find.text('Synopsis'));

      expect(text.style?.fontSize, 18);
      expect(text.style?.color, colorPrimary);
      expect(text.style?.fontWeight, FontWeight.w600);
      expect(text, isA<Text>());
    });

    testWidgets(
        'Should render a text widget and validate that matches the text style [ Fontsize 18, color: colorPrimary, FontWeight.w600 ',
        (tester) async {
      await tester.pumpWidget(buildWidgets(const EpisodeDetailsSynopsis(summary: 'summary')));
      StyledText styledText = tester.firstWidget(find.byType(StyledText));

      expect(styledText.text, 'summary');
      expect(styledText, isA<StyledText>());
    });

    testWidgets(
        'Should validate that the components renders all the components in order [ Expanded -> Padding -> Column -> Text -> SizedBox -> SingleChildScrollView -> StyledText ]',
        (tester) async {
      await tester.pumpWidget(buildWidgets(const EpisodeDetailsSynopsis(summary: 'summary')));

      expect(find.byType(Expanded), findsOneWidget);
      expect(find.byType(Padding), findsOneWidget);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(SizedBox), findsWidgets);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(StyledText), findsOneWidget);
    });
  });
}

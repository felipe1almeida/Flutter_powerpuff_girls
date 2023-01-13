import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:powerpuff_girls/components/episodes_list.dart';
import 'package:powerpuff_girls/models/tv_show_episodes_model.dart';
import 'package:powerpuff_girls/utils/mocks/episode_list_mock.dart';
import 'package:powerpuff_girls/utils/theme/colors.dart';

void main() {
  group('Should validate the widgets from EpisodesList component', () {
    late Widget render;
    TvShowEpisodesModel episodeMock = TvShowEpisodesModel.fromJson(episodesListMock[0]);

    setUp(() {
      render = MaterialApp(
        home: Scaffold(body: EpisodesList(episode: episodeMock)),
      );
    });

    testWidgets('Should contain 1 Divider Widget and validate the style', (tester) async {
      await tester.pumpWidget(render);

      Divider divider = tester.firstWidget(find.byType(Divider));
      expect(divider.color, colorDividerList);
      expect(divider.thickness, 1);
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('Should render the Column widget', (tester) async {
      await tester.pumpWidget(render);

      expect(find.byType(Column), findsOneWidget);
    });
    testWidgets('Should render the ListTile widget', (tester) async {
      await tester.pumpWidget(render);

      expect(find.byType(ListTile), findsOneWidget);
    });
    testWidgets('Should render 3 RichText widget wich consist in 1 RichText and 2 TextSpan in the three',
        (tester) async {
      await tester.pumpWidget(render);

      expect(find.byType(RichText), findsNWidgets(3));
    });
    testWidgets('Should render TextSpan with the Season number and Episode number', (tester) async {
      await tester.pumpWidget(render);

      final text = find.byWidgetPredicate((widget) =>
          widget is RichText && widget.text.toPlainText() == 'S1 E1: Monkey See, Doggie Do / Mommy Fearest');

      expect(text, findsOneWidget);
    });
    testWidgets('Should render RichText and validate the style', (tester) async {
      await tester.pumpWidget(render);

      RichText richText = tester.firstWidget(find.byType(RichText));

      expect(richText.text.style?.color, colorYellow);
      expect(richText.text.style?.fontSize, 14);
      expect(richText.text.style?.fontWeight, FontWeight.bold);
    });
    testWidgets('Should render Text widget with the airdate of episode "Nov 18, 1998" and validate the style',
        (tester) async {
      await tester.pumpWidget(render);

      Text text = tester.firstWidget(find.byType(Text));

      await tester.pump();

      expect(text.data, 'Nov 18, 1998');
      expect(text.style?.color, colorPrimary);
      expect(text.style?.fontWeight, FontWeight.bold);
      expect(text.style?.fontSize, 14);
    });
    testWidgets('Should render Icon widget and validate the style', (tester) async {
      await tester.pumpWidget(render);

      Icon icon = tester.firstWidget(find.byType(Icon));

      expect(icon, isA<Icon>());
      expect(icon.icon, Icons.arrow_forward_ios);
      expect(icon.color, colorPrimary);
    });
    testWidgets('Should tap on ListTile and redirect the page', (tester) async {
      Get.testMode = true;
      await tester.pumpWidget(render);

      await tester.tap(find.byType(ListTile));

      await tester.pump();

      expect(Get.currentRoute, '');
    });
  });
}

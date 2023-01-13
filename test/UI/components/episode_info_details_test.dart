import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:powerpuff_girls/components/episode_info_details.dart';
import 'package:powerpuff_girls/models/tv_show_episodes_model.dart';
import 'package:powerpuff_girls/utils/mocks/episode_list_mock.dart';
import 'package:powerpuff_girls/utils/theme/colors.dart';

void main() {
  group('Should validate the widgets from episodeInfoDetails component', () {
    late Widget render;
    TvShowEpisodesModel episodeMock = TvShowEpisodesModel.fromJson(episodesListMock[1]);

    setUp(() {
      render = MaterialApp(
        home: Stack(
          children: [
            EpisodeInfoDetails(
              episode: episodeMock,
            ),
          ],
        ),
      );
    });

    testWidgets('Should render the container and validate the properties', (tester) async {
      await tester.pumpWidget(render);

      Container container = tester.firstWidget(find.byType(Container));
      expect(container.constraints?.widthConstraints().maxWidth, double.infinity);
      expect(container.constraints?.heightConstraints().maxHeight, 90);
      expect(container, isA<Container>());
      expect(container, isNot(SizedBox));
    });

    testWidgets('Should render the name of tv show and validate the style', (tester) async {
      await tester.pumpWidget(render);

      Text text = tester.firstWidget(find.textContaining('Insect Inside / Powerpuff Bluff'));
      expect(text.data, 'S1 E2: Insect Inside / Powerpuff Bluff'); // data from mock
      expect(text.style?.color, colorYellow);
      expect(text.style?.fontSize, 18);
      expect(text.style?.fontWeight, FontWeight.w700);
      expect(text.overflow, TextOverflow.ellipsis);
      expect(text, isA<Text>());
    });

    testWidgets('Should render runtime as 30 minutes and validate the style', (tester) async {
      await tester.pumpWidget(render);

      Text text = tester.firstWidget(find.textContaining('30 minutes'));

      expect(text.data, '30 minutes');
      expect(text.style?.color, colorPrimary);
      expect(text.style?.fontSize, 14);
      expect(text.style?.fontWeight, FontWeight.w500);
      expect(text, isA<Text>());
    });

    testWidgets('Should render an icon access_time_rounded and validate the size and color', (tester) async {
      await tester.pumpWidget(render);

      Icon icon = tester.firstWidget(find.byType(Icon));

      expect(icon.icon, Icons.access_time_rounded);
      expect(icon.color, colorPrimary);
      expect(icon.size, 14);
      expect(icon, isA<Icon>());
    });

    testWidgets('Should render and validate if there is 3 Sizedbox widget', (tester) async {
      await tester.pumpWidget(render);

      expect(find.byType(SizedBox), findsNWidgets(3));
    });

    testWidgets('Should render the text widget with the airdate for the episode in "MMM dd, yyyy" format',
        (tester) async {
      await tester.pumpWidget(render);

      Text text = tester.firstWidget(find.textContaining('1998'));

      expect(text.data, 'Nov 25, 1998');
      expect(text.style?.color, colorPrimary);
      expect(text.style?.fontSize, 14);
      expect(text.style?.fontWeight, FontWeight.w500);
      expect(text, isA<Text>());
    });
  });
}

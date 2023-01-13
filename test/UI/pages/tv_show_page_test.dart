import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:powerpuff_girls/controllers/tv_show_controller.dart';
import 'package:powerpuff_girls/models/tv_show_episodes_model.dart';
import 'package:powerpuff_girls/models/tv_show_model.dart';
import 'package:powerpuff_girls/pages/tv_show_page.dart';
import 'package:powerpuff_girls/repositories/tv_show_repository.dart';
import 'package:powerpuff_girls/utils/mocks/episode_list_mock.dart';
import 'package:powerpuff_girls/utils/mocks/tv_show_info_mock.dart';
import 'package:powerpuff_girls/utils/theme/colors.dart';
import 'package:powerpuff_girls/utils/theme/styled_text.dart';
import 'package:styled_text/styled_text.dart';

void main() {
  group('Should validate episode details synopsis component ui components', () {
    late Widget render;
    late TvShowController controller;
    late TvShowRepository tvShowRepository;

    final episodesMock = <TvShowEpisodesModel>[];
    episodesMock.add(TvShowEpisodesModel.fromJson(episodesListMock[0]));
    episodesMock.add(TvShowEpisodesModel.fromJson(episodesListMock[1]));

    final dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: dio);

    dioAdapter.onGet(
      '/shows/1955',
      (server) => server.reply(
        200,
        TvShowModel.fromJson(tvShowInfoMock),
      ),
    );

    dioAdapter.onGet(
      '/shows/1955/episodes',
      (server) => server.reply(
        200,
        episodesMock,
      ),
    );

    setUp(() {
      tvShowRepository = Get.put(TvShowRepository(dio: dio));
      controller = Get.put(TvShowController(tvShowRepository: tvShowRepository));

      render = const MaterialApp(home: TvShowPage());
      HttpOverrides.global = null;
    });

    testWidgets('Should render the tvshow name and validate the style', (tester) async {
      tester.runAsync(() async {
        when(controller.getEpisodes()).thenAnswer(
          (_) => Future.delayed(
            const Duration(milliseconds: 50),
            () => episodesMock,
          ),
        );
        when(controller.getTvShow()).thenAnswer(
          (_) => Future.delayed(
            const Duration(milliseconds: 50),
            () => TvShowModel.fromJson(tvShowInfoMock),
          ),
        );
      });

      await tester.pumpWidget(render);
      await tester.pumpAndSettle(const Duration(seconds: 10), EnginePhase.build, const Duration(minutes: 1));

      final Text showName = tester.firstWidget(find.byKey(const ValueKey('show_name')));

      expect(showName.data, 'The Powerpuff Girls');
      expect(showName.style?.fontWeight, FontWeight.w700);
      expect(showName.style?.fontSize, 18);
      expect(showName.style?.letterSpacing, 2.0);
      expect(showName.style?.color, colorYellow);
      expect(showName, isA<Text>());
    });
    testWidgets('Should render the widget StyledText and the summary for the show and validate the style',
        (tester) async {
      tester.runAsync(() async {
        when(controller.getEpisodes()).thenAnswer(
          (_) => Future.delayed(
            const Duration(milliseconds: 50),
            () => episodesMock,
          ),
        );
        when(controller.getTvShow()).thenAnswer(
          (_) => Future.delayed(
            const Duration(milliseconds: 50),
            () => TvShowModel.fromJson(tvShowInfoMock),
          ),
        );
      });

      await tester.pumpWidget(render);
      await tester.pumpAndSettle(const Duration(seconds: 10), EnginePhase.build, const Duration(minutes: 1));

      final StyledText showSummary = tester.firstWidget(find.byKey(const ValueKey('show_summary')));
      expect(showSummary.text.contains('is an award-winning animated action series'), true);
      expect(showSummary.style?.color, colorSecondary);
      expect(showSummary.tags, styledTags);
      expect(showSummary, isA<StyledText>());
    });

    testWidgets('Should render an icon local_activity and validate the color', (tester) async {
      tester.runAsync(() async {
        when(controller.getTvShow()).thenAnswer(
          (_) => Future.delayed(
            const Duration(milliseconds: 50),
            () => TvShowModel.fromJson(tvShowInfoMock),
          ),
        );
      });

      await tester.pumpWidget(render);
      await tester.pumpAndSettle(const Duration(seconds: 10), EnginePhase.build, const Duration(minutes: 1));

      Icon icon = tester.firstWidget(find.byType(Icon));

      expect(icon.icon, Icons.local_activity);
      expect(icon.color, colorYellow);
      expect(icon, isA<Icon>());
    });

    testWidgets('Should render a Text widget with 1998 - 2004 | Ended |  Rating: 7.3', (tester) async {
      tester.runAsync(() async {
        when(controller.getEpisodes()).thenAnswer(
          (_) => Future.delayed(
            const Duration(milliseconds: 50),
            () => episodesMock,
          ),
        );
        when(controller.getTvShow()).thenAnswer(
          (_) => Future.delayed(
            const Duration(milliseconds: 50),
            () => TvShowModel.fromJson(tvShowInfoMock),
          ),
        );
      });

      await tester.pumpWidget(render);
      await tester.pumpAndSettle(const Duration(seconds: 10), EnginePhase.build, const Duration(minutes: 1));

      final Text showInfo = tester.firstWidget(find.byKey(const ValueKey('show_info')));
      expect(showInfo.data?.contains('1998 - 2004 | Ended |  Rating: 7.3'), true);
    });

    testWidgets('Should render 8 Center widget type through lifecycle of build ', (tester) async {
      tester.runAsync(() async {
        when(controller.getEpisodes()).thenAnswer(
          (_) => Future.delayed(
            const Duration(milliseconds: 50),
            () => episodesMock,
          ),
        );
        when(controller.getTvShow()).thenAnswer(
          (_) => Future.delayed(
            const Duration(milliseconds: 50),
            () => TvShowModel.fromJson(tvShowInfoMock),
          ),
        );
      });
      await tester.pumpWidget(render);

      await tester.pumpAndSettle();

      expect(find.byType(Center), findsNWidgets(8));
    });
  });
}

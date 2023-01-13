import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:powerpuff_girls/controllers/tv_show_details_controller.dart';
import 'package:powerpuff_girls/models/tv_show_episodes_model.dart';
import 'package:powerpuff_girls/models/tv_show_model.dart';
import 'package:powerpuff_girls/pages/tv_show_details_page.dart';
import 'package:powerpuff_girls/repositories/tv_show_repository.dart';
import 'package:powerpuff_girls/utils/mocks/episode_list_mock.dart';
import 'package:powerpuff_girls/utils/mocks/tv_show_info_mock.dart';
import 'package:powerpuff_girls/utils/theme/colors.dart';

TvShowEpisodesModel episodeMock = TvShowEpisodesModel.fromJson(episodesListMock[1]);

void main() {
  late Widget render;
  late TvShowDetailsController controller;
  late TvShowRepository repositoryMock;
  final dio = Dio(BaseOptions());
  final dioAdapter = DioAdapter(dio: dio);

  final episodesMock = <TvShowEpisodesModel>[];
  episodesMock.add(TvShowEpisodesModel.fromJson(episodesListMock[0]));
  episodesMock.add(TvShowEpisodesModel.fromJson(episodesListMock[1]));

  setUp(() {
    controller = Get.put<TvShowDetailsController>(TvShowDetailsController());
    repositoryMock = Get.put<TvShowRepository>(TvShowRepository(dio: dio));
    render = const MaterialApp(home: TvShowDetailsPage());
    controller.episode = episodeMock;
    HttpOverrides.global = null;
  });

  dioAdapter.onGet(
    '/shows/1955/episodes',
    (server) => server.reply(
      200,
      episodesMock,
    ),
  );

  testWidgets('Should render 3 Column widget through lifecycle of build', (tester) async {
    tester.runAsync(() async {
      when(repositoryMock.getEpisodes(1955)).thenAnswer(
        (realInvocation) => Future.delayed(
          const Duration(milliseconds: 50),
          () => episodesMock,
        ),
      );
      when(repositoryMock.getTvShowDetails(1955)).thenAnswer(
        (realInvocation) => Future.delayed(
          const Duration(milliseconds: 50),
          () => TvShowModel.fromJson(tvShowInfoMock),
        ),
      );
    });
    await tester.pumpWidget(render);

    expect(find.byType(Column), findsNWidgets(3));
  });

  testWidgets('Should render a container and validate the style', (tester) async {
    tester.runAsync(() async {
      when(repositoryMock.getEpisodes(1955)).thenAnswer(
        (realInvocation) => Future.delayed(
          const Duration(milliseconds: 50),
          () => episodesMock,
        ),
      );
      when(repositoryMock.getTvShowDetails(1955)).thenAnswer(
        (realInvocation) => Future.delayed(
          const Duration(milliseconds: 50),
          () => TvShowModel.fromJson(tvShowInfoMock),
        ),
      );
    });
    await tester.pumpWidget(render);

    Container container = tester.firstWidget(find.byType(Container));

    expect(container, isA<Container>());
    expect(
      container.decoration,
      const BoxDecoration(
        color: colorYellow,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  });
  testWidgets('Should render an icon and validate the style', (tester) async {
    Get.testMode = true;
    tester.runAsync(() async {
      when(repositoryMock.getEpisodes(1955)).thenAnswer(
        (realInvocation) => Future.delayed(
          const Duration(milliseconds: 50),
          () => episodesMock,
        ),
      );
      when(repositoryMock.getTvShowDetails(1955)).thenAnswer(
        (realInvocation) => Future.delayed(
          const Duration(milliseconds: 50),
          () => TvShowModel.fromJson(tvShowInfoMock),
        ),
      );
    });
    await tester.pumpWidget(render);

    IconButton iconButton = tester.firstWidget(find.byType(IconButton));

    await tester.tap(find.byType(IconButton));

    await tester.pump();

    expect(iconButton, isA<IconButton>());
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:powerpuff_girls/controllers/tv_show_details_controller.dart';
import 'package:powerpuff_girls/models/tv_show_episodes_model.dart';
import 'package:powerpuff_girls/utils/mocks/episode_list_mock.dart';

TvShowEpisodesModel episodeMock = TvShowEpisodesModel.fromJson(episodesListMock[1]);

void main() {
  late TvShowDetailsController controller;

  setUp(() {
    controller = Get.put<TvShowDetailsController>(TvShowDetailsController());
    controller.episode = episodeMock;
  });
  group('TvShowDetailsController', () {
    test('episode should return correct value', () {
      controller.episode = episodeMock;

      expect(controller.episode, episodeMock);
    });
    test('Should contain the episode name', () {
      expect(controller.episode.name, 'Insect Inside / Powerpuff Bluff');
    });
    test('Should contain an instance of TvShowDetailsController', () {
      expect(controller, isA<TvShowDetailsController>());
    });
  });
}

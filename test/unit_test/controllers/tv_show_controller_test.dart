import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/instance_manager.dart';
import 'package:powerpuff_girls/controllers/tv_show_controller.dart';
import 'package:powerpuff_girls/models/tv_show_model.dart';
import 'package:powerpuff_girls/repositories/tv_show_repository.dart';
import 'package:powerpuff_girls/utils/mocks/tv_show_info_mock.dart';

void main() {
  TvShowController controller = Get.put(TvShowController(tvShowRepository: TvShowRepository(dio: Dio())));
  final TvShowModel tvshowMock = TvShowModel.fromJson(tvShowInfoMock);

  setUp(() {
    controller = TvShowController(tvShowRepository: TvShowRepository(dio: Dio()));
  });

  group('TvShowController', () {
    test('formatShowInfo should return correct string', () {
      final String result = controller.formatShowInfo(
        premiere: '2022-01-01',
        ended: '2022-01-31',
        status: 'Ended',
        rating: 8.5,
      );

      expect(result, equals('2022 - 2022 | Ended |  Rating: 8.5'));
    });

    test('formatShowInfo should return correct string based on a mock from the tvshow', () {
      final String result = controller.formatShowInfo(
        premiere: tvshowMock.premiered,
        ended: tvshowMock.ended,
        status: tvshowMock.status,
        rating: tvshowMock.rating?.average,
      );

      expect(result, equals('1998 - 2004 | Ended |  Rating: 7.3'));
    });
    test('formatShowInfo should N/A value for null values', () {
      final String result = controller.formatShowInfo(
        premiere: null,
        ended: null,
        status: null,
        rating: null,
      );

      expect(result, equals('N/A - N/A | N/A |  Rating: 0.0'));
    });

    test('formatShowInfo should N/A value for empty values', () {
      final String result = controller.formatShowInfo(
        premiere: '',
        ended: '',
        status: '',
        rating: 0.0,
      );

      expect(result, equals('N/A - N/A | N/A |  Rating: 0.0'));
    });
  });
}

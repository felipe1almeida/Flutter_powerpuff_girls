import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:powerpuff_girls/controllers/tv_show_controller.dart';
import 'package:powerpuff_girls/repositories/tv_show_repository.dart';

void main() {
  TvShowController controller = Get.put(TvShowController(tvShowRepository: TvShowRepository(dio: Dio())));

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
  });
}

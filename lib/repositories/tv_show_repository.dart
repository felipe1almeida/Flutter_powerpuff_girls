import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/tv_show_episodes_model.dart';
import '../models/tv_show_model.dart';

class TvShowRepository {
  final Dio _dio;

  TvShowRepository({required Dio dio}) : _dio = dio;

  Future<TvShowModel> getTvShowDetails(int id) async {
    try {
      final response = await _dio.get('/shows/$id');

      return TvShowModel.fromJson(response.data);
    } on DioError catch (e, s) {
      log(e.message, error: e, stackTrace: s);
      throw Exception();
    }
  }

  Future<List<TvShowEpisodesModel>> getEpisodes(int id) async {
    try {
      final response = await _dio.get('/shows/$id/episodes');
      final List<TvShowEpisodesModel> tvData = [];
      response.data.forEach(
        (episode) {
          tvData.add(TvShowEpisodesModel.fromJson(episode));
        },
      );

      return tvData;
    } on DioError catch (e, s) {
      log(e.message, error: e, stackTrace: s);
      throw Exception();
    }
  }
}

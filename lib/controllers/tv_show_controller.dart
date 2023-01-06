import 'package:get/get.dart';

import '../models/tv_show_episodes_model.dart';
import '../models/tv_show_model.dart';
import '../repositories/tv_show_repository.dart';
import '../utils/contants.dart';
import '../utils/functions/shared_function.dart';

class TvShowController extends GetxController {
  final TvShowRepository _tvShowRepository;

  final List<TvShowEpisodesModel> episodes = <TvShowEpisodesModel>[].obs;

  TvShowController({required TvShowRepository tvShowRepository}) : _tvShowRepository = tvShowRepository;

  Future<TvShowModel> getTvShow() async {
    final response = await _tvShowRepository.getTvShowDetails(apiShowId);
    _getEpisodes();
    return response;
  }

  Future<List<TvShowEpisodesModel>> _getEpisodes() async {
    final response = await _tvShowRepository.getEpisodes(apiShowId);
    episodes.clear();
    episodes.addAll(response);
    return response;
  }

  String formatShowInfo(
      {required String? premiere, required String? ended, required String? status, required double? rating}) {
    if (premiere != 'N/A') {
      premiere = formatDate(date: premiere!, format: 'yyyy');
    }
    if (ended != 'N/A') {
      ended = formatDate(date: ended!, format: 'yyyy');
    }
    if (status != 'N/A') {
      status = status!;
    }

    return '$premiere - $ended | $status |  Rating: $rating';
  }
}

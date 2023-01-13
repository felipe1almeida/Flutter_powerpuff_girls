import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:powerpuff_girls/models/tv_show_episodes_model.dart';
import 'package:powerpuff_girls/models/tv_show_model.dart';
import 'package:powerpuff_girls/utils/mocks/episode_list_mock.dart';
import 'package:powerpuff_girls/utils/mocks/tv_show_info_mock.dart';

void main() {
  final episodesMock = <TvShowEpisodesModel>[];
  episodesMock.add(TvShowEpisodesModel.fromJson(episodesListMock[0]));
  episodesMock.add(TvShowEpisodesModel.fromJson(episodesListMock[1]));
  test('should return a tvshow model with the name of show The Powerpuff Girls', () async {
    final dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: dio);

    dioAdapter.onGet(
      '/shows/',
      (server) => server.reply(
        200,
        TvShowModel.fromJson(tvShowInfoMock),
      ),
    );

    final response = await dio.get('/shows/');

    expect(response.data['name'], 'The Powerpuff Girls');
    expect(response.data, isA<Map<String, dynamic>>());
  });

  test('should throw an exception on request when trying to the show details', () async {
    final dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: dio);

    final response = Response(statusCode: 500, requestOptions: RequestOptions(path: '/shows/'));
    const type = DioErrorType.response;
    const error = 'Dio error';

    dioAdapter.onGet(
      '/shows/',
      (server) => server.throws(
        500,
        DioError(response: response, type: type, error: error, requestOptions: response.requestOptions),
      ),
    );

    expect(() async => await dio.get('/shows/'), throwsA(isA<DioError>()));
  });

  test('should return a list of episodes from model TvShowEpisodesModel', () async {
    late final dio = Dio(BaseOptions());
    late final dioAdapter = DioAdapter(dio: dio);

    dioAdapter.onGet(
      '/shows/1/episodes',
      (server) => server.reply(
        200,
        List.generate(3, (index) => TvShowEpisodesModel(name: 'ep$index')),
      ),
    );

    final response = await dio.get('/shows/1/episodes');

    expect(response.data, isA<List>());
    expect(response.data.length, 3);
  });
  test('should return a list of episodes from model TvShowEpisodesModel with mock data', () async {
    late final dio = Dio(BaseOptions());
    late final dioAdapter = DioAdapter(dio: dio);

    dioAdapter.onGet(
      '/shows/1/episodes',
      (server) => server.reply(
        200,
        episodesMock,
      ),
    );

    final response = await dio.get('/shows/1/episodes');
    expect(response.data, isA<List>());
    expect(response.data.first['name'], 'Monkey See, Doggie Do / Mommy Fearest');
    expect(response.data[1]['name'], 'Insect Inside / Powerpuff Bluff');
    expect(response.data.length, 2);
  });

  test(
      'should return a list of episodes from model TvShowEpisodesModel and validate the first episode name is Monkey See, Doggie Do / Mommy Fearest and the last episode name is What\'s the Big Idea? / Roughing It Up',
      () async {
    late final dio = Dio(BaseOptions());
    late final dioAdapter = DioAdapter(dio: dio);
    late List<TvShowEpisodesModel> tvData = [];

    for (var element in episodesListMock) {
      tvData.add(TvShowEpisodesModel.fromJson(element));
    }

    dioAdapter.onGet(
      '/shows/1/episodes',
      (server) => server.reply(
        200,
        tvData,
      ),
    );

    final response = await dio.get('/shows/1/episodes');
    expect(response.data.first['name'], 'Monkey See, Doggie Do / Mommy Fearest');
    expect(response.data.last['name'], 'What\'s the Big Idea? / Roughing It Up');
  });

  test('should return a exception from dio, dioError when trying to get the episode detail', () async {
    late final dio = Dio(BaseOptions());
    late final dioAdapter = DioAdapter(dio: dio);

    final response = Response(statusCode: 500, requestOptions: RequestOptions(path: '/shows/1/episodes'));
    const type = DioErrorType.response;
    const error = 'Dio error';

    dioAdapter.onGet(
      '/shows/1/episodes',
      (server) => server.throws(
        500,
        DioError(response: response, type: type, error: error, requestOptions: response.requestOptions),
      ),
    );

    expect(() async => await dio.get('/shows/1/episodes'), throwsA(isA<DioError>()));
  });

  test('Dio error', () async {
    late final dio = Dio(BaseOptions());
    late final dioAdapter = DioAdapter(dio: dio);

    final response = Response(statusCode: 500, requestOptions: RequestOptions(path: '/shows/1/episodes'));
    const type = DioErrorType.response;
    const error = 'Dio error';

    dioAdapter.onGet(
      '/shows/1/episodes',
      (server) => server.throws(
        500,
        DioError(response: response, type: type, error: error, requestOptions: response.requestOptions),
      ),
    );

    expect(() async => await dio.get('/shows/1/episodes'), throwsA(isA<DioError>()));
  });
}

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:powerpuff_girls/utils/contants.dart';

void main() {
  group(
    'Test the endpoints from tv show repository',
    () {
      test('Should return a model of TvShowModel if the request was successfully', () async {
        final client = Dio(BaseOptions(baseUrl: 'https://api.tvmaze.com'));
        final response = await client.get('/shows/$apiShowId');

        expect(response.data['name'], 'The Powerpuff Girls');
      });

      test('Should return the name of the tv show lost', () async {
        final client = Dio(BaseOptions(baseUrl: apiUrl));
        final response = await client.get('/shows/123');

        expect(response.data['name'], 'Lost');
      });
      
      test('Should return a list of 78 episodes for the tv show', () async {
        final client = Dio(BaseOptions(baseUrl: apiUrl));
        final response = await client.get('/shows/$apiShowId/episodes');

        expect(response.data.length, 78);
      });
    },
  );
}

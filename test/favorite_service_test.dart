import 'package:mockito/mockito.dart';
import 'package:reservapp/services/favorite_service.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:reservapp/routes/router.dart' as router;
import 'package:reservapp/assets/constants/consts.dart' as constants;

import 'favorite_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main(){
  group("FavoriteService tests for fetching reservations made by a user", () {
    late http.Client mockClient;
    late FavoriteService favoriteService;
    int userId = 1;

    setUp(() {
      mockClient = MockClient();
      favoriteService = FavoriteService(mockClient);
    });

    test("Should return an HTTP 200 OK with a response body containing a JSON list with the user's favorites when making a successful request", () async {
      when(mockClient.get(router.listFavorites(constants.LOCAL_HOST, {'q' : userId.toString()}))).thenAnswer((_) async => http.Response(
          '''
        [
          {
            "id": 1,
            "data": "2023-06-22",
            "horario": "22:30:00",
            "numeroPessoas": 2,
            "usuario_id": 1,
            "restaurante_id": 1
          },
          {
            "id": 2,
            "data": "2023-07-22",
            "horario": "22:30:00",
            "numeroPessoas": 2,
            "usuario_id": 1,
            "restaurante_id": 2
          }
        ]
        ''',
          200
      ));

      http.Response response = await favoriteService.getUserFavorites(userId);

      expect(response.statusCode, 200);
      expect(response.body, isNot(equals('null')));
    });

    test("Should throw an exception on an unsuccessful request", () async {
      when(mockClient.get(router.listFavorites(constants.LOCAL_HOST, {'q' : userId.toString()}))).thenThrow(Exception());

      expect(favoriteService.getUserFavorites(userId), throwsException);
    });
  });
}
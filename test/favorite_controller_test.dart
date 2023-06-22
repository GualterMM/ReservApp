import 'package:mockito/mockito.dart';
import 'package:reservapp/controllers/favorite_controller.dart';
import 'package:reservapp/services/favorite_service.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'favorite_controller_test.mocks.dart';

@GenerateMocks([FavoriteService])
void main() {
  group("FavoriteService tests for creating a new favorite", () {
    late FavoriteService mockService;
    late FavoriteController favoriteController;
    int userId = 1;
    int restaurantId = 1;

    setUp(() {
      mockService = MockFavoriteService();
      favoriteController = FavoriteController(mockService);
    });

    test(
        "Should return a JSON object with the favorite restaurant's info when the service return a HTTP 200 OK",
        () async {
      when(mockService.postUserFavorite(userId, restaurantId))
          .thenAnswer((_) async => http.Response('''
              {
                "id": 1,
                "usuario_id": $userId,
                "restaurante_id": $restaurantId
              }
              ''', 200));

      Map<String, dynamic> jsonResponse =
          await favoriteController.createFavorite(userId, restaurantId);

      expect(jsonResponse.containsKey("error"), false);

      expect(jsonResponse['usuario_id'], userId);
      expect(jsonResponse['restaurante_id'], restaurantId);
    });

    test(
        "Should return a JSON object {'error': 'Não foi possível favoritar o restaurante neste momento'} when the service returns an HTTP 400 Bad Request",
        () async {
      when(mockService.postUserFavorite(userId, restaurantId))
          .thenAnswer((_) async => http.Response("Bad Request", 400));

      Map<String, dynamic> jsonResponse =
          await favoriteController.createFavorite(userId, restaurantId);

      expect(jsonResponse['error'],
          'Não foi possível favoritar o restaurante neste momento');
    });
  });

  group("ReservationController tests for fetching a user's favorites", () {
    late FavoriteService mockService;
    late FavoriteController favoriteController;
    int userId = 1;

    setUp(() {
      mockService = MockFavoriteService();
      favoriteController = FavoriteController(mockService);
    });

    test(
        "Should return a JSON object with the reservation's info when the service return a HTTP 200 OK",
        () async {
      when(mockService.getUserFavorites(userId))
          .thenAnswer((_) async => http.Response('''
        [
          {
            "id": 1,
            "usuario_id": 1,
            "restaurante_id": 1
          },
          {
            "id": 2,
            "usuario_id": 1,
            "restaurante_id": 2
          }
        ]
        ''', 200));

      List<Map<String, dynamic>> jsonResponse =
          await favoriteController.getFavorites(userId);

      expect(jsonResponse[0].containsKey("error"), false);

      expect(jsonResponse[0]['id'], 1);
      expect(jsonResponse[0]['usuario_id'], userId);

      expect(jsonResponse[1]['id'], 2);
      expect(jsonResponse[1]['usuario_id'], userId);
    });
  });
}

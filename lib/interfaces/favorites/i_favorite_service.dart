import 'package:http/http.dart' as http;

abstract class IFavoriteService{
  Future<http.Response> getUserFavorites(int userId);
  Future<http.Response> postUserFavorite(int userId, int restaurantId);
}
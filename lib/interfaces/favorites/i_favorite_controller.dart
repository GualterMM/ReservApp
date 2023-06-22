abstract class IFavoriteController{
  Future<Map<String, dynamic>> createFavorite(int userId, int restaurantId);
  Future<List<Map<String, dynamic>>> getFavorites(int userId);
}
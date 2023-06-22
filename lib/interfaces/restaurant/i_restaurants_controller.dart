abstract class IRestaurantController{
  Future<List<Map<String, dynamic>>> showRestaurants();
  Future<List<Map<String, dynamic>>> showRestaurantsByType(String type);
  Future<Map<String, dynamic>> showRestaurantByName(String name);
}
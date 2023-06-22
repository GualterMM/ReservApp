abstract class IRestaurantController{
  Future<List<Map<String, dynamic>>> showRestaurants();
  Future<List<Map<String, dynamic>>> showRestaurantsByType(String type);
  Future<List<Map<String, dynamic>>> showRestaurantByName(String name);
  Future<Map<String, dynamic>> showRestaurantById(int id);
}
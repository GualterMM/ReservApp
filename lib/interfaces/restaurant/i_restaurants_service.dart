import 'package:http/http.dart' as http;

abstract class IRestaurantService{
  Future<http.Response> getRestaurants();
  Future<http.Response> getRestaurantsByType(String type);
  Future<http.Response> getRestaurantByName(String name);
  Future<http.Response> getRestaurantById(int restaurantId);

}
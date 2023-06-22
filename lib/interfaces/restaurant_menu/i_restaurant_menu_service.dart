import 'package:http/http.dart' as http;

abstract class IRestaurantMenuService{
  Future<http.Response> getItems(String restaurantId);
}
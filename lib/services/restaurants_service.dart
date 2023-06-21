import 'package:reservapp/interfaces/restaurant/i_restaurants_service.dart';
import 'package:reservapp/routes/router.dart' as router;
import 'package:reservapp/assets/constants/consts.dart' as constants;
import "package:http/http.dart" as http;

class RestaurantsService implements IRestaurantService {
  http.Client client;
  late http.Response response;

  RestaurantsService(this.client);

  @override
  Future<http.Response> getRestaurantByName(String name) async {
    try{
      response = await client.get(router.listRestaurantByNameRoute(constants.LOCAL_HOST, name));
    } catch(e){
      rethrow;
    }

    if(response.statusCode != 200){
      throw Exception('${response.statusCode} - ${response.body}');
    }

    return response;
  }

  @override
  Future<http.Response> getRestaurantsByType(String type) async {
    try{
      response = await client.get(router.listRestaurantsByTypeRoute(constants.LOCAL_HOST, {'q' : type}));
    } catch(e){
      rethrow;
    }

    if(response.statusCode != 200){
      throw Exception('${response.statusCode} - ${response.body}');
    }

    return response;
  }

  @override
  Future<http.Response> getRestaurants() async {
    try{
      response = await client.get(router.listRestaurantsRoute(constants.LOCAL_HOST));
    } catch(e){
      rethrow;
    }

    if(response.statusCode != 200){
      throw Exception('${response.statusCode} - ${response.body}');
    }

    return response;
  }

}
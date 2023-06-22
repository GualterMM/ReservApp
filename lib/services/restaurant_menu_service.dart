import 'package:reservapp/interfaces/restaurant_menu/i_restaurant_menu_service.dart';
import 'package:reservapp/routes/router.dart' as router;
import 'package:reservapp/assets/constants/consts.dart' as constants;
import "package:http/http.dart" as http;

class RestaurantMenuService implements IRestaurantMenuService{
  http.Client client;
  late http.Response response;

  RestaurantMenuService(this.client);

  @override
  Future<http.Response> getItems(String restaurantId) async {
    try{
      response = await client.get(router.listItemsByRestaurant(constants.LOCAL_HOST, {'q' : restaurantId}));
    } catch(e){
      rethrow;
    }

    return response;
  }
}
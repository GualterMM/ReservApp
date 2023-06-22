import 'package:reservapp/interfaces/favorites/i_favorite_service.dart';
import 'package:reservapp/routes/router.dart' as router;
import 'package:reservapp/assets/constants/consts.dart' as constants;
import "package:http/http.dart" as http;

class FavoriteService implements IFavoriteService{
  http.Client client;
  late http.Response response;

  FavoriteService(this.client);


  @override
  Future<http.Response> getUserFavorites(int userId) async {
    try{
      response = await client.get(router.listFavorites(constants.LOCAL_HOST, {'q' : userId.toString()}));
    } catch(e){
      rethrow;
    }

    return response;
  }

  @override
  Future<http.Response> postUserFavorite(int userId, int restaurantId) async {
    try{
      response = await client.post(router.postFavorite(constants.LOCAL_HOST), body: {
        "usuario_id": userId,
        "restaurante_id": restaurantId
      });
    } catch(e){
      rethrow;
    }

    return response;
  }

}
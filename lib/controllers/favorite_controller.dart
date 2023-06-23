import 'dart:convert';
import 'package:reservapp/interfaces/favorites/i_favorite_controller.dart';
import 'package:reservapp/services/favorite_service.dart';
import 'package:http/http.dart' as http;

class FavoriteController implements IFavoriteController{
  FavoriteService service;
  late http.Response response;

  FavoriteController(this.service);

  @override
  Future<Map<String, dynamic>> createFavorite(int userId, int restaurantId) async {
    dynamic jsonResponse;

    try{
      response = await service.postUserFavorite(userId, restaurantId);
    } catch(e){
      jsonResponse = e.toString();
    }

    if(response.statusCode == 200){
      jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    } else{
      return _errorHandler(response)[0];
    }

    return jsonResponse;
  }

  @override
  Future<List<Map<String, dynamic>>> getFavorites(int userId) async {
    dynamic jsonResponse;

    try{
      response = await service.getUserFavorites(userId);
    } catch(e){
      jsonResponse = e.toString();
    }

    if(response.statusCode == 200){
      final List data = json.decode(utf8.decode(response.bodyBytes));
      final List<Map<String, dynamic>> favorites = List<Map<String, dynamic>>.from(data);
      jsonResponse = favorites;
    } else{
      return _errorHandler(response);
    }

    return jsonResponse;
  }

  List<Map<String, dynamic>> _errorHandler(http.Response response){
    switch(response.statusCode){
      case 400:
        return [{'error': 'Não foi possível favoritar o restaurante neste momento'}];
      case 500:
        return [{'error': 'Erro na conexão com o servidor'}];
      default:
        return [{'error': 'Erro ${response.statusCode} - ${response.body}'}];
    }
  }


}
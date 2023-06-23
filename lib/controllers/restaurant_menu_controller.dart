import 'dart:convert';
import 'package:reservapp/interfaces/restaurant_menu/i_restaurant_menu_controller.dart';
import 'package:reservapp/services/restaurant_menu_service.dart';
import 'package:http/http.dart' as http;

class RestaurantMenuController implements IRestaurantMenuController{
  RestaurantMenuService service;
  late http.Response response;

  RestaurantMenuController(this.service);
  
  @override
  Future<List<Map<String, dynamic>>> showItems(String restaurantId) async {
    dynamic jsonResponse;

    try{
      response = await service.getItems(restaurantId);
    } catch(e){
      jsonResponse = e.toString();
    }

    if(response.statusCode == 200){
      final List data = json.decode(utf8.decode(response.bodyBytes));
      final List<Map<String, dynamic>> items = List<Map<String, dynamic>>.from(data);
      jsonResponse = items;
    } else{
      return _errorHandler(response);
    }

    return jsonResponse;
  }

  List<Map<String, dynamic>> _errorHandler(http.Response response){
    switch(response.statusCode){
      case 404:
        return [{'error': 'Não existem items disponíveis para esse restaurante'}];
      case 500:
        return [{'error': 'Erro na conexão com o servidor'}];
      default:
        return [{'error': 'Erro ${response.statusCode} - ${response.body}'}];
    }
  }
  
}
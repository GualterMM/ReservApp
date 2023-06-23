import 'dart:convert';
import 'package:reservapp/interfaces/restaurant/i_restaurants_controller.dart';
import 'package:reservapp/services/restaurants_service.dart';
import 'package:http/http.dart' as http;

class RestaurantsController implements IRestaurantController{
  RestaurantsService service;
  late http.Response response;

  RestaurantsController(this.service);

  @override
  Future<List<Map<String, dynamic>>> showRestaurants() async {
    dynamic jsonResponse;

    try{
      response = await service.getRestaurants();
    } catch(e){
      jsonResponse = e.toString();
    }

    if(response.statusCode == 200){
      try{
        final List data = json.decode(utf8.decode(response.bodyBytes));
        final List<Map<String, dynamic>> restaurants = List<Map<String, dynamic>>.from(data);
        jsonResponse = restaurants;
      } on FormatException catch (e){
        throw e.message;
      }
    } else{
      return _errorHandler(response);
    }

    return jsonResponse;
  }

  @override
  Future<List<Map<String, dynamic>>> showRestaurantByName(String name) async {
    dynamic jsonResponse;

    try{
      response = await service.getRestaurantByName(name);
    } catch(e){
      jsonResponse = e.toString();
    }

    if(response.statusCode == 200){
      final List data = json.decode(utf8.decode(response.bodyBytes));
      final List<Map<String, dynamic>> restaurant = List<Map<String, dynamic>>.from(data);
      jsonResponse = restaurant;
    } else{
      return _errorHandler(response);
    }

    return jsonResponse;
  }

  @override
  Future<List<Map<String, dynamic>>> showRestaurantsByType(String type) async {
    dynamic jsonResponse;

    try{
      response = await service.getRestaurantsByType(type);
    } catch(e){
      jsonResponse = e.toString();
    }

    if(response.statusCode == 200){
      final List data = json.decode(utf8.decode(response.bodyBytes));
      final List<Map<String, dynamic>> restaurants = List<Map<String, dynamic>>.from(data);
      jsonResponse = restaurants;
    } else{
      return _errorHandler(response);
    }

    return jsonResponse;
  }


  @override
  Future<Map<String, dynamic>> showRestaurantById(int id) async {
    dynamic jsonResponse;

    try{
      response = await service.getRestaurantById(id);
    } catch(e){
      jsonResponse = e.toString();
    }

    if(response.statusCode == 200){
      jsonResponse = json.decode(latin1.decode(response.bodyBytes));
    } else{
      return _errorHandler(response)[0];
    }

    return jsonResponse;
  }

  List<Map<String, dynamic>> _errorHandler(http.Response response){
    switch(response.statusCode){
      case 404:
        return [{'error': 'Não existem restaurantes disponíveis para listagem'}];
      case 500:
        return [{'error': 'Erro na conexão com o servidor'}];
      default:
        return [{'error': 'Erro ${response.statusCode} - ${response.body}'}];
    }
  }

}
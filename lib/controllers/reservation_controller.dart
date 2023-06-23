import 'dart:convert';
import 'package:reservapp/interfaces/reservation/i_reservation_controller.dart';
import 'package:reservapp/services/reservation_service.dart';
import 'package:http/http.dart' as http;

class ReservationController implements IReservationController{
  ReservationService service;
  late http.Response response;

  ReservationController(this.service);

  @override
  Future<Map<String, dynamic>> createReservation(String date, String time, int guests, int userId, int restaurantId) async {
    dynamic jsonResponse;

    try{
      response = await service.postUserReservation(date, time, guests, userId, restaurantId);
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

  @override
  Future<List<Map<String, dynamic>>> getReservations(int userId) async {
    dynamic jsonResponse;

    try{
      response = await service.getUserReservations(userId);
    } catch(e){
      jsonResponse = e.toString();
    }

    if(response.statusCode == 200){
      final List data = json.decode(latin1.decode(response.bodyBytes));
      final List<Map<String, dynamic>> reservations = List<Map<String, dynamic>>.from(data);
      jsonResponse = reservations;
    } else{
      return _errorHandler(response);
    }

    return jsonResponse;
  }

  List<Map<String, dynamic>> _errorHandler(http.Response response){
    switch(response.statusCode){
      case 400:
        return [{'error': 'Não foi possível criar uma reserva neste momento'}];
      case 500:
        return [{'error': 'Erro na conexão com o servidor'}];
      default:
        return [{'error': 'Erro ${response.statusCode} - ${response.body}'}];
    }
  }

}
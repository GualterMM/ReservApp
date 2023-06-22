import 'package:reservapp/interfaces/reservation/i_reservation_service.dart';
import 'package:reservapp/routes/router.dart' as router;
import 'package:reservapp/assets/constants/consts.dart' as constants;
import "package:http/http.dart" as http;

class ReservationService implements IReservationService{
  http.Client client;
  late http.Response response;

  ReservationService(this.client);

  @override
  Future<http.Response> getUserReservations(int userId) async {
    try{
      response = await client.get(router.listReservations(constants.LOCAL_HOST, {'q' : userId.toString()}));
    } catch(e){
      rethrow;
    }

    return response;
  }

  @override
  Future<http.Response> postUserReservation(String date, String time, int guests, int userId, int restaurantId) async {
    try{
      response = await client.post(router.postReservation(constants.LOCAL_HOST), body: {
        "data": date,
        "horario": time,
        "numeroPessoas": guests,
        "usuario_id": userId,
        "restaurante_id": restaurantId
      });
    } catch(e){
      rethrow;
    }

    return response;
  }
  
}
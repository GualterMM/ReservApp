import 'package:http/http.dart' as http;

abstract class IReservationService{
  Future<http.Response> getUserReservations(int userId);
  Future<http.Response> postUserReservation(String date, String time, int guests, int userId, int restaurantId);
}
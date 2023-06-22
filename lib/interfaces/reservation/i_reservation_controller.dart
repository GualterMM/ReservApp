abstract class IReservationController{
  Future<Map<String, dynamic>> createReservation(String date, String time, int guests, int userId, int restaurantId);
  Future<List<Map<String, dynamic>>> getReservations(int userId);
}
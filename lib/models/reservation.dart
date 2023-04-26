class Reservation {
  final int idReservation;
  final String date;
  final String time;
  final int guests;
  final int userId;
  final int restaurantId;

  Reservation(
      this.idReservation,
      this.date,
      this.time,
      this.guests,
      this.userId,
      this.restaurantId);
}
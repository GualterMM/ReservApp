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
      this.restaurantId
      );

  Reservation.fromJson(Map<String, dynamic> json):
      idReservation = json['id'],
      date = json['data'],
      time = json['horario'],
      guests = json['numeroPessoas'],
      userId = json['usuario_id'],
      restaurantId = json['restaurante_id'];

  Map<String, dynamic> toJson() => {
    "data" : date,
    "hora" : time,
    "numeroPessoas" : guests,
    "usuario_id" : userId,
    "restaurante_id" : restaurantId,
  };
}
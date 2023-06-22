class Reservation {
  final int idReservation;
  final String date;
  final String time;
  final int guests;
  final int userId;
  final String restaurantName;

  Reservation(
      this.idReservation,
      this.date,
      this.time,
      this.guests,
      this.userId,
      this.restaurantName
      );

  Reservation.fromJson(Map<String, dynamic> json):
      idReservation = json['id'],
      date = json['data'],
      time = json['horario'],
      guests = json['numeroPessoas'],
      userId = json['usuario_id'],
      restaurantName = json['restaurante_nome'];

  Map<String, dynamic> toJson() => {
    "data" : date,
    "hora" : time,
    "numeroPessoas" : guests,
    "usuario_id" : userId,
    "restaurante_id" : restaurantName,
  };
}
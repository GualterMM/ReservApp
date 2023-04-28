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
      idReservation = json['idReserva'],
      date = json['data'],
      time = json['hora'],
      guests = json['numeroPessoas'],
      userId = json['usuario_idUsuario'],
      restaurantName = json['restauranteNome'];

  Map<String, dynamic> toJson() => {
    "data" : date,
    "hora" : time,
    "numeroPessoas" : guests,
    "usuario_idUsuario" : userId,
    "restauranteNome" : restaurantName
  };
}
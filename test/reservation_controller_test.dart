import 'package:mockito/mockito.dart';
import 'package:reservapp/controllers/reservation_controller.dart';
import 'package:reservapp/models/reservation.dart';
import 'package:reservapp/services/reservation_service.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'reservation_controller_test.mocks.dart';

@GenerateMocks([ReservationService])
void main() {
  group("ReservationController tests for creating a new reservation", () {
    late ReservationService mockService;
    late ReservationController reservationController;
    Reservation reservation = Reservation(1, '2023-06-20', '20:00', 2, 1, 1);

    setUp(() {
      mockService = MockReservationService();
      reservationController = ReservationController(mockService);
    });

    test(
        "Should return a JSON object with the reservation's info when the service return a HTTP 200 OK",
        () async {
      when(mockService.postUserReservation(reservation.date, reservation.time,
              reservation.guests, reservation.userId, reservation.restaurantId))
          .thenAnswer((_) async => http.Response('''
        {
          "id": ${reservation.idReservation},
          "data": "${reservation.date}",
          "horario": "${reservation.time}",
          "numeroPessoas": ${reservation.guests},
          "usuario_id": ${reservation.userId},
          "restaurante_id": ${reservation.restaurantId}
        }
        ''', 200));

      Map<String, dynamic> jsonResponse =
          await reservationController.createReservation(
              reservation.date,
              reservation.time,
              reservation.guests,
              reservation.userId,
              reservation.restaurantId);

      expect(jsonResponse.containsKey("error"), false);

      expect(jsonResponse['usuario_id'], reservation.userId);
      expect(jsonResponse['restaurante_id'], reservation.restaurantId);
    });

    test(
        "Should return a JSON object {'error': 'Não foi possível criar uma reserva neste momento'} when the service returns an HTTP 400 Bad Request",
        () async {
      when(mockService.postUserReservation(reservation.date, reservation.time,
              reservation.guests, reservation.userId, reservation.restaurantId))
          .thenAnswer((_) async => http.Response("Bad Request", 400));

      Map<String, dynamic> jsonResponse =
          await reservationController.createReservation(
              reservation.date,
              reservation.time,
              reservation.guests,
              reservation.userId,
              reservation.restaurantId);

      expect(jsonResponse['error'],
          'Não foi possível criar uma reserva neste momento');
    });
  });

  group("ReservationController tests for fetching a user's reservations", () {
    late ReservationService mockService;
    late ReservationController reservationController;
    int userId = 1;

    setUp(() {
      mockService = MockReservationService();
      reservationController = ReservationController(mockService);
    });

    test(
        "Should return a JSON object with the reservation's info when the service return a HTTP 200 OK",
        () async {
      when(mockService.getUserReservations(userId))
          .thenAnswer((_) async => http.Response('''
        [
          {
            "id": 1,
            "data": "2023-06-22",
            "horario": "22:30:00",
            "numeroPessoas": 2,
            "usuario_id": 1,
            "restaurante_id": 1
          },
          {
            "id": 2,
            "data": "2023-07-22",
            "horario": "22:30:00",
            "numeroPessoas": 2,
            "usuario_id": 1,
            "restaurante_id": 2
          }
        ]
        ''', 200));

      List<Map<String, dynamic>> jsonResponse =
          await reservationController.getReservations(userId);

      expect(jsonResponse[0].containsKey("error"), false);

      expect(jsonResponse[0]['id'], 1);
      expect(jsonResponse[0]['usuario_id'], userId);

      expect(jsonResponse[1]['id'], 2);
      expect(jsonResponse[1]['usuario_id'], userId);
    });
  });
}

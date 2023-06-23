import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/reserve_card.dart';
import 'package:reservapp/models/reservation.dart';

import '../assets/widgets/back_button.dart';

class CheckReservations extends StatelessWidget{
  const CheckReservations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: TelaReservas(),),
    );
  }

}

class TelaReservas extends StatelessWidget{
  TelaReservas({super.key});

  late List<Reservation> reservationList = [
    // TODO: Consertar o nome no Card da Reserva
    Reservation(1, "25-06-2023", "20:30", 4, 1, "Vereda"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 3,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: backButton(context)
                )
            ),
            const Expanded(
                flex: 7,
                child: Text(
                  "Minhas Reservas",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          height: 500,
          child: listReservations(reservationList),
        ),
      ],
    );
  }

}

Widget listReservations(List<Reservation> reservationList){
  // TODO: Pegar restaurantes na nuvem

  // TODO: Associar os dados aos modelos

  // Criar componente
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: reservationList.length,
      itemBuilder: (BuildContext context, int index) {
        return reserveCard(reservationList[index]);
      }
  );
}
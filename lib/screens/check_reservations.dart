import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/reserve_card.dart';

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
  const TelaReservas({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              reserveCard("Costela no Bafo", "04:00", "5")
            ],
          ),
        ),
      ],
    );
  }

}
import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/small_info_container.dart';
import 'package:reservapp/models/reservation.dart';

Widget reserveCard (name, date, time, guests){
  Map<String, dynamic> dayMonth = getDayMonth(date);

  return SizedBox(
    height: 100,
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(dayMonth["day"], textScaleFactor: 2.0,),
                  Text(dayMonth["month"]),
                ],
              )
          ),
          Expanded(flex: 5, child: Text(name)),
          Expanded(
              flex: 3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  smallInfoContainer(Icons.timelapse, time),
                  smallInfoContainer(Icons.people, guests),
                ]
              )
          ),
        ],
      ),
    ),
  );
}

Map<String, dynamic> getDayMonth (Reservation reservation){
  String day = reservation.date.substring(0,2);
  String month = reservation.date.substring(3, 5);

  switch(month){
    case "01":
      month = "JAN";
      break;
    case "02":
      month = "FEV";
      break;
    case "03":
      month = "MAR";
      break;
    case "04":
      month = "ABR";
      break;
    case "05":
      month = "MAI";
      break;
    case "06":
      month = "JUN";
      break;
    case "07":
      month = "JUL";
      break;
    case "08":
      month = "AGO";
      break;
    case "09":
      month = "SET";
      break;
    case "10":
      month = "OUT";
      break;
    case "11":
      month = "NOV";
      break;
    case "12":
      month = "DEZ";
      break;
    default:
      month = "IND";
  }

  return {"day": day, "month": month};
}